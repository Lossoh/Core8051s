--============================================================================
--
--  CoreTimer
--
--============================================================================

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_unsigned."+";
use     ieee.std_logic_unsigned."-";

entity CoreTimer is
    generic(
        WIDTH       : integer := 32; -- Width can be 16 or 32
        INTACTIVEH  : integer := 1   -- 1 = active high interrupt, 0 = active low
    );
    port(
        PCLK        : in  std_logic;                        -- APB clock
        PRESETn     : in  std_logic;                        -- APB reset
        PENABLE     : in  std_logic;                        -- APB enable
        PSEL        : in  std_logic;                        -- APB periph select
        PADDR       : in  std_logic_vector(4 downto 2);     -- APB address bus
        PWRITE      : in  std_logic;                        -- APB write
        PWDATA      : in  std_logic_vector(31 downto 0);    -- APB write data
        PRDATA      : out std_logic_vector(31 downto 0);    -- APB read data
        TIMINT      : out std_logic                         -- Timer interrupt
    );
end CoreTimer;

architecture synth of CoreTimer is

    -------------------------------------------------------------------------------
    -- Constant declarations
    -------------------------------------------------------------------------------
    -- Register addresses

    -- Timer base address prefixes
    constant TIMERLOADA     : std_logic_vector(4 downto 2) := "000";
    constant TIMERVALUEA    : std_logic_vector(4 downto 2) := "001";
    constant TIMERCONTROLA  : std_logic_vector(4 downto 2) := "010";
    constant TIMERPRESCALEA : std_logic_vector(4 downto 2) := "011";
    constant TIMERCLEARA    : std_logic_vector(4 downto 2) := "100";
    constant TIMERINTRAWA   : std_logic_vector(4 downto 2) := "101";
    constant TIMERINTA      : std_logic_vector(4 downto 2) := "110";

    -------------------------------------------------------------------------------
    -- Signal declarations
    -------------------------------------------------------------------------------
    signal PrdataNext       : std_logic_vector(31 downto 0);        -- Internal PRDATA
    signal iPRDATA          : std_logic_vector(31 downto 0);        -- Regd PrdataNext
    signal PrdataNextEn     : std_logic;                            -- PRDATAEn register input
    signal DataOut          : std_logic_vector(31 downto 0);

    signal CtrlEn           : std_logic;                            -- Ctrl write enable
    signal CtrlReg          : std_logic_vector(2 downto 0);         -- Control register

    signal TimerMode        : std_logic;                            -- Timer operation mode
    signal IntEnable        : std_logic;                            -- Interrupt enable
    signal TimerEn          : std_logic;                            -- Timer enable

    signal OneShot          : std_logic;                            -- Asserted when TimerMode = 1
    signal OneShotClr       : std_logic;                            --

    signal PrescaleEn       : std_logic;                            -- Prescale reg write enable
    signal TimerPre         : std_logic_vector(3 downto 0);         -- Prescale register

    signal LoadEn           : std_logic;                            -- Load write enable
    signal LoadEnReg        : std_logic;                            -- Registered load enable
    signal Load             : std_logic_vector(WIDTH-1 downto 0);   -- Stores the load value

    signal PreScale         : std_logic_vector(9 downto 0);         -- Prescale counter

    signal Count            : std_logic_vector(WIDTH-1 downto 0);   -- Current count
    signal ZeroCount        : std_logic_vector(WIDTH-1 downto 0);

    signal IntClrEn         : std_logic;                            -- Interrupt Clear enable
    signal IntClr           : std_logic;

    signal NxtRawTimInt     : std_logic;                            -- iTimInt next value
    signal RawTimInt        : std_logic;                            -- Registered internal counter interrupt
    signal iTimInt          : std_logic;                            -- Internal version of interrupt output

    signal CountIsZero      : std_logic;
    signal CountIsZeroReg   : std_logic;
    signal TimeOut          : std_logic;

    signal CountPulse       : std_logic;
    signal NextCountPulse   : std_logic;

    -------------------------------------------------------------------------------
    -- Beginning of main code
    -------------------------------------------------------------------------------
    begin

    -------------------------------------------------------------------------------
    -- Signal assignments
    -------------------------------------------------------------------------------
    ZeroCount <= (others => '0');

    -------------------------------------------------------------------------------
    -- Control Register
    -------------------------------------------------------------------------------
    -- Functions of bits/bit fields of Control Register are:
    --   2 - Timer mode
    --   1 - Interrupt enable
    --   0 - Timer enable

    -- Control register write enable
    CtrlEn <=   '1' when (PWRITE = '1' and PSEL = '1' and PENABLE = '0'
                        and (PADDR = TIMERCONTROLA))
                else '0';

    -- Control register
    p_CtrlSeq : process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            CtrlReg <= (others => '0');
        elsif (PCLK'event and PCLK = '1') then
            if (CtrlEn = '1') then
                CtrlReg <= PWDATA (2 downto 0);
            end if;
        end if;
    end process p_CtrlSeq;

    -- Assign control bits/fields
    TimerMode <= CtrlReg (2);
    IntEnable <= CtrlReg (1);
    TimerEn   <= CtrlReg (0);

    OneShot <= '1' when (TimerMode = '1') else '0';

    -- OneShotClr asserted when clearing one shot bit and counter has reached zero.
    OneShotClr <=   '1' when (CountIsZero = '1' and OneShot = '1' and CtrlEn = '1'
                            and PWDATA(4) = '0')
                    else '0';

    -------------------------------------------------------------------------------
    -- Prescale Register
    -------------------------------------------------------------------------------
    -- Prescale register write enable
    PrescaleEn <=   '1' when (PWRITE = '1' and PSEL = '1' and PENABLE = '0'
                        and (PADDR = TIMERPRESCALEA))
                    else '0';

    -- Prescale register
    p_TimerPreSeq : process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            TimerPre <= "0000";
        elsif (PCLK'event and PCLK = '1') then
            if (PrescaleEn = '1') then
                TimerPre <= PWDATA (3 downto 0);
            end if;
        end if;
    end process p_TimerPreSeq;

    -------------------------------------------------------------------------------
    -- Load Register
    -------------------------------------------------------------------------------
    -- Decode a TimerLoad write transaction
    LoadEn <=   '1' when (PWRITE = '1' and PSEL = '1' and PENABLE = '0'
                        and (PADDR = TIMERLOADA))
                else '0';

    -- Register LoadEn so it is aligned with the data in the Load register
    p_LoadEnSeq : process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            LoadEnReg <= '0';
        elsif (PCLK'event and PCLK = '1') then
            LoadEnReg <= LoadEn;
        end if;
    end process p_LoadEnSeq;

    -- Load register implementation
    p_LoadSeq : process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            Load <= (others => '0');
        elsif (PCLK'event and PCLK = '1') then
            if (LoadEn = '1') then
                Load <= PWDATA(WIDTH-1 downto 0);
            end if;
        end if;
    end process p_LoadSeq;

    -------------------------------------------------------------------------------
    -- Timer clock prescaler
    -------------------------------------------------------------------------------
    p_PrescalerSeq : process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            PreScale <= (others => '0');
        elsif (PCLK'event and PCLK = '1') then
            if (LoadEnReg = '1' or OneShotClr = '1') then
                -- Set to zero for new value/one-shot clear
                PreScale <= (others => '0');
            else
                PreScale <= PreScale + '1';
            end if;
        end if;
    end process p_PrescalerSeq;

    p_NextCountPulseComb : process (PreScale, TimerPre)
    begin
        NextCountPulse <= '0';
        case TimerPre is
            when "0000" =>  if (PreScale(0) = '1') then
                                NextCountPulse <= '1';
                            end if;
            when "0001" =>  if (PreScale(1 downto 0) = "11") then
                                NextCountPulse <= '1';
                            end if;
            when "0010" =>  if (PreScale(2 downto 0) = "111") then
                                NextCountPulse <= '1';
                            end if;
            when "0011" =>  if (PreScale(3 downto 0) = "1111") then
                                NextCountPulse <= '1';
                            end if;
            when "0100" =>  if (PreScale(4 downto 0) = "11111") then
                                NextCountPulse <= '1';
                            end if;
            when "0101" =>  if (PreScale(5 downto 0) = "111111") then
                                NextCountPulse <= '1';
                            end if;
            when "0110" =>  if (PreScale(6 downto 0) = "1111111") then
                                NextCountPulse <= '1';
                            end if;
            when "0111" =>  if (PreScale(7 downto 0) = "11111111") then
                                NextCountPulse <= '1';
                            end if;
            when "1000" =>  if (PreScale(8 downto 0) = "111111111") then
                                NextCountPulse <= '1';
                            end if;
            when "1001" =>  if (PreScale(9 downto 0) = "1111111111") then
                                NextCountPulse <= '1';
                            end if;
            when others =>  if (PreScale(9 downto 0) = "1111111111") then
                                NextCountPulse <= '1';
                            end if;
        end case;
    end process p_NextCountPulseComb;

    p_CountPulseSeq : process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            CountPulse <= '0';
        elsif (PCLK'event and PCLK = '1') then
            CountPulse <= NextCountPulse;
        end if;
    end process p_CountPulseSeq;

    -------------------------------------------------------------------------------
    -- Counter register
    -------------------------------------------------------------------------------
    p_CountSeq : process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            Count <= (others => '1');
        elsif (PCLK'event and PCLK = '1') then
            if (LoadEnReg = '1' or OneShotClr = '1') then
                -- Re-start for new value or one-shot clear
                Count <= Load;
            else
                if (TimerEn = '1' and CountPulse = '1') then
                    if (CountIsZero = '1') then
                        if (OneShot = '1') then
                            Count <= Count;
                        else
                            Count <= Load;
                        end if;
                    else
                        Count <= Count - '1';
                    end if;
                end if;
            end if;
        end if;
    end process p_CountSeq;

    CountIsZero <=  '1' when (Count = ZeroCount) else '0';

    p_CountIsZeroSeq : process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            CountIsZeroReg <= '0';
        elsif (PCLK'event and PCLK = '1') then
            CountIsZeroReg <= CountIsZero;
        end if;
    end process p_CountIsZeroSeq;

    TimeOut <=  '1' when (CountIsZero = '1' and CountIsZeroReg = '0') else '0';

    -------------------------------------------------------------------------------
    -- Interrupt generation
    -------------------------------------------------------------------------------
    -- The interrupt is generated (set HIGH) when the counter reaches zero.
    -- The interrupt is cleared (set LOW) when the TimerClear address is
    --  written to.

    NxtRawTimInt <= '1' when ((TimeOut = '1' or RawTimInt = '1') and IntClr = '0')
                    else '0';

    -- Register and hold interrupt until cleared.  TIMCLK is used to
    -- ensure that an interrupt is still generated even if PCLK is disabled.
    p_IntSeq : process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            RawTimInt <= '0';
        elsif (PCLK'event and PCLK = '1') then
            RawTimInt <= NxtRawTimInt;
        end if;
    end process p_IntSeq;

    -- Gate raw interrupt with enable bit
    iTimInt <=  '1' when (RawTimInt = '1' and IntEnable = '1')
                else '0';

    -- Drive interrupt output with internal signal
    -- Interrupt can be active high or low depending on INTACTIVEH
    TIMINT <=   iTimInt when (INTACTIVEH = 1)
                else not(iTimInt);

    -------------------------------------------------------------------------------
    -- Interrupt clear
    -------------------------------------------------------------------------------
    IntClrEn <= '1' when (PWRITE = '1' and PSEL = '1' and PENABLE = '0'
                        and (PADDR = TIMERCLEARA))
                else '0';

    p_IntClrSeq : process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            IntClr <= '0';
        elsif (PCLK'event and PCLK = '1') then
            if (IntClrEn = '1') then
                IntClr <= '1';
            else
                IntClr <= '0';
            end if;
        end if;
    end process p_IntClrSeq;

    -------------------------------------------------------------------------------
    -- Output data generation
    -------------------------------------------------------------------------------
    -- Zero data is used as padding for register reads

    p_DataOutComb : process (PWRITE, PSEL, PADDR, Load, Count, CtrlReg,
                             TimerPre, RawTimInt, iTimInt)
    begin

        DataOut <= (others => '0'); -- Drive zeros by default

        if (PWRITE = '0' and PSEL = '1') then
            case PADDR is
                when TIMERLOADA =>
                    DataOut(WIDTH-1 downto 0) <= Load;

                when TIMERVALUEA =>
                    DataOut(WIDTH-1 downto 0) <= Count;

                when TIMERCONTROLA =>
                    DataOut(2 downto 0) <= CtrlReg;

                when TIMERPRESCALEA =>
                    DataOut(3 downto 0) <= TimerPre;

                when TIMERINTRAWA =>
                    DataOut(0) <= RawTimInt;

                when TIMERINTA =>
                    DataOut(0) <= iTimInt;

                when others =>
                    DataOut <= (others => '0');
            end case;
        else
            DataOut <= (others => '0');
        end if;
    end process p_DataOutComb;

    -- Enable for output data.
    PrdataNextEn <= '1' when (PSEL = '1' and PWRITE ='0' and PENABLE = '0')
                    else '0';

    PrdataNext <=   DataOut when (PrdataNextEn = '1') else (others => '0');

    -- Register used to reduce output delay during reads.
    p_iPRDATASeq : process (PRESETn, PCLK)
    begin
        if (PRESETn = '0') then
            iPRDATA <= (others => '0');
        elsif (PCLK'event and PCLK = '1') then
            iPRDATA <= PrdataNext;
        end if;
    end process p_iPRDATASeq;

    -- Drive output with internal version.
    PRDATA <= iPRDATA;

end synth;

--================================= End ===================================--

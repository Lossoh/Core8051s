-- ***************************************************************************************
-- File components.vhd auto-generated by packaging utiltiy on Wed Aug 26 06:08:04 2009 GMT
-- ***************************************************************************************

library ieee;
use ieee.std_logic_1164.all;

package components is
component CoreGPIO 
  GENERIC (
    FAMILY    : INTEGER RANGE 0 TO 63:= 17;
    IO_NUM    : INTEGER RANGE 1 TO 32 := 32;
    APB_WIDTH : INTEGER RANGE 8 TO 32 := 32;
    OE_TYPE : INTEGER RANGE 0 TO 1 := 0;
    INT_BUS : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_0 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_1 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_2 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_3 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_4 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_5 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_6 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_7 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_8 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_9 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_10 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_11 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_12 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_13 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_14 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_15 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_16 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_17 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_18 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_19 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_20 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_21 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_22 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_23 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_24 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_25 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_26 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_27 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_28 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_29 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_30 : INTEGER RANGE 0 TO 1 := 0;
    FIXED_CONFIG_31 : INTEGER RANGE 0 TO 1 := 0;
    IO_TYPE_0 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_1 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_2 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_3 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_4 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_5 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_6 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_7 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_8 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_9 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_10 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_11 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_12 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_13 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_14 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_15 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_16 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_17 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_18 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_19 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_20 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_21 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_22 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_23 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_24 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_25 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_26 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_27 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_28 : INTEGER RANGE 0 TO 2 := 0;  
    IO_TYPE_29 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_30 : INTEGER RANGE 0 TO 2 := 0;
    IO_TYPE_31 : INTEGER RANGE 0 TO 2 := 0;
    IO_INT_TYPE_0 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_1 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_2 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_3 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_4 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_5 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_6 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_7 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_8 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_9 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_10 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_11 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_12 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_13 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_14 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_15 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_16 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_17 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_18 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_19 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_20 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_21 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_22 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_23 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_24 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_25 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_26 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_27 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_28 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_29 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_30 : INTEGER RANGE 0 TO 7 := 0;
    IO_INT_TYPE_31 : INTEGER RANGE 0 TO 7 := 0;
    IO_VAL_0  : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_1  : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_2  : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_3  : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_4  : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_5  : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_6  : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_7  : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_8  : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_9  : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_10 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_11 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_12 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_13 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_14 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_15 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_16 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_17 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_18 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_19 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_20 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_21 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_22 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_23 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_24 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_25 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_26 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_27 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_28 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_29 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_30 : INTEGER RANGE 0 TO 1 := 0;
    IO_VAL_31 : INTEGER RANGE 0 TO 1 := 0
  );
  PORT (
    PRESETN   : IN STD_LOGIC;
    PCLK      : IN STD_LOGIC;
    PSEL      : IN STD_LOGIC;
    PENABLE   : IN STD_LOGIC;
    PWRITE    : IN STD_LOGIC;
    PSLVERR   : OUT STD_LOGIC;
    PREADY    : OUT STD_LOGIC;
    PADDR     : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    PWDATA    : IN STD_LOGIC_VECTOR(APB_WIDTH-1 DOWNTO 0);
    PRDATA    : OUT STD_LOGIC_VECTOR(APB_WIDTH-1 DOWNTO 0);
    INT       : OUT STD_LOGIC_VECTOR(IO_NUM-1 DOWNTO 0);
    INT_OR    : OUT STD_LOGIC;
    GPIO_IN   : IN STD_LOGIC_VECTOR(IO_NUM-1 DOWNTO 0);
    GPIO_OUT  : OUT STD_LOGIC_VECTOR(IO_NUM-1 DOWNTO 0);
    GPIO_OE   : OUT STD_LOGIC_VECTOR(IO_NUM-1 DOWNTO 0)
  );
end component;

end components;
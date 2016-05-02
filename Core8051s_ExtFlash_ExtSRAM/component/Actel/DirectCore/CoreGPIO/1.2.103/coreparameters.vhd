----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Fri Apr 29 17:24:26 2016
-- Parameters for CoreGPIO
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant HDL_license : string( 1 to 1 ) := "U";
    constant NUM_INPUTS : integer := 32;
    constant NUM_OUTPUTS : integer := 32;
end coreparameters;
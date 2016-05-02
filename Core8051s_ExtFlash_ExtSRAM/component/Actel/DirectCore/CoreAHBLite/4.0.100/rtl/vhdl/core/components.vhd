-- ********************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description:	CoreAHBLite - components package
--
-- Revision Information:
-- Date			Description
-- ----			-----------------------------------------
-- 10Feb10		Production Release Version 3.1
--
-- SVN Revision Information:
-- SVN $Revision: 10427 $
-- SVN $Date: 2009-10-25 22:10:50 -0700 (Sun, 25 Oct 2009) $
--
-- Resolved SARs
-- SAR      Date     Who   Description
--
-- Notes:
-- 1. best viewed with tabstops set to "4" (tabs used throughout file)
--
-- *********************************************************************/
library ieee;
use ieee.std_logic_1164.all;

package components is

component CoreAHBLite
generic (
FAMILY					: integer range 0 to 99	:= 17;
MEMSPACE				: integer range 0 to 6	:= 0;
HADDR_SHG_CFG			: integer range 0 to 1	:= 1;
SC_0                    : integer range 0 to 1	:= 1;
SC_1                    : integer range 0 to 1	:= 0;
SC_2                    : integer range 0 to 1	:= 0;
SC_3                    : integer range 0 to 1	:= 0;
SC_4                    : integer range 0 to 1	:= 0;
SC_5                    : integer range 0 to 1	:= 0;
SC_6                    : integer range 0 to 1	:= 0;
SC_7                    : integer range 0 to 1	:= 0;
SC_8                    : integer range 0 to 1	:= 0;
SC_9                    : integer range 0 to 1	:= 0;
SC_10                   : integer range 0 to 1	:= 0;
SC_11                   : integer range 0 to 1	:= 0;
SC_12                   : integer range 0 to 1	:= 0;
SC_13                   : integer range 0 to 1	:= 0;
SC_14                   : integer range 0 to 1	:= 0;
SC_15                   : integer range 0 to 1	:= 0;
M0_AHBSLOT0ENABLE       : integer range 0 to 1	:= 1;
M0_AHBSLOT1ENABLE       : integer range 0 to 1	:= 0;
M0_AHBSLOT2ENABLE       : integer range 0 to 1	:= 0;
M0_AHBSLOT3ENABLE       : integer range 0 to 1	:= 0;
M0_AHBSLOT4ENABLE       : integer range 0 to 1	:= 0;
M0_AHBSLOT5ENABLE       : integer range 0 to 1	:= 0;
M0_AHBSLOT6ENABLE       : integer range 0 to 1	:= 0;
M0_AHBSLOT7ENABLE       : integer range 0 to 1	:= 0;
M0_AHBSLOT8ENABLE       : integer range 0 to 1	:= 0;
M0_AHBSLOT9ENABLE       : integer range 0 to 1	:= 0;
M0_AHBSLOT10ENABLE      : integer range 0 to 1	:= 0;
M0_AHBSLOT11ENABLE      : integer range 0 to 1	:= 0;
M0_AHBSLOT12ENABLE      : integer range 0 to 1	:= 0;
M0_AHBSLOT13ENABLE      : integer range 0 to 1	:= 0;
M0_AHBSLOT14ENABLE      : integer range 0 to 1	:= 0;
M0_AHBSLOT15ENABLE      : integer range 0 to 1	:= 0;
M0_AHBSLOT16ENABLE      : integer range 0 to 1	:= 0;
M1_AHBSLOT0ENABLE       : integer range 0 to 1	:= 0;
M1_AHBSLOT1ENABLE       : integer range 0 to 1	:= 1;
M1_AHBSLOT2ENABLE       : integer range 0 to 1	:= 0;
M1_AHBSLOT3ENABLE       : integer range 0 to 1	:= 0;
M1_AHBSLOT4ENABLE       : integer range 0 to 1	:= 0;
M1_AHBSLOT5ENABLE       : integer range 0 to 1	:= 0;
M1_AHBSLOT6ENABLE       : integer range 0 to 1	:= 0;
M1_AHBSLOT7ENABLE       : integer range 0 to 1	:= 0;
M1_AHBSLOT8ENABLE       : integer range 0 to 1	:= 0;
M1_AHBSLOT9ENABLE       : integer range 0 to 1	:= 0;
M1_AHBSLOT10ENABLE      : integer range 0 to 1	:= 0;
M1_AHBSLOT11ENABLE      : integer range 0 to 1	:= 0;
M1_AHBSLOT12ENABLE      : integer range 0 to 1	:= 0;
M1_AHBSLOT13ENABLE      : integer range 0 to 1	:= 0;
M1_AHBSLOT14ENABLE      : integer range 0 to 1	:= 0;
M1_AHBSLOT15ENABLE      : integer range 0 to 1	:= 0;
M1_AHBSLOT16ENABLE      : integer range 0 to 1	:= 0
);
port (
HCLK                : in std_logic;
HRESETN             : in std_logic;
REMAP_M0            : in std_logic;
HADDR_M0            : in std_logic_vector(31 downto 0);
HMASTLOCK_M0        : in std_logic;
HSIZE_M0            : in std_logic_vector(2 downto 0);
HTRANS_M0           : in std_logic_vector(1 downto 0);
HWRITE_M0           : in std_logic;
HWDATA_M0           : in std_logic_vector(31 downto 0);
HBURST_M0           : in std_logic_vector(2 downto 0);
HPROT_M0            : in std_logic_vector(3 downto 0);
HRESP_M0            : out std_logic_vector(1 downto 0);
HRDATA_M0           : out std_logic_vector(31 downto 0);
HREADY_M0           : out std_logic;
HADDR_M1            : in std_logic_vector(31 downto 0);
HMASTLOCK_M1        : in std_logic;
HSIZE_M1            : in std_logic_vector(2 downto 0);
HTRANS_M1           : in std_logic_vector(1 downto 0);
HWRITE_M1           : in std_logic;
HWDATA_M1           : in std_logic_vector(31 downto 0);
HBURST_M1           : in std_logic_vector(2 downto 0);
HPROT_M1            : in std_logic_vector(3 downto 0);
HRESP_M1            : out std_logic_vector(1 downto 0);
HRDATA_M1           : out std_logic_vector(31 downto 0);
HREADY_M1           : out std_logic;
HRDATA_S0           : in std_logic_vector(31 downto 0);
HREADYOUT_S0        : in std_logic;
HRESP_S0            : in std_logic_vector(1 downto 0);
HSEL_S0             : out std_logic;
HADDR_S0            : out std_logic_vector(31 downto 0);
HSIZE_S0            : out std_logic_vector(2 downto 0);
HTRANS_S0           : out std_logic_vector(1 downto 0);
HWRITE_S0           : out std_logic;
HWDATA_S0           : out std_logic_vector(31 downto 0);
HREADY_S0           : out std_logic;
HMASTLOCK_S0        : out std_logic;
HBURST_S0           : out std_logic_vector(2 downto 0);
HPROT_S0            : out std_logic_vector(3 downto 0);
HRDATA_S1           : in std_logic_vector(31 downto 0);
HREADYOUT_S1        : in std_logic;
HRESP_S1            : in std_logic_vector(1 downto 0);
HSEL_S1             : out std_logic;
HADDR_S1            : out std_logic_vector(31 downto 0);
HSIZE_S1            : out std_logic_vector(2 downto 0);
HTRANS_S1           : out std_logic_vector(1 downto 0);
HWRITE_S1           : out std_logic;
HWDATA_S1           : out std_logic_vector(31 downto 0);
HREADY_S1           : out std_logic;
HMASTLOCK_S1        : out std_logic;
HBURST_S1           : out std_logic_vector(2 downto 0);
HPROT_S1            : out std_logic_vector(3 downto 0);
HRDATA_S2           : in std_logic_vector(31 downto 0);
HREADYOUT_S2        : in std_logic;
HRESP_S2            : in std_logic_vector(1 downto 0);
HSEL_S2             : out std_logic;
HADDR_S2            : out std_logic_vector(31 downto 0);
HSIZE_S2            : out std_logic_vector(2 downto 0);
HTRANS_S2           : out std_logic_vector(1 downto 0);
HWRITE_S2           : out std_logic;
HWDATA_S2           : out std_logic_vector(31 downto 0);
HREADY_S2           : out std_logic;
HMASTLOCK_S2        : out std_logic;
HBURST_S2           : out std_logic_vector(2 downto 0);
HPROT_S2            : out std_logic_vector(3 downto 0);
HRDATA_S3           : in std_logic_vector(31 downto 0);
HREADYOUT_S3        : in std_logic;
HRESP_S3            : in std_logic_vector(1 downto 0);
HSEL_S3             : out std_logic;
HADDR_S3            : out std_logic_vector(31 downto 0);
HSIZE_S3            : out std_logic_vector(2 downto 0);
HTRANS_S3           : out std_logic_vector(1 downto 0);
HWRITE_S3           : out std_logic;
HWDATA_S3           : out std_logic_vector(31 downto 0);
HREADY_S3           : out std_logic;
HMASTLOCK_S3        : out std_logic;
HBURST_S3           : out std_logic_vector(2 downto 0);
HPROT_S3            : out std_logic_vector(3 downto 0);
HRDATA_S4           : in std_logic_vector(31 downto 0);
HREADYOUT_S4        : in std_logic;
HRESP_S4            : in std_logic_vector(1 downto 0);
HSEL_S4             : out std_logic;
HADDR_S4            : out std_logic_vector(31 downto 0);
HSIZE_S4            : out std_logic_vector(2 downto 0);
HTRANS_S4           : out std_logic_vector(1 downto 0);
HWRITE_S4           : out std_logic;
HWDATA_S4           : out std_logic_vector(31 downto 0);
HREADY_S4           : out std_logic;
HMASTLOCK_S4        : out std_logic;
HBURST_S4           : out std_logic_vector(2 downto 0);
HPROT_S4            : out std_logic_vector(3 downto 0);
HRDATA_S5           : in std_logic_vector(31 downto 0);
HREADYOUT_S5        : in std_logic;
HRESP_S5            : in std_logic_vector(1 downto 0);
HSEL_S5             : out std_logic;
HADDR_S5            : out std_logic_vector(31 downto 0);
HSIZE_S5            : out std_logic_vector(2 downto 0);
HTRANS_S5           : out std_logic_vector(1 downto 0);
HWRITE_S5           : out std_logic;
HWDATA_S5           : out std_logic_vector(31 downto 0);
HREADY_S5           : out std_logic;
HMASTLOCK_S5        : out std_logic;
HBURST_S5           : out std_logic_vector(2 downto 0);
HPROT_S5            : out std_logic_vector(3 downto 0);
HRDATA_S6           : in std_logic_vector(31 downto 0);
HREADYOUT_S6        : in std_logic;
HRESP_S6            : in std_logic_vector(1 downto 0);
HSEL_S6             : out std_logic;
HADDR_S6            : out std_logic_vector(31 downto 0);
HSIZE_S6            : out std_logic_vector(2 downto 0);
HTRANS_S6           : out std_logic_vector(1 downto 0);
HWRITE_S6           : out std_logic;
HWDATA_S6           : out std_logic_vector(31 downto 0);
HREADY_S6           : out std_logic;
HMASTLOCK_S6        : out std_logic;
HBURST_S6           : out std_logic_vector(2 downto 0);
HPROT_S6            : out std_logic_vector(3 downto 0);
HRDATA_S7           : in std_logic_vector(31 downto 0);
HREADYOUT_S7        : in std_logic;
HRESP_S7            : in std_logic_vector(1 downto 0);
HSEL_S7             : out std_logic;
HADDR_S7            : out std_logic_vector(31 downto 0);
HSIZE_S7            : out std_logic_vector(2 downto 0);
HTRANS_S7           : out std_logic_vector(1 downto 0);
HWRITE_S7           : out std_logic;
HWDATA_S7           : out std_logic_vector(31 downto 0);
HREADY_S7           : out std_logic;
HMASTLOCK_S7        : out std_logic;
HBURST_S7           : out std_logic_vector(2 downto 0);
HPROT_S7            : out std_logic_vector(3 downto 0);
HRDATA_S8           : in std_logic_vector(31 downto 0);
HREADYOUT_S8        : in std_logic;
HRESP_S8            : in std_logic_vector(1 downto 0);
HSEL_S8             : out std_logic;
HADDR_S8            : out std_logic_vector(31 downto 0);
HSIZE_S8            : out std_logic_vector(2 downto 0);
HTRANS_S8           : out std_logic_vector(1 downto 0);
HWRITE_S8           : out std_logic;
HWDATA_S8           : out std_logic_vector(31 downto 0);
HREADY_S8           : out std_logic;
HMASTLOCK_S8        : out std_logic;
HBURST_S8           : out std_logic_vector(2 downto 0);
HPROT_S8            : out std_logic_vector(3 downto 0);
HRDATA_S9           : in std_logic_vector(31 downto 0);
HREADYOUT_S9        : in std_logic;
HRESP_S9            : in std_logic_vector(1 downto 0);
HSEL_S9             : out std_logic;
HADDR_S9            : out std_logic_vector(31 downto 0);
HSIZE_S9            : out std_logic_vector(2 downto 0);
HTRANS_S9           : out std_logic_vector(1 downto 0);
HWRITE_S9           : out std_logic;
HWDATA_S9           : out std_logic_vector(31 downto 0);
HREADY_S9           : out std_logic;
HMASTLOCK_S9        : out std_logic;
HBURST_S9           : out std_logic_vector(2 downto 0);
HPROT_S9            : out std_logic_vector(3 downto 0);
HRDATA_S10          : in std_logic_vector(31 downto 0);
HREADYOUT_S10       : in std_logic;
HRESP_S10           : in std_logic_vector(1 downto 0);
HSEL_S10            : out std_logic;
HADDR_S10           : out std_logic_vector(31 downto 0);
HSIZE_S10           : out std_logic_vector(2 downto 0);
HTRANS_S10          : out std_logic_vector(1 downto 0);
HWRITE_S10          : out std_logic;
HWDATA_S10          : out std_logic_vector(31 downto 0);
HREADY_S10          : out std_logic;
HMASTLOCK_S10       : out std_logic;
HBURST_S10          : out std_logic_vector(2 downto 0);
HPROT_S10           : out std_logic_vector(3 downto 0);
HRDATA_S11          : in std_logic_vector(31 downto 0);
HREADYOUT_S11       : in std_logic;
HRESP_S11           : in std_logic_vector(1 downto 0);
HSEL_S11            : out std_logic;
HADDR_S11           : out std_logic_vector(31 downto 0);
HSIZE_S11           : out std_logic_vector(2 downto 0);
HTRANS_S11          : out std_logic_vector(1 downto 0);
HWRITE_S11          : out std_logic;
HWDATA_S11          : out std_logic_vector(31 downto 0);
HREADY_S11          : out std_logic;
HMASTLOCK_S11       : out std_logic;
HBURST_S11          : out std_logic_vector(2 downto 0);
HPROT_S11           : out std_logic_vector(3 downto 0);
HRDATA_S12          : in std_logic_vector(31 downto 0);
HREADYOUT_S12       : in std_logic;
HRESP_S12           : in std_logic_vector(1 downto 0);
HSEL_S12            : out std_logic;
HADDR_S12           : out std_logic_vector(31 downto 0);
HSIZE_S12           : out std_logic_vector(2 downto 0);
HTRANS_S12          : out std_logic_vector(1 downto 0);
HWRITE_S12          : out std_logic;
HWDATA_S12          : out std_logic_vector(31 downto 0);
HREADY_S12          : out std_logic;
HMASTLOCK_S12       : out std_logic;
HBURST_S12          : out std_logic_vector(2 downto 0);
HPROT_S12           : out std_logic_vector(3 downto 0);
HRDATA_S13          : in std_logic_vector(31 downto 0);
HREADYOUT_S13       : in std_logic;
HRESP_S13           : in std_logic_vector(1 downto 0);
HSEL_S13            : out std_logic;
HADDR_S13           : out std_logic_vector(31 downto 0);
HSIZE_S13           : out std_logic_vector(2 downto 0);
HTRANS_S13          : out std_logic_vector(1 downto 0);
HWRITE_S13          : out std_logic;
HWDATA_S13          : out std_logic_vector(31 downto 0);
HREADY_S13          : out std_logic;
HMASTLOCK_S13       : out std_logic;
HBURST_S13          : out std_logic_vector(2 downto 0);
HPROT_S13           : out std_logic_vector(3 downto 0);
HRDATA_S14          : in std_logic_vector(31 downto 0);
HREADYOUT_S14       : in std_logic;
HRESP_S14           : in std_logic_vector(1 downto 0);
HSEL_S14            : out std_logic;
HADDR_S14           : out std_logic_vector(31 downto 0);
HSIZE_S14           : out std_logic_vector(2 downto 0);
HTRANS_S14          : out std_logic_vector(1 downto 0);
HWRITE_S14          : out std_logic;
HWDATA_S14          : out std_logic_vector(31 downto 0);
HREADY_S14          : out std_logic;
HMASTLOCK_S14       : out std_logic;
HBURST_S14          : out std_logic_vector(2 downto 0);
HPROT_S14           : out std_logic_vector(3 downto 0);
HRDATA_S15          : in std_logic_vector(31 downto 0);
HREADYOUT_S15       : in std_logic;
HRESP_S15           : in std_logic_vector(1 downto 0);
HSEL_S15            : out std_logic;
HADDR_S15           : out std_logic_vector(31 downto 0);
HSIZE_S15           : out std_logic_vector(2 downto 0);
HTRANS_S15          : out std_logic_vector(1 downto 0);
HWRITE_S15          : out std_logic;
HWDATA_S15          : out std_logic_vector(31 downto 0);
HREADY_S15          : out std_logic;
HMASTLOCK_S15       : out std_logic;
HBURST_S15          : out std_logic_vector(2 downto 0);
HPROT_S15           : out std_logic_vector(3 downto 0);
HRDATA_S16          : in std_logic_vector(31 downto 0);
HREADYOUT_S16       : in std_logic;
HRESP_S16           : in std_logic_vector(1 downto 0);
HSEL_S16            : out std_logic;
HADDR_S16           : out std_logic_vector(31 downto 0);
HSIZE_S16           : out std_logic_vector(2 downto 0);
HTRANS_S16          : out std_logic_vector(1 downto 0);
HWRITE_S16          : out std_logic;
HWDATA_S16          : out std_logic_vector(31 downto 0);
HREADY_S16          : out std_logic;
HMASTLOCK_S16       : out std_logic;
HBURST_S16          : out std_logic_vector(2 downto 0);
HPROT_S16           : out std_logic_vector(3 downto 0)
);
end component;

end components;

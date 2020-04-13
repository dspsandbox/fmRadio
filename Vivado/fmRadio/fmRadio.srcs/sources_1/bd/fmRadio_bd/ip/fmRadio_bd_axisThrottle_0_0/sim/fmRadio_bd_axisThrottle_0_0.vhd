-- (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:axisThrottle:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY fmRadio_bd_axisThrottle_0_0 IS
  PORT (
    clk : IN STD_LOGIC;
    resetn : IN STD_LOGIC;
    prescaler : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S_AXIS_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S_AXIS_tvalid : IN STD_LOGIC;
    S_AXIS_tready : OUT STD_LOGIC;
    M_AXIS_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    M_AXIS_tvalid : OUT STD_LOGIC;
    M_AXIS_tready : IN STD_LOGIC
  );
END fmRadio_bd_axisThrottle_0_0;

ARCHITECTURE fmRadio_bd_axisThrottle_0_0_arch OF fmRadio_bd_axisThrottle_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF fmRadio_bd_axisThrottle_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT axisThrottle IS
    GENERIC (
      PORT_WIDTH : INTEGER
    );
    PORT (
      clk : IN STD_LOGIC;
      resetn : IN STD_LOGIC;
      prescaler : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      S_AXIS_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      S_AXIS_tvalid : IN STD_LOGIC;
      S_AXIS_tready : OUT STD_LOGIC;
      M_AXIS_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      M_AXIS_tvalid : OUT STD_LOGIC;
      M_AXIS_tready : IN STD_LOGIC
    );
  END COMPONENT axisThrottle;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF fmRadio_bd_axisThrottle_0_0_arch: ARCHITECTURE IS "module_ref";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF M_AXIS_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXIS_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF M_AXIS_tdata: SIGNAL IS "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 108000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXIS_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF S_AXIS_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF S_AXIS_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF S_AXIS_tdata: SIGNAL IS "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 108000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF S_AXIS_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF resetn: SIGNAL IS "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF resetn: SIGNAL IS "xilinx.com:signal:reset:1.0 resetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF clk: SIGNAL IS "XIL_INTERFACENAME clk, ASSOCIATED_BUSIF M_AXIS:S_AXIS, ASSOCIATED_RESET resetn, FREQ_HZ 108000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF clk: SIGNAL IS "xilinx.com:signal:clock:1.0 clk CLK";
BEGIN
  U0 : axisThrottle
    GENERIC MAP (
      PORT_WIDTH => 32
    )
    PORT MAP (
      clk => clk,
      resetn => resetn,
      prescaler => prescaler,
      S_AXIS_tdata => S_AXIS_tdata,
      S_AXIS_tvalid => S_AXIS_tvalid,
      S_AXIS_tready => S_AXIS_tready,
      M_AXIS_tdata => M_AXIS_tdata,
      M_AXIS_tvalid => M_AXIS_tvalid,
      M_AXIS_tready => M_AXIS_tready
    );
END fmRadio_bd_axisThrottle_0_0_arch;

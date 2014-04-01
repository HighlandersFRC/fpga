-- (c) Copyright 1995-2014 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: xilinx.com:ip:axi_quad_spi:3.1
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY axi_quad_spi_v3_1;
USE axi_quad_spi_v3_1.axi_quad_spi;

ENTITY zynq_1_axi_quad_spi_0_0 IS
  PORT (
    ext_spi_clk : IN STD_LOGIC;
    s_axi4_aclk : IN STD_LOGIC;
    s_axi4_aresetn : IN STD_LOGIC;
    s_axi4_awid : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    s_axi4_awaddr : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    s_axi4_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axi4_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi4_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi4_awlock : IN STD_LOGIC;
    s_axi4_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi4_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi4_awvalid : IN STD_LOGIC;
    s_axi4_awready : OUT STD_LOGIC;
    s_axi4_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi4_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi4_wlast : IN STD_LOGIC;
    s_axi4_wvalid : IN STD_LOGIC;
    s_axi4_wready : OUT STD_LOGIC;
    s_axi4_bid : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    s_axi4_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi4_bvalid : OUT STD_LOGIC;
    s_axi4_bready : IN STD_LOGIC;
    s_axi4_arid : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    s_axi4_araddr : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    s_axi4_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axi4_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi4_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi4_arlock : IN STD_LOGIC;
    s_axi4_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi4_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    s_axi4_arvalid : IN STD_LOGIC;
    s_axi4_arready : OUT STD_LOGIC;
    s_axi4_rid : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    s_axi4_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi4_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi4_rlast : OUT STD_LOGIC;
    s_axi4_rvalid : OUT STD_LOGIC;
    s_axi4_rready : IN STD_LOGIC;
    io0_i : IN STD_LOGIC;
    io0_o : OUT STD_LOGIC;
    io0_t : OUT STD_LOGIC;
    io1_i : IN STD_LOGIC;
    io1_o : OUT STD_LOGIC;
    io1_t : OUT STD_LOGIC;
    sck_i : IN STD_LOGIC;
    sck_o : OUT STD_LOGIC;
    sck_t : OUT STD_LOGIC;
    ss_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    ss_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    ss_t : OUT STD_LOGIC;
    ip2intc_irpt : OUT STD_LOGIC
  );
END zynq_1_axi_quad_spi_0_0;

ARCHITECTURE zynq_1_axi_quad_spi_0_0_arch OF zynq_1_axi_quad_spi_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF zynq_1_axi_quad_spi_0_0_arch: ARCHITECTURE IS "yes";

  COMPONENT axi_quad_spi IS
    GENERIC (
      C_S_AXI4_BASEADDR : STD_LOGIC_VECTOR;
      C_S_AXI4_HIGHADDR : STD_LOGIC_VECTOR;
      C_FAMILY : STRING;
      C_SUB_FAMILY : STRING;
      C_INSTANCE : STRING;
      C_TYPE_OF_AXI4_INTERFACE : INTEGER;
      C_XIP_MODE : INTEGER;
      C_SPI_MEM_ADDR_BITS : INTEGER;
      C_FIFO_DEPTH : INTEGER;
      C_SCK_RATIO : INTEGER;
      C_NUM_SS_BITS : INTEGER;
      C_NUM_TRANSFER_BITS : INTEGER;
      C_SPI_MODE : INTEGER;
      C_USE_STARTUP : INTEGER;
      C_SPI_MEMORY : INTEGER;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_S_AXI4_ADDR_WIDTH : INTEGER;
      C_S_AXI4_DATA_WIDTH : INTEGER;
      C_S_AXI4_ID_WIDTH : INTEGER;
      Async_Clk : INTEGER
    );
    PORT (
      ext_spi_clk : IN STD_LOGIC;
      s_axi_aclk : IN STD_LOGIC;
      s_axi_aresetn : IN STD_LOGIC;
      s_axi4_aclk : IN STD_LOGIC;
      s_axi4_aresetn : IN STD_LOGIC;
      s_axi_awaddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      s_axi_awvalid : IN STD_LOGIC;
      s_axi_awready : OUT STD_LOGIC;
      s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_wvalid : IN STD_LOGIC;
      s_axi_wready : OUT STD_LOGIC;
      s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_bvalid : OUT STD_LOGIC;
      s_axi_bready : IN STD_LOGIC;
      s_axi_araddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      s_axi_arvalid : IN STD_LOGIC;
      s_axi_arready : OUT STD_LOGIC;
      s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_rvalid : OUT STD_LOGIC;
      s_axi_rready : IN STD_LOGIC;
      s_axi4_awid : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      s_axi4_awaddr : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      s_axi4_awlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axi4_awsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi4_awburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi4_awlock : IN STD_LOGIC;
      s_axi4_awcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi4_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi4_awvalid : IN STD_LOGIC;
      s_axi4_awready : OUT STD_LOGIC;
      s_axi4_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi4_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi4_wlast : IN STD_LOGIC;
      s_axi4_wvalid : IN STD_LOGIC;
      s_axi4_wready : OUT STD_LOGIC;
      s_axi4_bid : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      s_axi4_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi4_bvalid : OUT STD_LOGIC;
      s_axi4_bready : IN STD_LOGIC;
      s_axi4_arid : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      s_axi4_araddr : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      s_axi4_arlen : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axi4_arsize : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi4_arburst : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi4_arlock : IN STD_LOGIC;
      s_axi4_arcache : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi4_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      s_axi4_arvalid : IN STD_LOGIC;
      s_axi4_arready : OUT STD_LOGIC;
      s_axi4_rid : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      s_axi4_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi4_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi4_rlast : OUT STD_LOGIC;
      s_axi4_rvalid : OUT STD_LOGIC;
      s_axi4_rready : IN STD_LOGIC;
      io0_i : IN STD_LOGIC;
      io0_o : OUT STD_LOGIC;
      io0_t : OUT STD_LOGIC;
      io1_i : IN STD_LOGIC;
      io1_o : OUT STD_LOGIC;
      io1_t : OUT STD_LOGIC;
      io2_i : IN STD_LOGIC;
      io2_o : OUT STD_LOGIC;
      io2_t : OUT STD_LOGIC;
      io3_i : IN STD_LOGIC;
      io3_o : OUT STD_LOGIC;
      io3_t : OUT STD_LOGIC;
      spisel : IN STD_LOGIC;
      sck_i : IN STD_LOGIC;
      sck_o : OUT STD_LOGIC;
      sck_t : OUT STD_LOGIC;
      ss_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      ss_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      ss_t : OUT STD_LOGIC;
      ip2intc_irpt : OUT STD_LOGIC
    );
  END COMPONENT axi_quad_spi;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ext_spi_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 spi_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 full_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 full_reset RST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_awid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL AWID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_awlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL AWLEN";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_awsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_awburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_awlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_awcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_wlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_bid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL BID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_arid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL ARID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_arlen: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_arsize: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_arburst: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_arlock: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_arcache: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_rid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL RID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_rlast: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi4_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI_FULL RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF io0_i: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 IO0_I";
  ATTRIBUTE X_INTERFACE_INFO OF io0_o: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 IO0_O";
  ATTRIBUTE X_INTERFACE_INFO OF io0_t: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 IO0_T";
  ATTRIBUTE X_INTERFACE_INFO OF io1_i: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 IO1_I";
  ATTRIBUTE X_INTERFACE_INFO OF io1_o: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 IO1_O";
  ATTRIBUTE X_INTERFACE_INFO OF io1_t: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 IO1_T";
  ATTRIBUTE X_INTERFACE_INFO OF sck_i: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 SCK_I";
  ATTRIBUTE X_INTERFACE_INFO OF sck_o: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 SCK_O";
  ATTRIBUTE X_INTERFACE_INFO OF sck_t: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 SCK_T";
  ATTRIBUTE X_INTERFACE_INFO OF ss_i: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 SS_I";
  ATTRIBUTE X_INTERFACE_INFO OF ss_o: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 SS_O";
  ATTRIBUTE X_INTERFACE_INFO OF ss_t: SIGNAL IS "xilinx.com:interface:spi:1.0 SPI_0 SS_T";
  ATTRIBUTE X_INTERFACE_INFO OF ip2intc_irpt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
BEGIN
  U0 : axi_quad_spi
    GENERIC MAP (
      C_S_AXI4_BASEADDR => X"41E00000",
      C_S_AXI4_HIGHADDR => X"41E00FFF",
      C_FAMILY => "virtex7",
      C_SUB_FAMILY => "virtex7",
      C_INSTANCE => "axi_quad_spi_inst",
      C_TYPE_OF_AXI4_INTERFACE => 1,
      C_XIP_MODE => 0,
      C_SPI_MEM_ADDR_BITS => 24,
      C_FIFO_DEPTH => 256,
      C_SCK_RATIO => 128,
      C_NUM_SS_BITS => 1,
      C_NUM_TRANSFER_BITS => 8,
      C_SPI_MODE => 0,
      C_USE_STARTUP => 0,
      C_SPI_MEMORY => 1,
      C_S_AXI_ADDR_WIDTH => 7,
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI4_ADDR_WIDTH => 24,
      C_S_AXI4_DATA_WIDTH => 32,
      C_S_AXI4_ID_WIDTH => 12,
      Async_Clk => 0
    )
    PORT MAP (
      ext_spi_clk => ext_spi_clk,
      s_axi_aclk => '0',
      s_axi_aresetn => '0',
      s_axi4_aclk => s_axi4_aclk,
      s_axi4_aresetn => s_axi4_aresetn,
      s_axi_awaddr => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 7)),
      s_axi_awvalid => '0',
      s_axi_wdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      s_axi_wstrb => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      s_axi_wvalid => '0',
      s_axi_bready => '0',
      s_axi_araddr => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 7)),
      s_axi_arvalid => '0',
      s_axi_rready => '0',
      s_axi4_awid => s_axi4_awid,
      s_axi4_awaddr => s_axi4_awaddr,
      s_axi4_awlen => s_axi4_awlen,
      s_axi4_awsize => s_axi4_awsize,
      s_axi4_awburst => s_axi4_awburst,
      s_axi4_awlock => s_axi4_awlock,
      s_axi4_awcache => s_axi4_awcache,
      s_axi4_awprot => s_axi4_awprot,
      s_axi4_awvalid => s_axi4_awvalid,
      s_axi4_awready => s_axi4_awready,
      s_axi4_wdata => s_axi4_wdata,
      s_axi4_wstrb => s_axi4_wstrb,
      s_axi4_wlast => s_axi4_wlast,
      s_axi4_wvalid => s_axi4_wvalid,
      s_axi4_wready => s_axi4_wready,
      s_axi4_bid => s_axi4_bid,
      s_axi4_bresp => s_axi4_bresp,
      s_axi4_bvalid => s_axi4_bvalid,
      s_axi4_bready => s_axi4_bready,
      s_axi4_arid => s_axi4_arid,
      s_axi4_araddr => s_axi4_araddr,
      s_axi4_arlen => s_axi4_arlen,
      s_axi4_arsize => s_axi4_arsize,
      s_axi4_arburst => s_axi4_arburst,
      s_axi4_arlock => s_axi4_arlock,
      s_axi4_arcache => s_axi4_arcache,
      s_axi4_arprot => s_axi4_arprot,
      s_axi4_arvalid => s_axi4_arvalid,
      s_axi4_arready => s_axi4_arready,
      s_axi4_rid => s_axi4_rid,
      s_axi4_rdata => s_axi4_rdata,
      s_axi4_rresp => s_axi4_rresp,
      s_axi4_rlast => s_axi4_rlast,
      s_axi4_rvalid => s_axi4_rvalid,
      s_axi4_rready => s_axi4_rready,
      io0_i => io0_i,
      io0_o => io0_o,
      io0_t => io0_t,
      io1_i => io1_i,
      io1_o => io1_o,
      io1_t => io1_t,
      io2_i => '0',
      io3_i => '0',
      spisel => '1',
      sck_i => sck_i,
      sck_o => sck_o,
      sck_t => sck_t,
      ss_i => ss_i,
      ss_o => ss_o,
      ss_t => ss_t,
      ip2intc_irpt => ip2intc_irpt
    );
END zynq_1_axi_quad_spi_0_0_arch;

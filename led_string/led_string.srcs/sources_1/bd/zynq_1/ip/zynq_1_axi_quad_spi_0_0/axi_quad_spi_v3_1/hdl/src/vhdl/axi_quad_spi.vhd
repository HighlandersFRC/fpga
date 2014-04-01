-------------------------------------------------------------------------------
-- $Id: axi_quad_spi.vhd
-------------------------------------------------------------------------------
-- axi_quad_spi.vhd - Entity and architecture
-------------------------------------------------------------------------------
--
-- *******************************************************************
-- ** (c) Copyright [2010] - [2012] Xilinx, Inc. All rights reserved.*
-- **                                                                *
-- ** This file contains confidential and proprietary information    *
-- ** of Xilinx, Inc. and is protected under U.S. and                *
-- ** international copyright and other intellectual property        *
-- ** laws.                                                          *
-- **                                                                *
-- ** DISCLAIMER                                                     *
-- ** This disclaimer is not a license and does not grant any        *
-- ** rights to the materials distributed herewith. Except as        *
-- ** otherwise provided in a valid license issued to you by         *
-- ** Xilinx, and to the maximum extent permitted by applicable      *
-- ** law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND        *
-- ** WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES    *
-- ** AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING      *
-- ** BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-         *
-- ** INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and       *
-- ** (2) Xilinx shall not be liable (whether in contract or tort,   *
-- ** including negligence, or under any other theory of             *
-- ** liability) for any loss or damage of any kind or nature        *
-- ** related to, arising under or in connection with these          *
-- ** materials, including for any direct, or any indirect,          *
-- ** special, incidental, or consequential loss or damage           *
-- ** (including loss of data, profits, goodwill, or any type of     *
-- ** loss or damage suffered as a result of any action brought      *
-- ** by a third party) even if such damage or loss was              *
-- ** reasonably foreseeable or Xilinx had been advised of the       *
-- ** possibility of the same.                                       *
-- **                                                                *
-- ** CRITICAL APPLICATIONS                                          *
-- ** Xilinx products are not designed or intended to be fail-       *
-- ** safe, or for use in any application requiring fail-safe        *
-- ** performance, such as life-support or safety devices or         *
-- ** systems, Class III medical devices, nuclear facilities,        *
-- ** applications related to the deployment of airbags, or any      *
-- ** other applications that could lead to death, personal          *
-- ** injury, or severe property or environmental damage             *
-- ** (individually and collectively, "Critical                      *
-- ** Applications"). Customer assumes the sole risk and             *
-- ** liability of any use of Xilinx products in Critical            *
-- ** Applications, subject only to applicable laws and              *
-- ** regulations governing limitations on product liability.        *
-- **                                                                *
-- ** THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS       *
-- ** PART OF THIS FILE AT ALL TIMES.                                *
-- *******************************************************************
--
-------------------------------------------------------------------------------
-- Filename:        axi_quad_spi.vhd
-- Version:         v3.0
-- Description:     This is the top-level design file for the AXI Quad SPI core.
--
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:
--
--              axi_quad_spi.vhd
--                   |--Legacy_mode
--                   |-- axi_lite_ipif.vhd
--                   |-- qspi_core_interface.vhd
--                     |-- qspi_cntrl_reg.vhd
--                     |-- qspi_status_slave_sel_reg.vhd
--                     |-- qspi_occupancy_reg.vhd
--                     |-- qspi_fifo_ifmodule.vhd
--                     |-- qspi_mode_0_module.vhd
--                     |-- qspi_receive_transmit_reg.vhd
--                     |-- qspi_startup_block.vhd
--                     |-- comp_defs.vhd    -- (helper lib)
--                     |-- qspi_look_up_logic.vhd
--                     |-- qspi_mode_control_logic.vhd
--                     |-- interrupt_control.vhd
--                     |-- soft_reset.vhd
--                   |--Enhanced_mode
--                     |--axi_qspi_enhanced_mode.vhd
--                       |-- qspi_addr_decoder.vhd
--                     |-- qspi_core_interface.vhd
--                       |-- qspi_cntrl_reg.vhd
--                       |-- qspi_status_slave_sel_reg.vhd
--                       |-- qspi_occupancy_reg.vhd
--                       |-- qspi_fifo_ifmodule.vhd
--                       |-- qspi_mode_0_module.vhd
--                       |-- qspi_receive_transmit_reg.vhd
--                       |-- qspi_startup_block.vhd
--                       |-- comp_defs.vhd    -- (helper lib)
--                       |-- async_fifo_fg.vhd -- (helper lib)
--                       |-- qspi_look_up_logic.vhd
--                       |-- qspi_mode_control_logic.vhd
--                       |-- interrupt_control.vhd
--                       |-- soft_reset.vhd
--                   |--XIP_mode
--                       |-- axi_lite_ipif.vhd
--                       |-- xip_cntrl_reg.vhd
--                       |-- xip_cross_clk_sync.vhd
--                       |-- reset_sync_module.vhd
--                       |-- xip_status_reg.vhd
--                       |-- axi_qspi_xip_if.vhd
--                         |-- qspi_addr_decoder.vhd
--                         |-- async_fifo_fg.vhd -- (helper lib)
--                         |-- comp_defs.vhd    -- (helper lib)
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------
--
-- History:
-- ~~~~~~
--  SK 19/01/11  -- created v1.00.a version
-- ^^^^^^
-- 1. Created first version of the core.
-- ~~~~~~
-- ~~~~~~
--  SK 11/12/11  -- created v2.00.a version
-- ^^^^^^
-- 1. Upgraded AXI4 Lite based core performance.
-- 2. Added AXI4 full interface support and added functionality
-- 3. Added XIP mode functionality and corresponding logic files
-- 4. Separated AXI and SPI clock so that the SPI functionality can operate at
--    independent frequency.
-- ~~~~~~
-- ~~~~~~
--  SK       12/16/12      -- v3.0
--  1. up reved to major version for 2013.1 Vivado release. No logic updates.
--  2. Updated the version of AXI LITE IPIF to v2.0 in X.Y format
--  3. updated the proc common version to proc_common_v4_0
--  4. No Logic Updates
-- ^^^^^^
-------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.conv_std_logic_vector;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_signed.all;
    use ieee.std_logic_misc.all;
-- library unsigned is used for overloading of "=" which allows integer to
-- be compared to std_logic_vector
    use ieee.std_logic_unsigned.all;


library proc_common_v4_0;
    use proc_common_v4_0.proc_common_pkg.all;
    use proc_common_v4_0.ipif_pkg.all;
    use proc_common_v4_0.family.all;
    use proc_common_v4_0.all;

library axi_lite_ipif_v2_0;

library axi_quad_spi_v3_1;
    use axi_quad_spi_v3_1.all;
-------------------------------------------------------------------------------

entity axi_quad_spi is
   generic(
       -- Async_Clk  parameter is added only for Vivado, it is not used in the design, this is
       -- NON HDL parameter
       Async_Clk                : integer              := 0;
       -- General Parameters
       C_FAMILY                 : string               := "virtex7";
       C_SUB_FAMILY             : string               := "virtex7";
       C_INSTANCE               : string               := "axi_quad_spi_inst";
       -------------------------
       C_SPI_MEM_ADDR_BITS      : integer              := 24; -- allowed values are 24 or 32 only and used in XIP mode
       C_TYPE_OF_AXI4_INTERFACE : integer range 0 to 1 := 0;--default AXI4 Lite Legacy mode
       C_XIP_MODE               : integer range 0 to 1 := 0;--default NON XIP Mode
       --C_AXI4_CLK_PS            : integer              := 10000;--AXI clock period
       --C_EXT_SPI_CLK_PS         : integer              := 10000;--ext clock period
       C_FIFO_DEPTH             : integer              := 256;-- allowed 0,16,256.
       C_SCK_RATIO              : integer              := 16;--default in legacy mode
       C_NUM_SS_BITS            : integer range 1 to 32:= 1;
       C_NUM_TRANSFER_BITS      : integer              := 8; -- allowed 8, 16, 32
       -------------------------
       C_SPI_MODE               : integer range 0 to 2 := 0; -- used for differentiating
                                                             -- Standard, Dual or Quad mode
                                                             -- in Ports as well as internal
                                                             -- functionality
       C_USE_STARTUP            : integer range 0 to 1 := 1; --
       C_SPI_MEMORY             : integer range 0 to 2 := 1; -- 0 - mixed mode,
                                                             -- 1 - winbond,
                                                             -- 2 - numonyx
                                                             -- used to differentiate
                                                             -- internal look up table
                                                             -- for commands.
       -------------------------
       -- AXI4 Lite Interface Parameters  *as max address is 7c, only 7 address bits are used
       C_S_AXI_ADDR_WIDTH       : integer range 7  to 7  := 7;
       C_S_AXI_DATA_WIDTH       : integer range 32 to 32 := 32;
       -------------------------
       --*C_BASEADDR               : std_logic_vector       := x"FFFFFFFF";
       --*C_HIGHADDR               : std_logic_vector       := x"00000000";
       -------------------------
       -- AXI4 Full Interface Parameters *as max 24 bits of address are supported on SPI interface, only 24 address bits are used
       C_S_AXI4_ADDR_WIDTH      : integer                     ;--range 24 to 24 := 24;
       C_S_AXI4_DATA_WIDTH      : integer range 32 to 32 := 32;
       C_S_AXI4_ID_WIDTH        : integer range 1 to 16  := 4 ;
       -------------------------
       -- To FIX CR# 685366, below lines are added again in RTL (Vivado Requirement), but these parameters are not used in the core RTL
       C_S_AXI4_BASEADDR          : std_logic_vector       := x"FFFFFFFF";
       C_S_AXI4_HIGHADDR          : std_logic_vector       := x"00000000"
       -------------------------
   );
   port(
       -- external async clock for SPI interface logic
       ext_spi_clk    : in std_logic;
       -- axi4 lite interface clk and reset signals
       s_axi_aclk     : in std_logic;
       s_axi_aresetn  : in std_logic;
       -- axi4 full interface clk and reset signals
       s_axi4_aclk    : in std_logic;
       s_axi4_aresetn : in std_logic;
       -------------------------------
       -------------------------------
       --*axi4 lite port interface* --
       -------------------------------
       -------------------------------
       -- axi write address channel signals
       ---------------
       s_axi_awaddr   : in std_logic_vector (6 downto 0);--((C_S_AXI_ADDR_WIDTH-1) downto 0);
       s_axi_awvalid  : in std_logic;
       s_axi_awready  : out std_logic;
       ---------------
       -- axi write data channel signals
       ---------------
       s_axi_wdata    : in std_logic_vector(31 downto 0); -- ((C_S_AXI_DATA_WIDTH-1) downto 0);
       s_axi_wstrb    : in std_logic_vector(3 downto 0); -- (((C_S_AXI_DATA_WIDTH/8)-1) downto 0);
       s_axi_wvalid   : in std_logic;
       s_axi_wready   : out std_logic;
       ---------------
       -- axi write response channel signals
       ---------------
       s_axi_bresp    : out std_logic_vector(1 downto 0);
       s_axi_bvalid   : out std_logic;
       s_axi_bready   : in  std_logic;
       ---------------
       -- axi read address channel signals
       ---------------
       s_axi_araddr   : in  std_logic_vector(6 downto 0); -- ((C_S_AXI_ADDR_WIDTH-1) downto 0);
       s_axi_arvalid  : in  std_logic;
       s_axi_arready  : out std_logic;
       ---------------
       -- axi read address channel signals
       ---------------
       s_axi_rdata    : out std_logic_vector(31 downto 0); -- ((C_S_AXI_DATA_WIDTH-1) downto 0);
       s_axi_rresp    : out std_logic_vector(1 downto 0);
       s_axi_rvalid   : out std_logic;
       s_axi_rready   : in  std_logic;
       -------------------------------
       -------------------------------
       --*axi4 full port interface* --
       -------------------------------
       ------------------------------------
       -- axi write address Channel Signals
       ------------------------------------
       s_axi4_awid    : in  std_logic_vector((C_S_AXI4_ID_WIDTH-1) downto 0);
       s_axi4_awaddr  : in  std_logic_vector((C_SPI_MEM_ADDR_BITS-1) downto 0); --((C_S_AXI4_ADDR_WIDTH-1) downto 0);
       s_axi4_awlen   : in  std_logic_vector(7 downto 0);
       s_axi4_awsize  : in  std_logic_vector(2 downto 0);
       s_axi4_awburst : in  std_logic_vector(1 downto 0);
       s_axi4_awlock  : in  std_logic;                   -- not supported in design
       s_axi4_awcache : in  std_logic_vector(3 downto 0);-- not supported in design
       s_axi4_awprot  : in  std_logic_vector(2 downto 0);-- not supported in design
       s_axi4_awvalid : in  std_logic;
       s_axi4_awready : out std_logic;
       ---------------------------------------
       -- axi4 full write Data Channel Signals
       ---------------------------------------
       s_axi4_wdata   : in  std_logic_vector(31 downto 0); -- ((C_S_AXI4_DATA_WIDTH-1)downto 0);
       s_axi4_wstrb   : in  std_logic_vector(3 downto 0); -- (((C_S_AXI4_DATA_WIDTH/8)-1) downto 0);
       s_axi4_wlast   : in  std_logic;
       s_axi4_wvalid  : in  std_logic;
       s_axi4_wready  : out std_logic;
       -------------------------------------------
       -- axi4 full write Response Channel Signals
       -------------------------------------------
       s_axi4_bid     : out std_logic_vector((C_S_AXI4_ID_WIDTH-1) downto 0);
       s_axi4_bresp   : out std_logic_vector(1 downto 0);
       s_axi4_bvalid  : out std_logic;
       s_axi4_bready  : in  std_logic;
       -----------------------------------
       -- axi read address Channel Signals
       -----------------------------------
       s_axi4_arid    : in  std_logic_vector((C_S_AXI4_ID_WIDTH-1) downto 0);
       s_axi4_araddr  : in  std_logic_vector((C_SPI_MEM_ADDR_BITS-1) downto 0);--((C_S_AXI4_ADDR_WIDTH-1) downto 0);
       s_axi4_arlen   : in  std_logic_vector(7 downto 0);
       s_axi4_arsize  : in  std_logic_vector(2 downto 0);
       s_axi4_arburst : in  std_logic_vector(1 downto 0);
       s_axi4_arlock  : in  std_logic;                -- not supported in design
       s_axi4_arcache : in  std_logic_vector(3 downto 0);-- not supported in design
       s_axi4_arprot  : in  std_logic_vector(2 downto 0);-- not supported in design
       s_axi4_arvalid : in  std_logic;
       s_axi4_arready : out std_logic;
       --------------------------------
       -- axi read data Channel Signals
       --------------------------------
       s_axi4_rid     : out std_logic_vector((C_S_AXI4_ID_WIDTH-1) downto 0);
       s_axi4_rdata   : out std_logic_vector(31 downto 0);--((C_S_AXI4_DATA_WIDTH-1) downto 0);
       s_axi4_rresp   : out std_logic_vector(1 downto 0);
       s_axi4_rlast   : out std_logic;
       s_axi4_rvalid  : out std_logic;
       s_axi4_rready  : in  std_logic;
       --------------------------------
       -------------------------------
       --*SPI port interface      * --
       -------------------------------
       io0_i          : in std_logic;  -- MOSI signal in standard SPI
       io0_o          : out std_logic;
       io0_t          : out std_logic;
       -------------------------------
       io1_i          : in std_logic;  -- MISO signal in standard SPI
       io1_o          : out std_logic;
       io1_t          : out std_logic;
       -----------------
       -- quad mode pins
       -----------------
       io2_i          : in std_logic;
       io2_o          : out std_logic;
       io2_t          : out std_logic;
       ---------------
       io3_i          : in std_logic;
       io3_o          : out std_logic;
       io3_t          : out std_logic;
       ---------------------------------
       -- common pins
       ----------------
       spisel         : in std_logic;
       -----
       sck_i          : in std_logic;
       sck_o          : out std_logic;
       sck_t          : out std_logic;
       -----
       ss_i           : in std_logic_vector((C_NUM_SS_BITS-1) downto 0);
       ss_o           : out std_logic_vector((C_NUM_SS_BITS-1) downto 0);
       ss_t           : out std_logic;
       ----------------------
       -- INTERRUPT INTERFACE
       ----------------------
       ip2intc_irpt   : out std_logic
       ---------------------------------
   );
       -------------------------------
     -- Fan-out attributes for XST
     attribute MAX_FANOUT                             : string;
     attribute MAX_FANOUT of S_AXI_ACLK               : signal is "10000";
     attribute MAX_FANOUT of S_AXI4_ACLK              : signal is "10000";
     attribute MAX_FANOUT of EXT_SPI_CLK              : signal is "10000";
     attribute MAX_FANOUT of S_AXI_ARESETN            : signal is "10000";
     attribute MAX_FANOUT of S_AXI4_ARESETN           : signal is "10000";

     attribute INITIALVAL  : string;
     attribute INITIALVAL of SPISEL                   : signal is "VCC";
       -------------------------------
end entity axi_quad_spi;
--------------------------------------------------------------------------------

architecture imp of axi_quad_spi is

----------------------------------------------------------------------------------
-- below attributes are added to reduce the synth warnings in Vivado tool
attribute DowngradeIPIdentifiedWarnings: string;
attribute DowngradeIPIdentifiedWarnings of imp : architecture is "yes";
----------------------------------------------------------------------------------

---------------------------------------------------------------------------------
---- constant added for webtalk information
---------------------------------------------------------------------------------
 -- constant C_CORE_GENERATION_INFO : string := C_INSTANCE & ",axi_quad_spi,{"
 --     & "C_FAMILY = "                    & C_FAMILY
 --     & ",C_SUB_FAMILY = "               & C_SUB_FAMILY
 --     & ",C_INSTANCE = "                 & C_INSTANCE
 --     & ",C_S_AXI_ADDR_WIDTH = "         & integer'image(C_S_AXI_ADDR_WIDTH)
 --     & ",C_S_AXI_DATA_WIDTH = "         & integer'image(C_S_AXI_DATA_WIDTH)
 --     & ",C_S_AXI4_ADDR_WIDTH = "        & integer'image(C_S_AXI4_ADDR_WIDTH)
 --     & ",C_S_AXI4_DATA_WIDTH = "        & integer'image(C_S_AXI4_DATA_WIDTH)
 --     & ",C_S_AXI4_ID_WIDTH = "          & integer'image(C_S_AXI4_ID_WIDTH)
 --     & ",C_FIFO_DEPTH = "               & integer'image(C_FIFO_DEPTH)
 --     & ",C_SCK_RATIO = "                & integer'image(C_SCK_RATIO)
 --     & ",C_NUM_SS_BITS = "              & integer'image(C_NUM_SS_BITS)
 --     & ",C_NUM_TRANSFER_BITS = "        & integer'image(C_NUM_TRANSFER_BITS)
 --     & ",C_USE_STARTUP = "              & integer'image(C_USE_STARTUP)
 --     & ",C_SPI_MODE = "                 & integer'image(C_SPI_MODE)
 --     & ",C_SPI_MEMORY = "               & integer'image(C_SPI_MEMORY)
 --     & ",C_TYPE_OF_AXI4_INTERFACE = "   & integer'image(C_TYPE_OF_AXI4_INTERFACE)
 --     & ",C_XIP_MODE = "                 & integer'image(C_XIP_MODE)
 --     & "}";
 -- 
 -- attribute CORE_GENERATION_INFO : string;
 -- attribute CORE_GENERATION_INFO of imp : architecture is C_CORE_GENERATION_INFO;
-------------------------------------------------------------

 -------------------------------------------------------------
 -- Function Declaration
 -------------------------------------------------------------
 -- get_fifo_presence - This function returns the 0 or 1 based upon the FIFO Depth.
 --
 function get_fifo_presence(C_FIFO_DEPTH: integer) return integer is
 -----
 begin
 -----
        if(C_FIFO_DEPTH = 0)then
                return 0;
        else
                return 1;
        end if;
 end function get_fifo_presence;


 function get_fifo_depth(C_FIFO_EXIST: integer; C_FIFO_DEPTH : integer) return integer is
 -----
 begin
 -----
        if(C_FIFO_EXIST = 1)then
                return C_FIFO_DEPTH;
        else
                return 64; -- to ensure that log2 functions does not become invalid
        end if;
 end function get_fifo_depth;

 ------------------------------
 function get_fifo_occupancy_count(C_FIFO_DEPTH: integer) return integer is
 -----
    variable j  : integer := 0;
    variable k  : integer := 0;
 -----
 begin
 -----
    if (C_FIFO_DEPTH = 0) then
        return 4;
    else
        for i in 0 to 11 loop
                if(2**i >= C_FIFO_DEPTH) then
                        if(k = 0) then
                                j := i;
                        end if;
                        k := 1;
                end if;
        end loop;
        return j;
    end if;
    -------
 end function get_fifo_occupancy_count;
 ------------------------------

 -- Constant declarations
 ------------------------------
 --------------------- ******************* ------------------------------------
 --                      Core Parameters
 --------------------- ******************* ------------------------------------
  --
 constant C_FIFO_EXIST         : integer  := get_fifo_presence(C_FIFO_DEPTH);
 constant C_FIFO_DEPTH_UPDATED : integer  := get_fifo_depth(C_FIFO_EXIST, C_FIFO_DEPTH);

 -- width of control register
 constant C_SPICR_REG_WIDTH    : integer  := 10;-- refer DS

 -- width of status register
 constant C_SPISR_REG_WIDTH    : integer  := 11;-- refer DS

 -- count the counter width for calculating FIFO occupancy
 constant C_OCCUPANCY_NUM_BITS : integer  := get_fifo_occupancy_count(C_FIFO_DEPTH_UPDATED);

 -- width of spi shift register
 constant C_SPI_NUM_BITS_REG   : integer  := 8;-- this is fixed

 constant C_NUM_SPI_REGS       : integer  := 8;-- this is fixed

 constant C_IPISR_IPIER_BITS   : integer  := 14;-- total 14 interrupts - 0 to 13


 --------------------- ******************* ------------------------------------
 --                    AXI lite parameters
 --------------------- ******************* ------------------------------------
 constant C_S_AXI_SPI_MIN_SIZE : std_logic_vector(31 downto 0):= X"0000007c";
 constant C_USE_WSTRB          : integer := 1;
 constant C_DPHASE_TIMEOUT     : integer := 20;

 -- interupt mode
 constant IP_INTR_MODE_ARRAY   : INTEGER_ARRAY_TYPE(0 to (C_IPISR_IPIER_BITS-1)):=
 (
  others => INTR_REG_EVENT
 -- when C_SPI_MODE = 0
 -- Seven  interrupts if C_FIFO_DEPTH_UPDATED = 0
 -- OR
 -- Eight interrupts if C_FIFO_DEPTH_UPDATED = 0 and slave mode
 ----------------------- OR ---------------------------
 -- Nine  interrupts if C_FIFO_DEPTH_UPDATED = 16 and slave mode
 -- OR
 -- Seven interrupts if C_FIFO_DEPTH_UPDATED = 16 and master mode

 -- when C_SPI_MODE = 1 or 2
 -- Thirteen interrupts if C_FIFO_DEPTH_UPDATED = 16 and master mode
 );

 constant ZEROES               : std_logic_vector(31 downto 0):= X"00000000";

 -- this constant is defined as the start of SPI register addresses.
 constant C_IP_REG_ADDR_OFFSET : std_logic_vector := X"00000060";

 -- Address range array
 constant C_ARD_ADDR_RANGE_ARRAY: SLV64_ARRAY_TYPE :=
  (
 -- interrupt address base & high range
   --ZEROES & C_BASEADDR,
   --ZEROES & (C_BASEADDR or X"0000003F"),--interrupt address higher range
   ZEROES & X"00000000",
   ZEROES & X"0000003F",--interrupt address higher range

 -- soft reset register base & high addr
   --ZEROES & (C_BASEADDR or X"00000040"),
   --ZEROES & (C_BASEADDR or X"00000043"),--soft reset register high addr
   ZEROES & X"00000040",
--   ZEROES & X"00000043",--soft reset register high addr
   ZEROES & X"0000005C",--soft reset register NEW high addr for addressing holes


 -- SPI registers Base & High Address
 -- Range is 60 to 78 -- for internal registers
   --ZEROES & (C_BASEADDR or C_IP_REG_ADDR_OFFSET),
   --ZEROES & (C_BASEADDR or C_IP_REG_ADDR_OFFSET or X"00000018")
   ZEROES &  C_IP_REG_ADDR_OFFSET,
   ZEROES & (C_IP_REG_ADDR_OFFSET or X"00000018")
 );

  -- AXI4 Address range array
 constant C_ARD_ADDR_RANGE_ARRAY_AXI4_FULL: SLV64_ARRAY_TYPE :=
  (
 -- interrupt address base & high range
   --*ZEROES & C_S_AXI4_BASEADDR,
   --*ZEROES & (C_S_AXI4_BASEADDR or X"0000003F"),--interrupt address higher range
   ZEROES & X"00000000",
   ZEROES & X"0000003F",--soft reset register high addr

 -- soft reset register base & high addr
   --*ZEROES & (C_S_AXI4_BASEADDR or X"00000040"),
   --*ZEROES & (C_S_AXI4_BASEADDR or X"00000043"),--soft reset register high addr
   ZEROES & X"00000040",
--   ZEROES & X"00000043",--soft reset register high addr
   ZEROES & X"0000005C",--soft reset register NEW high addr for addressing holes

 -- SPI registers Base & High Address
 -- Range is 60 to 78 -- for internal registers
   ZEROES & (C_IP_REG_ADDR_OFFSET),
   ZEROES & (C_IP_REG_ADDR_OFFSET or X"00000018")
 );

-- No. of CE's required per address range
 constant C_ARD_NUM_CE_ARRAY     : INTEGER_ARRAY_TYPE :=
 (
  0 => 16    ,             -- 16  CEs required for interrupt
  --1 => 1,                  -- 1   CE  required for soft reset
  1 => 8,                  -- 8   CE  required for Addressing Holes in soft reset
  2 => C_NUM_SPI_REGS
 );

 -- no. of Chip Enable Signals
 constant C_NUM_CE_SIGNALS      : integer := calc_num_ce(C_ARD_NUM_CE_ARRAY);
 -- no. of Chip Select Signals
 constant C_NUM_CS_SIGNALS      : integer := (C_ARD_ADDR_RANGE_ARRAY'LENGTH/2);
 -----------------------------
 ----------------------- ******************* ------------------------------------
 ----                    XIP Mode parameters
 ----------------------- ******************* ------------------------------------
 -- No. of XIP SPI registers
 constant C_NUM_XIP_SPI_REGS   : integer  := 2;-- this is fixed
 -- width of XIP control register
 constant C_XIP_SPICR_REG_WIDTH: integer  := 2;-- refer DS
 -- width of XIP status register
 constant C_XIP_SPISR_REG_WIDTH: integer  := 5;-- refer DS

 -- Address range array
 constant C_XIP_LITE_ARD_ADDR_RANGE_ARRAY: SLV64_ARRAY_TYPE :=
  (
 -- XIP SPI registers Base & High Address
 -- Range is 60 to 64 -- for internal registers
   --*ZEROES & (C_BASEADDR or C_IP_REG_ADDR_OFFSET),
   --*ZEROES & (C_BASEADDR or C_IP_REG_ADDR_OFFSET or X"00000004")
   ZEROES & (C_IP_REG_ADDR_OFFSET),
   ZEROES & (C_IP_REG_ADDR_OFFSET or X"00000004")
 );

 -- No. of CE's required per address range
 constant C_XIP_LITE_ARD_NUM_CE_ARRAY     : INTEGER_ARRAY_TYPE :=
 (
  0 => C_NUM_XIP_SPI_REGS    -- 2  CEs required for XIP lite interface
 );

 -- no. of Chip Enable Signals
 constant C_NUM_XIP_CE_SIGNALS      : integer :=
                                    calc_num_ce(C_XIP_LITE_ARD_NUM_CE_ARRAY);

 function assign_addr_bits (addr_bits_info : integer) return string is
          variable addr_width_24 : integer:= 24;
          variable addr_width_32 : integer:= 32;
 begin
      if addr_bits_info = 24 then -- old logic for 24 bit addressing
         return X"00FFFFFF";--addr_width_24;
      else
         return X"FFFFFFFF";--addr_width_32;
      end if;
 end function assign_addr_bits;

 constant C_XIP_ADDR_OFFSET : std_logic_vector := X"FFFFFFFF";--assign_addr_bits(C_SPI_MEM_ADDR_BITS); -- X"00FFFFFF";
 -- XIP Full Interface Address range array
 constant C_XIP_FULL_ARD_ADDR_RANGE_ARRAY: SLV64_ARRAY_TYPE :=
  (
 -- XIP SPI registers Base & High Address
 -- Range is 60 to 64 -- for internal registers
   --*ZEROES & (C_S_AXI4_BASEADDR),
   --*ZEROES & (C_S_AXI4_BASEADDR or C_24_BIT_ADDR_OFFSET)
   ZEROES & X"00000000",
   ZEROES & C_XIP_ADDR_OFFSET
 );
 -- No. of CE's required per address range
 constant C_XIP_FULL_ARD_NUM_CE_ARRAY     : INTEGER_ARRAY_TYPE :=
 (
  0 => C_NUM_XIP_SPI_REGS    -- 0 CEs required for XIP Full interface
 );
 ---------------------------------------------------------------------------------
 constant C_XIP_FIFO_DEPTH : integer := 264;
 -------------------------------------------------------------------------------

 -- signal declaration
 signal bus2ip_clk           : std_logic;
 signal bus2ip_be_int        : std_logic_vector
                                     (((C_S_AXI_DATA_WIDTH/8)-1)downto 0);
 signal bus2ip_rdce_int      : std_logic_vector
                                       ((C_NUM_CE_SIGNALS-1)downto 0);
 signal bus2ip_wrce_int      : std_logic_vector
                                       ((C_NUM_CE_SIGNALS-1)downto 0);
 signal bus2ip_data_int      : std_logic_vector
                                       ((C_S_AXI_DATA_WIDTH-1)downto 0);
 signal ip2bus_data_int      : std_logic_vector
                                       ((C_S_AXI_DATA_WIDTH-1)downto 0 )
                             := (others  => '0');
 signal ip2bus_wrack_int     : std_logic := '0';
 signal ip2bus_rdack_int     : std_logic := '0';
 signal ip2bus_error_int     : std_logic := '0';

 signal bus2ip_reset_int     : std_logic;

 signal bus2ip_reset_ipif_inverted: std_logic;

 -- XIP signals
 signal bus2ip_xip_rdce_int: std_logic_vector(0 to C_NUM_XIP_CE_SIGNALS-1);
 signal bus2ip_xip_wrce_int: std_logic_vector(0 to C_NUM_XIP_CE_SIGNALS-1);

 signal burst_tr_int : std_logic;
 signal rready_int : std_logic;
 signal bus2ip_reset_ipif4_inverted : std_logic;
-----
begin
-----
-------------------------------------------------------------------------------
---------------
-- AXI_QUAD_SPI_LEGACY_MODE: This logic is legacy AXI4 Lite interface based design
---------------
QSPI_LEGACY_MD_GEN : if C_TYPE_OF_AXI4_INTERFACE = 0 generate
---------------
begin
-----
     AXI_LITE_IPIF_I : entity axi_lite_ipif_v2_0.axi_lite_ipif
     generic map
     (
      ----------------------------------------------------
      C_S_AXI_ADDR_WIDTH        => C_S_AXI_ADDR_WIDTH    ,
      C_S_AXI_DATA_WIDTH        => C_S_AXI_DATA_WIDTH    ,
      ----------------------------------------------------
      C_S_AXI_MIN_SIZE          => C_S_AXI_SPI_MIN_SIZE  ,
      C_USE_WSTRB               => C_USE_WSTRB           ,
      C_DPHASE_TIMEOUT          => C_DPHASE_TIMEOUT      ,
      ----------------------------------------------------
      C_ARD_ADDR_RANGE_ARRAY    => C_ARD_ADDR_RANGE_ARRAY,
      C_ARD_NUM_CE_ARRAY        => C_ARD_NUM_CE_ARRAY    ,
      C_FAMILY                  => C_FAMILY
      ----------------------------------------------------
     )
     port map
     (
      ---------------------------------------------------------
      S_AXI_ACLK                =>  s_axi_aclk,           -- in
      S_AXI_ARESETN             =>  s_axi_aresetn,        -- in
      ---------------------------------------------------------
      S_AXI_AWADDR              =>  s_axi_awaddr,         -- in
      S_AXI_AWVALID             =>  s_axi_awvalid,        -- in
      S_AXI_AWREADY             =>  s_axi_awready,        -- out
      S_AXI_WDATA               =>  s_axi_wdata,          -- in
      S_AXI_WSTRB               =>  s_axi_wstrb,          -- in
      S_AXI_WVALID              =>  s_axi_wvalid,         -- in
      S_AXI_WREADY              =>  s_axi_wready,         -- out
      S_AXI_BRESP               =>  s_axi_bresp,          -- out
      S_AXI_BVALID              =>  s_axi_bvalid,         -- out
      S_AXI_BREADY              =>  s_axi_bready,         -- in
      S_AXI_ARADDR              =>  s_axi_araddr,         -- in
      S_AXI_ARVALID             =>  s_axi_arvalid,        -- in
      S_AXI_ARREADY             =>  s_axi_arready,        -- out
      S_AXI_RDATA               =>  s_axi_rdata,          -- out
      S_AXI_RRESP               =>  s_axi_rresp,          -- out
      S_AXI_RVALID              =>  s_axi_rvalid,         -- out
      S_AXI_RREADY              =>  s_axi_rready,         -- in
      ----------------------------------------------------------
      -- IP Interconnect (IPIC) port signals
      Bus2IP_Clk                => bus2ip_clk,            -- out
      Bus2IP_Resetn             => bus2ip_reset_int,      -- out
      ----------------------------------------------------------
      Bus2IP_Addr               => open,                  -- out -- not used signal
      Bus2IP_RNW                => open,                  -- out
      Bus2IP_BE                 => bus2ip_be_int,         -- out
      Bus2IP_CS                 => open,                  -- out -- not used signal
      Bus2IP_RdCE               => bus2ip_rdce_int,       -- out -- little endian
      Bus2IP_WrCE               => bus2ip_wrce_int,       -- out -- little endian
      Bus2IP_Data               => bus2ip_data_int,       -- out -- little endian
      ----------------------------------------------------------
      IP2Bus_Data               => ip2bus_data_int,       -- in  -- little endian
      IP2Bus_WrAck              => ip2bus_wrack_int,      -- in
      IP2Bus_RdAck              => ip2bus_rdack_int,      -- in
      IP2Bus_Error              => ip2bus_error_int       -- in
      ----------------------------------------------------------
     );

     ----------------------
     --REG_RST_FRM_IPIF: convert active low to active hig reset to rest of
     --                     the core.
     ----------------------
     REG_RST_FRM_IPIF: process (S_AXI_ACLK) is
     begin
          if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
              bus2ip_reset_ipif_inverted <= not(bus2ip_reset_int);
          end if;
     end process REG_RST_FRM_IPIF;

     --    ----------------------------------------------------------------------
     --    -- Instansiating the SPI core
     --    ----------------------------------------------------------------------

     QSPI_CORE_INTERFACE_I : entity axi_quad_spi_v3_1.qspi_core_interface
     generic map
     (
      ------------------------------------------------
      -- AXI parameters
      C_FAMILY                  => C_FAMILY          ,
      C_SUB_FAMILY              => C_SUB_FAMILY      ,
      C_S_AXI_DATA_WIDTH        => C_S_AXI_DATA_WIDTH,
      ------------------------------------------------
      -- local constants
      C_NUM_CE_SIGNALS          => C_NUM_CE_SIGNALS  ,
      ------------------------------------------------
      -- SPI parameters
      --C_AXI4_CLK_PS             => C_AXI4_CLK_PS     ,
      --C_EXT_SPI_CLK_PS          => C_EXT_SPI_CLK_PS      ,
      C_FIFO_DEPTH              => C_FIFO_DEPTH_UPDATED      ,
      C_SCK_RATIO               => C_SCK_RATIO       ,
      C_NUM_SS_BITS             => C_NUM_SS_BITS     ,
      C_NUM_TRANSFER_BITS       => C_NUM_TRANSFER_BITS,
      C_SPI_MODE                => C_SPI_MODE        ,
      C_USE_STARTUP             => C_USE_STARTUP     ,
      C_SPI_MEMORY              => C_SPI_MEMORY      ,
      C_TYPE_OF_AXI4_INTERFACE  => C_TYPE_OF_AXI4_INTERFACE,
      ------------------------------------------------
      -- local constants
      C_FIFO_EXIST              => C_FIFO_EXIST      ,
      C_SPI_NUM_BITS_REG        => C_SPI_NUM_BITS_REG,
      C_OCCUPANCY_NUM_BITS      => C_OCCUPANCY_NUM_BITS,
      ------------------------------------------------
      -- local constants
      C_IP_INTR_MODE_ARRAY      => IP_INTR_MODE_ARRAY,
      ------------------------------------------------
      -- local constants
      C_SPICR_REG_WIDTH         => C_SPICR_REG_WIDTH ,
      C_SPISR_REG_WIDTH         => C_SPISR_REG_WIDTH
     )
     port map
     (
      EXT_SPI_CLK               =>  ext_spi_clk,               -- in
      ---------------------------------------------------
      -- IP Interconnect (IPIC) port signals
      Bus2IP_Clk                => bus2ip_clk,                 -- in
      Bus2IP_Reset              => bus2ip_reset_ipif_inverted, -- in
      ---------------------------------------------------
      Bus2IP_BE                 => bus2ip_be_int,              -- in vector
   -- Bus2IP_CS                 => bus2ip_cs_int,
      Bus2IP_RdCE               => bus2ip_rdce_int,            -- in vector
      Bus2IP_WrCE               => bus2ip_wrce_int,            -- in vector
      Bus2IP_Data               => bus2ip_data_int,            -- in vector
      ---------------------------------------------------
      IP2Bus_Data               => ip2bus_data_int,            -- out vector
      IP2Bus_WrAck              => ip2bus_wrack_int,           -- out
      IP2Bus_RdAck              => ip2bus_rdack_int,           -- out
      IP2Bus_Error              => ip2bus_error_int,           -- out
      ---------------------------------------------------
      burst_tr                  => burst_tr_int,
      rready                    => '0',
      WVALID                    => '0',
      ---------------------------------------------------
      --SPI Ports
      IO0_I                     => io0_i,-- mosi
      IO0_O                     => io0_o,
      IO0_T                     => io0_t,
      -----
      IO1_I                     => io1_i,-- miso
      IO1_O                     => io1_o,
      IO1_T                     => io1_t,
      -----
      IO2_I                     => io2_i,
      IO2_O                     => io2_o,
      IO2_T                     => io2_t,
      -----
      IO3_I                     => io3_i,
      IO3_O                     => io3_o,
      IO3_T                     => io3_t,
      -----
      SCK_I                     => sck_i,
      SCK_O                     => sck_o,
      SCK_T                     => sck_t,
      -----
      SPISEL                    => spisel,
      -----
      SS_I                      => ss_i,
      SS_O                      => ss_o,
      SS_T                      => ss_t,
      -----
      IP2INTC_Irpt              => ip2intc_irpt
      -----
     );

     burst_tr_int <= '0';
end generate QSPI_LEGACY_MD_GEN;
------------------------------------------------------------------------------

QSPI_ENHANCED_MD_GEN: if  C_TYPE_OF_AXI4_INTERFACE = 1 and C_XIP_MODE = 0 generate
---------------
begin
-----
     -- AXI_QUAD_SPI_I: core instance
     QSPI_ENHANCED_MD_IPIF_I : entity axi_quad_spi_v3_1.axi_qspi_enhanced_mode
     generic map(
      -- General Parameters
      C_FAMILY                 => C_FAMILY                , -- : string               := "virtex7";
      C_SUB_FAMILY             => C_SUB_FAMILY            , -- : string               := "virtex7";
      -------------------------
      --C_TYPE_OF_AXI4_INTERFACE => C_TYPE_OF_AXI4_INTERFACE, -- : integer range 0 to 1 := 0;--default AXI4 Lite Legacy mode
      --C_XIP_MODE                => C_XIP_MODE           , -- : integer range 0 to 1 := 0;--default NON XIP Mode
      --C_AXI4_CLK_PS            => C_AXI4_CLK_PS           , -- : integer              := 10000;--AXI clock period
      --C_EXT_SPI_CLK_PS         => C_EXT_SPI_CLK_PS        , -- : integer              := 10000;--ext clock period
      C_FIFO_DEPTH             => C_FIFO_DEPTH_UPDATED            , -- : integer              := 16;-- allowed 0,16,256.
      C_SCK_RATIO              => C_SCK_RATIO             , -- : integer              := 16;--default in legacy mode
      C_NUM_SS_BITS            => C_NUM_SS_BITS           , -- : integer range 1 to 32:= 1;
      C_NUM_TRANSFER_BITS      => C_NUM_TRANSFER_BITS     , -- : integer              := 8; -- allowed 8, 16, 32
      -------------------------
      C_SPI_MODE               => C_SPI_MODE              , -- : integer range 0 to 2 := 0; -- used for differentiating
      C_USE_STARTUP            => C_USE_STARTUP           , -- : integer range 0 to 1 := 1; --
      C_SPI_MEMORY             => C_SPI_MEMORY            , -- : integer range 0 to 2 := 1; -- 0 - mixed mode,
      -------------------------
      -- AXI4 Full Interface Parameters
      C_S_AXI4_ADDR_WIDTH      => C_S_AXI4_ADDR_WIDTH     , -- : integer range 32 to 32 := 32;
      C_S_AXI4_DATA_WIDTH      => C_S_AXI4_DATA_WIDTH     , -- : integer range 32 to 32 := 32;
      C_S_AXI4_ID_WIDTH        => C_S_AXI4_ID_WIDTH       , -- : integer range 1 to 16  := 4;
      -------------------------
      --*C_AXI4_BASEADDR          => C_S_AXI4_BASEADDR         , -- : std_logic_vector       := x"FFFFFFFF";
      --*C_AXI4_HIGHADDR          => C_S_AXI4_HIGHADDR         , -- : std_logic_vector       := x"00000000"
      -------------------------
      C_S_AXI_SPI_MIN_SIZE     => C_S_AXI_SPI_MIN_SIZE    ,
      -------------------------
      C_ARD_ADDR_RANGE_ARRAY    => C_ARD_ADDR_RANGE_ARRAY_AXI4_FULL ,
      C_ARD_NUM_CE_ARRAY        => C_ARD_NUM_CE_ARRAY     ,
      C_SPI_MEM_ADDR_BITS           => C_SPI_MEM_ADDR_BITS        -- newly added 
    )
    port map(
     -- external async clock for SPI interface logic
     EXT_SPI_CLK     => ext_spi_clk    , -- : in std_logic;
     -----------------------------------
     S_AXI4_ACLK     => s_axi4_aclk    , -- : in std_logic;
     S_AXI4_ARESETN  => s_axi4_aresetn , -- : in std_logic;
     -------------------------------
     -------------------------------
     --*AXI4 Full port interface* --
     -------------------------------
     ------------------------------------
     -- AXI Write Address channel signals
     ------------------------------------
     S_AXI4_AWID    => s_axi4_awid   , -- : in  std_logic_vector((C_S_AXI4_ID_WIDTH-1) downto 0);
     S_AXI4_AWADDR  => s_axi4_awaddr , -- : in  std_logic_vector((C_S_AXI4_ADDR_WIDTH-1) downto 0);
     S_AXI4_AWLEN   => s_axi4_awlen  , -- : in  std_logic_vector(7 downto 0);
     S_AXI4_AWSIZE  => s_axi4_awsize , -- : in  std_logic_vector(2 downto 0);
     S_AXI4_AWBURST => s_axi4_awburst, -- : in  std_logic_vector(1 downto 0);
     S_AXI4_AWLOCK  => s_axi4_awlock , -- : in  std_logic;                   -- not supported in design
     S_AXI4_AWCACHE => s_axi4_awcache, -- : in  std_logic_vector(3 downto 0);-- not supported in design
     S_AXI4_AWPROT  => s_axi4_awprot , -- : in  std_logic_vector(2 downto 0);-- not supported in design
     S_AXI4_AWVALID => s_axi4_awvalid, -- : in  std_logic;
     S_AXI4_AWREADY => s_axi4_awready, -- : out std_logic;
     ---------------------------------------
     -- AXI4 Full Write data channel signals
     ---------------------------------------
     S_AXI4_WDATA   => s_axi4_wdata , -- : in  std_logic_vector((C_S_AXI4_DATA_WIDTH-1)downto 0);
     S_AXI4_WSTRB   => s_axi4_wstrb , -- : in  std_logic_vector(((C_S_AXI4_DATA_WIDTH/8)-1) downto 0);
     S_AXI4_WLAST   => s_axi4_wlast , -- : in  std_logic;
     S_AXI4_WVALID  => s_axi4_wvalid, -- : in  std_logic;
     S_AXI4_WREADY  => s_axi4_wready, -- : out std_logic;
     -------------------------------------------
     -- AXI4 Full Write response channel Signals
     -------------------------------------------
     S_AXI4_BID     => s_axi4_bid   , -- : out std_logic_vector((C_S_AXI4_ID_WIDTH-1) downto 0);
     S_AXI4_BRESP   => s_axi4_bresp , -- : out std_logic_vector(1 downto 0);
     S_AXI4_BVALID  => s_axi4_bvalid, -- : out std_logic;
     S_AXI4_BREADY  => s_axi4_bready, -- : in  std_logic;
     -----------------------------------
     -- AXI Read Address channel signals
     -----------------------------------
     S_AXI4_ARID    => s_axi4_arid   , -- : in  std_logic_vector((C_S_AXI4_ID_WIDTH-1) downto 0);
     S_AXI4_ARADDR  => s_axi4_araddr , -- : in  std_logic_vector((C_S_AXI4_ADDR_WIDTH-1) downto 0);
     S_AXI4_ARLEN   => s_axi4_arlen  , -- : in  std_logic_vector(7 downto 0);
     S_AXI4_ARSIZE  => s_axi4_arsize , -- : in  std_logic_vector(2 downto 0);
     S_AXI4_ARBURST => s_axi4_arburst, -- : in  std_logic_vector(1 downto 0);
     S_AXI4_ARLOCK  => s_axi4_arlock , -- : in  std_logic;                    -- not supported in design
     S_AXI4_ARCACHE => s_axi4_arcache, -- : in  std_logic_vector(3 downto 0);-- not supported in design
     S_AXI4_ARPROT  => s_axi4_arprot , -- : in  std_logic_vector(2 downto 0);-- not supported in design
     S_AXI4_ARVALID => s_axi4_arvalid, -- : in  std_logic;
     S_AXI4_ARREADY => s_axi4_arready, -- : out std_logic;
     --------------------------------
     -- AXI Read Data Channel signals
     --------------------------------
     S_AXI4_RID     => s_axi4_rid   , -- : out std_logic_vector((C_S_AXI4_ID_WIDTH-1) downto 0);
     S_AXI4_RDATA   => s_axi4_rdata , -- : out std_logic_vector((C_S_AXI4_DATA_WIDTH-1) downto 0);
     S_AXI4_RRESP   => s_axi4_rresp , -- : out std_logic_vector(1 downto 0);
     S_AXI4_RLAST   => s_axi4_rlast , -- : out std_logic;
     S_AXI4_RVALID  => s_axi4_rvalid, -- : out std_logic;
     S_AXI4_RREADY  => s_axi4_rready, -- : in  std_logic;
     ----------------------------------------------------------
     -- IP Interconnect (IPIC) port signals
     Bus2IP_Clk                => bus2ip_clk,                     -- out
     Bus2IP_Reset              => bus2ip_reset_ipif_inverted    , -- out
     ----------------------------------------------------------
     -- Bus2IP_Addr               => open,                  -- out -- not used signal
     Bus2IP_RNW                => open,                  -- out
     Bus2IP_BE                 => bus2ip_be_int,         -- out
     Bus2IP_CS                 => open,                  -- out -- not used signal
     Bus2IP_RdCE               => bus2ip_rdce_int,       -- out -- little endian
     Bus2IP_WrCE               => bus2ip_wrce_int,       -- out -- little endian
     Bus2IP_Data               => bus2ip_data_int,       -- out -- little endian
     ----------------------------------------------------------
     IP2Bus_Data               => ip2bus_data_int,       -- in  -- little endian
     IP2Bus_WrAck              => ip2bus_wrack_int,      -- in
     IP2Bus_RdAck              => ip2bus_rdack_int,      -- in
     IP2Bus_Error              => ip2bus_error_int,      -- in
     ----------------------------------------------------------
     burst_tr                  => burst_tr_int,          -- in
     rready                    => rready_int
    );
    --    ----------------------------------------------------------------------
    --    -- Instansiating the SPI core
    --    ----------------------------------------------------------------------

     QSPI_CORE_INTERFACE_I : entity axi_quad_spi_v3_1.qspi_core_interface
     generic map
     (
      ------------------------------------------------
      -- AXI parameters
      C_FAMILY                  => C_FAMILY          ,
      C_SUB_FAMILY              => C_SUB_FAMILY      ,
      C_S_AXI_DATA_WIDTH        => C_S_AXI_DATA_WIDTH,
      ------------------------------------------------
      -- local constants
      C_NUM_CE_SIGNALS          => C_NUM_CE_SIGNALS  ,
      ------------------------------------------------
      -- SPI parameters
      --C_AXI4_CLK_PS             => C_AXI4_CLK_PS     ,
      --C_EXT_SPI_CLK_PS          => C_EXT_SPI_CLK_PS  ,
      C_FIFO_DEPTH              => C_FIFO_DEPTH_UPDATED      ,
      C_SCK_RATIO               => C_SCK_RATIO       ,
      C_NUM_SS_BITS             => C_NUM_SS_BITS     ,
      C_NUM_TRANSFER_BITS       => C_NUM_TRANSFER_BITS,
      C_SPI_MODE                => C_SPI_MODE        ,
      C_USE_STARTUP             => C_USE_STARTUP     ,
      C_SPI_MEMORY              => C_SPI_MEMORY      ,
      C_TYPE_OF_AXI4_INTERFACE  => C_TYPE_OF_AXI4_INTERFACE,
      ------------------------------------------------
      -- local constants
      C_FIFO_EXIST              => C_FIFO_EXIST      ,
      C_SPI_NUM_BITS_REG        => C_SPI_NUM_BITS_REG,
      C_OCCUPANCY_NUM_BITS      => C_OCCUPANCY_NUM_BITS,
      ------------------------------------------------
      -- local constants
      C_IP_INTR_MODE_ARRAY      => IP_INTR_MODE_ARRAY,
      ------------------------------------------------
      -- local constants
      C_SPICR_REG_WIDTH         => C_SPICR_REG_WIDTH ,
      C_SPISR_REG_WIDTH         => C_SPISR_REG_WIDTH
     )
     port map
     (
      EXT_SPI_CLK               =>  EXT_SPI_CLK,               -- in
      ---------------------------------------------------
      -- IP Interconnect (IPIC) port signals
      Bus2IP_Clk                => bus2ip_clk,                 -- in
      Bus2IP_Reset              => bus2ip_reset_ipif_inverted,               -- in
      ---------------------------------------------------
      Bus2IP_BE                 => bus2ip_be_int,              -- in vector
   -- Bus2IP_CS                 => bus2ip_cs_int,
      Bus2IP_RdCE               => bus2ip_rdce_int,            -- in vector
      Bus2IP_WrCE               => bus2ip_wrce_int,            -- in vector
      Bus2IP_Data               => bus2ip_data_int,            -- in vector
      ---------------------------------------------------
      IP2Bus_Data               => ip2bus_data_int,            -- out vector
      IP2Bus_WrAck              => ip2bus_wrack_int,           -- out
      IP2Bus_RdAck              => ip2bus_rdack_int,           -- out
      IP2Bus_Error              => ip2bus_error_int,           -- out
      ---------------------------------------------------
      burst_tr                  => burst_tr_int,
      rready                    => rready_int,
      WVALID                    => S_AXI4_WVALID,
      --SPI Ports
      IO0_I                     => io0_i,-- mosi
      IO0_O                     => io0_o,
      IO0_T                     => io0_t,
      -----
      IO1_I                     => io1_i,-- miso
      IO1_O                     => io1_o,
      IO1_T                     => io1_t,
      -----
      IO2_I                     => io2_i,
      IO2_O                     => io2_o,
      IO2_T                     => io2_t,
      -----
      IO3_I                     => io3_i,
      IO3_O                     => io3_o,
      IO3_T                     => io3_t,
      -----
      SCK_I                     => sck_i,
      SCK_O                     => sck_o,
      SCK_T                     => sck_t,
      -----
      SPISEL                    => spisel,
      -----
      SS_I                      => ss_i,
      SS_O                      => ss_o,
      SS_T                      => ss_t,
      -----
      IP2INTC_Irpt              => ip2intc_irpt
      -----
     );

end generate QSPI_ENHANCED_MD_GEN;
--------------------------------------------------------------------------------
-----------------
-- XIP_MODE: This logic is used in XIP mode where AXI4 Lite & AXI4 Full interface
--           used in the design
---------------
XIP_MODE_GEN : if C_TYPE_OF_AXI4_INTERFACE = 1 and C_XIP_MODE = 1 generate
---------------
constant XIPCR    : natural := 0;    -- at address C_BASEADDR + 60 h
constant XIPSR    : natural := 1;
--
signal bus2ip_reset_int : std_logic;
signal bus2ip_clk_int   : std_logic;

signal bus2ip_data_int          : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal ip2bus_data_int          : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
signal ip2bus_wrack_int         : std_logic;
signal ip2bus_rdack_int         : std_logic;
signal ip2bus_error_int         : std_logic;
signal bus2ip_reset_ipif_inverted: std_logic;
signal IP2Bus_XIPCR_WrAck : std_logic;
signal IP2Bus_XIPCR_RdAck : std_logic;
signal XIPCR_1_CPOL_int         : std_logic;
signal XIPCR_0_CPHA_int         : std_logic;
signal IP2Bus_XIPCR_Data_int : std_logic_vector((C_XIP_SPICR_REG_WIDTH-1) downto 0);
signal IP2Bus_XIPSR_Data_int : std_logic_vector((C_XIP_SPISR_REG_WIDTH-1) downto 0);
signal TO_XIPSR_AXI_TR_ERR_int   : std_logic;
signal TO_XIPSR_mst_modf_err_int : std_logic;
signal TO_XIPSR_axi_rx_full_int  : std_logic;
signal TO_XIPSR_axi_rx_empty_int : std_logic;

signal xipsr_cpha_cpol_err_int        :std_logic;
signal xipsr_cmd_err_int              :std_logic;
signal ip2bus_xipsr_wrack             :std_logic;
signal ip2bus_xipsr_rdack             :std_logic;


signal xipsr_axi_tr_err_int           :std_logic;
signal xipsr_axi_tr_done_int          :std_logic;
signal ip2bus_xipsr_rdack_int         :std_logic;
signal ip2bus_xipsr_wrack_int         :std_logic;
signal MISO_I_int                   :std_logic;
signal SCK_O_int                    :std_logic;
signal TO_XIPSR_trans_error_int     :std_logic;
signal TO_XIPSR_CPHA_CPOL_ERR_int   :std_logic;
signal ip2bus_wrack_core_reg_d1     :std_logic;
signal ip2bus_wrack_core_reg        :std_logic;
signal ip2bus_rdack_core_reg_d1     :std_logic;
signal ip2bus_rdack_core_reg_d2     :std_logic;
signal ip2Bus_RdAck_core_reg_d3     :std_logic;
signal Rst_to_spi_int               :std_logic;

begin
-----
    ---- AXI4 Lite interface instance and interface with the port list
    AXI_LITE_IPIF_I : entity axi_lite_ipif_v2_0.axi_lite_ipif
    generic map
     (
      ----------------------------------------------------
      C_S_AXI_ADDR_WIDTH        => C_S_AXI_ADDR_WIDTH    ,
      C_S_AXI_DATA_WIDTH        => C_S_AXI_DATA_WIDTH    ,
      ----------------------------------------------------
      C_S_AXI_MIN_SIZE          => C_S_AXI_SPI_MIN_SIZE  ,
      C_USE_WSTRB               => C_USE_WSTRB           ,
      C_DPHASE_TIMEOUT          => C_DPHASE_TIMEOUT      ,
      ----------------------------------------------------
      C_ARD_ADDR_RANGE_ARRAY    => C_XIP_LITE_ARD_ADDR_RANGE_ARRAY,
      C_ARD_NUM_CE_ARRAY        => C_XIP_LITE_ARD_NUM_CE_ARRAY    ,
      C_FAMILY                  => C_FAMILY
      ----------------------------------------------------
     )
    port map
     (        -- AXI4 Lite interface
      ---------------------------------------------------------
      S_AXI_ACLK                =>  s_axi_aclk,           -- in
      S_AXI_ARESETN             =>  s_axi_aresetn,        -- in
      ---------------------------------------------------------
      S_AXI_AWADDR              =>  s_axi_awaddr,         -- in
      S_AXI_AWVALID             =>  s_axi_awvalid,        -- in
      S_AXI_AWREADY             =>  s_axi_awready,        -- out
      S_AXI_WDATA               =>  s_axi_wdata,          -- in
      S_AXI_WSTRB               =>  s_axi_wstrb,          -- in
      S_AXI_WVALID              =>  s_axi_wvalid,         -- in
      S_AXI_WREADY              =>  s_axi_wready,         -- out
      S_AXI_BRESP               =>  s_axi_bresp,          -- out
      S_AXI_BVALID              =>  s_axi_bvalid,         -- out
      S_AXI_BREADY              =>  s_axi_bready,         -- in
      S_AXI_ARADDR              =>  s_axi_araddr,         -- in
      S_AXI_ARVALID             =>  s_axi_arvalid,        -- in
      S_AXI_ARREADY             =>  s_axi_arready,        -- out
      S_AXI_RDATA               =>  s_axi_rdata,          -- out
      S_AXI_RRESP               =>  s_axi_rresp,          -- out
      S_AXI_RVALID              =>  s_axi_rvalid,         -- out
      S_AXI_RREADY              =>  s_axi_rready,         -- in
      ----------------------------------------------------------
      -- IP Interconnect (IPIC) port signals
      Bus2IP_Clk                => bus2ip_clk_int  ,            -- out
      Bus2IP_Resetn             => bus2ip_reset_int,      -- out
      ----------------------------------------------------------
      Bus2IP_Addr               => open,                  -- out -- not used signal
      Bus2IP_RNW                => open,                  -- out
      Bus2IP_BE                 => open,                  -- bus2ip_be_int,         -- out
      Bus2IP_CS                 => open,                  -- out -- not used signal
      Bus2IP_RdCE               => bus2ip_xip_rdce_int,   -- out -- little endian
      Bus2IP_WrCE               => bus2ip_xip_wrce_int,   -- out -- little endian
      Bus2IP_Data               => bus2ip_data_int,       -- out -- little endian
      ----------------------------------------------------------
      IP2Bus_Data               => ip2bus_data_int,       -- in  -- little endian
      IP2Bus_WrAck              => ip2bus_wrack_int,      -- in
      IP2Bus_RdAck              => ip2bus_rdack_int,      -- in
      IP2Bus_Error              => ip2bus_error_int       -- in
      ----------------------------------------------------------
     );
     --------------------------------------------------------------------------
     ip2bus_error_int <= '0'; -- there is no error in this mode
     ----------------------
     --REG_RST_FRM_IPIF: convert active low to active hig reset to rest of
     --                     the core.
     ----------------------
     REG_RST_FRM_IPIF: process (S_AXI_ACLK) is
     begin
          if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
              bus2ip_reset_ipif_inverted <= not(S_AXI_ARESETN);
          end if;
     end process REG_RST_FRM_IPIF;
     --------------------------------------------------------------------------
     XIP_CR_I : entity axi_quad_spi_v3_1.xip_cntrl_reg
     generic map
      (
       C_XIP_SPICR_REG_WIDTH => C_XIP_SPICR_REG_WIDTH,
       C_S_AXI_DATA_WIDTH    => C_S_AXI_DATA_WIDTH   ,
       C_SPI_MODE            => C_SPI_MODE
      )
     port map(
       Bus2IP_Clk            => S_AXI_ACLK,                 --  : in  std_logic;
       Soft_Reset_op         => bus2ip_reset_ipif_inverted, --  : in  std_logic;
       ------------------------
       Bus2IP_XIPCR_WrCE     => bus2ip_xip_wrce_int(XIPCR), --  : in  std_logic;
       Bus2IP_XIPCR_RdCE     => bus2ip_xip_rdce_int(XIPCR), --  : in  std_logic;
       Bus2IP_XIPCR_data     => bus2ip_data_int           , --  : in  std_logic_vector(0 to (C_S_AXI_DATA_WIDTH-1));
       ------------------------
       ip2Bus_RdAck_core     => ip2Bus_RdAck_core_reg_d2, -- IP2Bus_XIPCR_WrAck,
       ip2Bus_WrAck_core     => ip2Bus_WrAck_core_reg, -- IP2Bus_XIPCR_RdAck,
       ------------------------
       --XIPCR_7_0_CMD         => XIPCR_7_0_CMD,               -- out std_logic_vector;
       XIPCR_1_CPOL          => XIPCR_1_CPOL_int ,         -- out std_logic;
       XIPCR_0_CPHA          => XIPCR_0_CPHA_int ,         -- out std_logic;
       ------------------------
       IP2Bus_XIPCR_Data     => IP2Bus_XIPCR_Data_int,      -- out std_logic;
       ------------------------
       TO_XIPSR_CPHA_CPOL_ERR=> TO_XIPSR_CPHA_CPOL_ERR_int  -- out std_logic
     );
     --------------------------------------------------------------------------
     REG_WR_ACK_P:process(S_AXI_ACLK)is
     begin
     -----
          if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
           if(bus2ip_reset_ipif_inverted = '1')then
               ip2Bus_WrAck_core_reg_d1 <= '0';
               ip2Bus_WrAck_core_reg    <= '0';
           else
               ip2Bus_WrAck_core_reg_d1  <= bus2ip_xip_wrce_int(XIPCR) or
                                            bus2ip_xip_wrce_int(XIPSR);
               ip2Bus_WrAck_core_reg     <= (bus2ip_xip_wrce_int(XIPCR) or
                                            bus2ip_xip_wrce_int(XIPSR)) and
                                            (not ip2Bus_WrAck_core_reg_d1);
           end if;
        end if;
     end process REG_WR_ACK_P;
     -------------------------
     ip2bus_wrack_int <= ip2Bus_WrAck_core_reg;
     -------------------------

     REG_RD_ACK_P:process(S_AXI_ACLK)is
     begin
     -----
          if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
           if(bus2ip_reset_ipif_inverted = '1')then
               ip2Bus_RdAck_core_reg_d1 <= '0';
               ip2Bus_RdAck_core_reg_d2 <= '0';
               ip2Bus_RdAck_core_reg_d3 <= '0';
           else
               ip2Bus_RdAck_core_reg_d1 <= bus2ip_xip_rdce_int(XIPCR) or
                                           bus2ip_xip_rdce_int(XIPSR);
               ip2Bus_RdAck_core_reg_d2 <= (bus2ip_xip_rdce_int(XIPCR) or
                                           bus2ip_xip_rdce_int(XIPSR)) and
                                           (not ip2Bus_RdAck_core_reg_d1);
               ip2Bus_RdAck_core_reg_d3 <= ip2Bus_RdAck_core_reg_d2;
           end if;
        end if;
     end process REG_RD_ACK_P;
     -------------------------
     ip2bus_rdack_int <= ip2Bus_RdAck_core_reg_d3;
     -------------------------
     REG_IP2BUS_DATA_P:process(S_AXI_ACLK)is
     begin
     -----
          if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
           if(bus2ip_reset_ipif_inverted = '1')then
               ip2bus_data_int <= (others => '0');
           elsif(ip2Bus_RdAck_core_reg_d2 = '1') then
               ip2bus_data_int  <= ("000000000000000000000000000000" & IP2Bus_XIPCR_Data_int) or
                                   ("000000000000000000000000000"    & IP2Bus_XIPSR_Data_int);
           end if;
        end if;
     end process REG_IP2BUS_DATA_P;
     -------------------------
     --------------------------------------------------------------------------
     XIP_SR_I : entity axi_quad_spi_v3_1.xip_status_reg
     generic map
     (
      C_XIP_SPISR_REG_WIDTH => C_XIP_SPISR_REG_WIDTH,
      C_S_AXI_DATA_WIDTH    => C_S_AXI_DATA_WIDTH
     )
    port map(
      Bus2IP_Clk            => S_AXI_ACLK,                 --    : in  std_logic;
      Soft_Reset_op         => bus2ip_reset_ipif_inverted, --    : in  std_logic;
      ------------------------
      XIPSR_AXI_TR_ERR      => TO_XIPSR_AXI_TR_ERR_int,       --    : in  std_logic;
      XIPSR_CPHA_CPOL_ERR   => TO_XIPSR_CPHA_CPOL_ERR_int,    --    : in  std_logic;
      XIPSR_MST_MODF_ERR    => TO_XIPSR_mst_modf_err_int,  --    : in  std_logic;
      XIPSR_AXI_RX_FULL     => TO_XIPSR_axi_rx_full_int,   --    : in  std_logic;
      XIPSR_AXI_RX_EMPTY    => TO_XIPSR_axi_rx_empty_int,  --    : in  std_logic;
      ------------------------
      Bus2IP_XIPSR_WrCE     => bus2ip_xip_wrce_int(XIPSR),
      Bus2IP_XIPSR_RdCE     => bus2ip_xip_rdce_int(XIPSR),
      -------------------
      IP2Bus_XIPSR_Data     => IP2Bus_XIPSR_Data_int     ,
      ip2Bus_RdAck          => ip2Bus_RdAck_core_reg_d3
    );
    ---------------------------------------------------------------------------
    --REG_RST4_FRM_IPIF: convert active low to active hig reset to rest of
    --                     the core.
    ----------------------
    REG_RST4_FRM_IPIF: process (S_AXI4_ACLK) is
    begin
         if(S_AXI4_ACLK'event and S_AXI4_ACLK = '1') then
             bus2ip_reset_ipif4_inverted <= not(S_AXI4_ARESETN);
         end if;
    end process REG_RST4_FRM_IPIF;
    -------------------------------------------------------------------------
    RESET_SYNC_AXI_SPI_CLK_INST:entity axi_quad_spi_v3_1.reset_sync_module
    port map(
              EXT_SPI_CLK        => EXT_SPI_CLK                 ,-- in std_logic;
              Soft_Reset_frm_axi => bus2ip_reset_ipif4_inverted ,-- in std_logic;
              Rst_to_spi         => Rst_to_spi_int               -- out std_logic;
    );
    --------------------------------------------------------------------------
    AXI_QSPI_XIP_I : entity axi_quad_spi_v3_1.axi_qspi_xip_if
    generic map
     (
      C_FAMILY                 => C_FAMILY                ,
      C_SUB_FAMILY             => C_SUB_FAMILY            ,
      -------------------------
      --C_TYPE_OF_AXI4_INTERFACE => C_TYPE_OF_AXI4_INTERFACE,
      --C_XIP_MODE               => C_XIP_MODE              ,
      --C_AXI4_CLK_PS            => C_AXI4_CLK_PS           ,
      --C_EXT_SPI_CLK_PS         => C_EXT_SPI_CLK_PS            ,
      --C_FIFO_DEPTH             => C_FIFO_DEPTH_UPDATED            ,
      C_SPI_MEM_ADDR_BITS          => C_SPI_MEM_ADDR_BITS         ,
      C_SCK_RATIO              => C_SCK_RATIO             ,
      C_NUM_SS_BITS            => C_NUM_SS_BITS           ,
      C_NUM_TRANSFER_BITS      => C_NUM_TRANSFER_BITS     ,
      -------------------------
      C_SPI_MODE               => C_SPI_MODE              ,
      C_USE_STARTUP            => C_USE_STARTUP           ,
      C_SPI_MEMORY             => C_SPI_MEMORY            ,
      -------------------------
      -- AXI4 Full Interface Parameters
      C_S_AXI4_ADDR_WIDTH      => C_S_AXI4_ADDR_WIDTH     ,
      C_S_AXI4_DATA_WIDTH      => C_S_AXI4_DATA_WIDTH     ,
      C_S_AXI4_ID_WIDTH        => C_S_AXI4_ID_WIDTH       ,
      -------------------------
      --*C_AXI4_BASEADDR          => C_S_AXI4_BASEADDR         ,
      --*C_AXI4_HIGHADDR          => C_S_AXI4_HIGHADDR         ,
      -------------------------
      --C_XIP_SPICR_REG_WIDTH    => C_XIP_SPICR_REG_WIDTH   ,
      --C_XIP_SPISR_REG_WIDTH    => C_XIP_SPISR_REG_WIDTH         ,
      -------------------------
      C_XIP_FULL_ARD_ADDR_RANGE_ARRAY   => C_XIP_FULL_ARD_ADDR_RANGE_ARRAY,
      C_XIP_FULL_ARD_NUM_CE_ARRAY       => C_XIP_FULL_ARD_NUM_CE_ARRAY
     )
    port map
     (
     -- external async clock for SPI interface logic
     EXT_SPI_CLK    => ext_spi_clk   , -- : in std_logic;
     Rst_to_spi     => Rst_to_spi_int,
     ----------------------------------
     S_AXI_ACLK     => s_axi_aclk    , -- : in std_logic;
     S_AXI_ARESETN  => bus2ip_reset_ipif_inverted, -- : in std_logic;
     ----------------------------------
     S_AXI4_ACLK    => s_axi4_aclk    , -- : in std_logic;
     S_AXI4_ARESET  => bus2ip_reset_ipif4_inverted, -- : in std_logic;
     -------------------------------
     --*AXI4 Full port interface* --
     -------------------------------
     ------------------------------------
     -- AXI Write Address Channel Signals
     ------------------------------------
     S_AXI4_AWID    => s_axi4_awid   , -- : in  std_logic_vector((C_S_AXI4_ID_WIDTH-1) downto 0);
     S_AXI4_AWADDR  => s_axi4_awaddr , -- : in  std_logic_vector((C_S_AXI4_ADDR_WIDTH-1) downto 0);
     S_AXI4_AWLEN   => s_axi4_awlen  , -- : in  std_logic_vector(7 downto 0);
     S_AXI4_AWSIZE  => s_axi4_awsize , -- : in  std_logic_vector(2 downto 0);
     S_AXI4_AWBURST => s_axi4_awburst, -- : in  std_logic_vector(1 downto 0);
     S_AXI4_AWLOCK  => s_axi4_awlock , -- : in  std_logic;                   -- not supported in design
     S_AXI4_AWCACHE => s_axi4_awcache, -- : in  std_logic_vector(3 downto 0);-- not supported in design
     S_AXI4_AWPROT  => s_axi4_awprot , -- : in  std_logic_vector(2 downto 0);-- not supported in design
     S_AXI4_AWVALID => s_axi4_awvalid, -- : in  std_logic;
     S_AXI4_AWREADY => s_axi4_awready, -- : out std_logic;
     ---------------------------------------
     -- AXI4 Full Write data channel Signals
     ---------------------------------------
     S_AXI4_WDATA   => s_axi4_wdata  , -- : in  std_logic_vector((C_S_AXI4_DATA_WIDTH-1)downto 0);
     S_AXI4_WSTRB   => s_axi4_wstrb  , -- : in  std_logic_vector(((C_S_AXI4_DATA_WIDTH/8)-1) downto 0);
     S_AXI4_WLAST   => s_axi4_wlast  , -- : in  std_logic;
     S_AXI4_WVALID  => s_axi4_wvalid , -- : in  std_logic;
     S_AXI4_WREADY  => s_axi4_wready , -- : out std_logic;
     -------------------------------------------
     -- AXI4 Full Write response channel Signals
     -------------------------------------------
     S_AXI4_BID     => s_axi4_bid    , -- : out std_logic_vector((C_S_AXI4_ID_WIDTH-1) downto 0);
     S_AXI4_BRESP   => s_axi4_bresp  , -- : out std_logic_vector(1 downto 0);
     S_AXI4_BVALID  => s_axi4_bvalid , -- : out std_logic;
     S_AXI4_BREADY  => s_axi4_bready , -- : in  std_logic;
     -----------------------------------
     -- AXI Read Address channel signals
     -----------------------------------
     S_AXI4_ARID    => s_axi4_arid   , -- : in  std_logic_vector((C_S_AXI4_ID_WIDTH-1) downto 0);
     S_AXI4_ARADDR  => s_axi4_araddr , -- : in  std_logic_vector((C_S_AXI4_ADDR_WIDTH-1) downto 0);
     S_AXI4_ARLEN   => s_axi4_arlen  , -- : in  std_logic_vector(7 downto 0);
     S_AXI4_ARSIZE  => s_axi4_arsize , -- : in  std_logic_vector(2 downto 0);
     S_AXI4_ARBURST => s_axi4_arburst, -- : in  std_logic_vector(1 downto 0);
     S_AXI4_ARLOCK  => s_axi4_arlock , -- : in  std_logic;                    -- not supported in design
     S_AXI4_ARCACHE => s_axi4_arcache, -- : in  std_logic_vector(3 downto 0);-- not supported in design
     S_AXI4_ARPROT  => s_axi4_arprot , -- : in  std_logic_vector(2 downto 0);-- not supported in design
     S_AXI4_ARVALID => s_axi4_arvalid, -- : in  std_logic;
     S_AXI4_ARREADY => s_axi4_arready, -- : out std_logic;
     --------------------------------
     -- AXI Read Data Channel signals
     --------------------------------
     S_AXI4_RID     => s_axi4_rid   , -- : out std_logic_vector((C_S_AXI4_ID_WIDTH-1) downto 0);
     S_AXI4_RDATA   => s_axi4_rdata , -- : out std_logic_vector((C_S_AXI4_DATA_WIDTH-1) downto 0);
     S_AXI4_RRESP   => s_axi4_rresp , -- : out std_logic_vector(1 downto 0);
     S_AXI4_RLAST   => s_axi4_rlast , -- : out std_logic;
     S_AXI4_RVALID  => s_axi4_rvalid, -- : out std_logic;
     S_AXI4_RREADY  => s_axi4_rready, -- : in  std_logic;
     --------------------------------
     XIPSR_CPHA_CPOL_ERR   => TO_XIPSR_CPHA_CPOL_ERR_int  , -- in std_logic
     -------------------------------
     TO_XIPSR_trans_error  => TO_XIPSR_AXI_TR_ERR_int  , -- out std_logic
     TO_XIPSR_mst_modf_err => TO_XIPSR_mst_modf_err_int,
     TO_XIPSR_axi_rx_full  => TO_XIPSR_axi_rx_full_int ,
     TO_XIPSR_axi_rx_empty => TO_XIPSR_axi_rx_empty_int,
     -------------------------------
     XIPCR_1_CPOL          => XIPCR_1_CPOL_int ,         -- out std_logic;
     XIPCR_0_CPHA          => XIPCR_0_CPHA_int ,         -- out std_logic;
     --*SPI port interface      * --
     -------------------------------
     IO0_I          => io0_i, -- : in std_logic;  -- MOSI signal in standard SPI
     IO0_O          => io0_o, -- : out std_logic;
     IO0_T          => io0_t, -- : out std_logic;
     -------------------------------
     IO1_I          => MISO_I_int, -- : in std_logic;  -- MISO signal in standard SPI
     IO1_O          => io1_o, -- : out std_logic;
     IO1_T          => io1_t, -- : out std_logic;
     -----------------
     -- quad mode pins
     -----------------
     IO2_I          => io2_i, -- : in std_logic;
     IO2_O          => io2_o, -- : out std_logic;
     IO2_T          => io2_t, -- : out std_logic;
     ---------------
     IO3_I          => io3_i, -- : in std_logic;
     IO3_O          => io3_o, -- : out std_logic;
     IO3_T          => io3_t, -- : out std_logic;
     ---------------------------------
     -- common pins
     ----------------
     SPISEL         => spisel, -- : in std_logic;
     -----
     SCK_I          => sck_i , -- : in std_logic;
     SCK_O_reg      => SCK_O_int , -- : out std_logic;
     SCK_T          => sck_t , -- : out std_logic;
     -----
     SS_I           => ss_i  , -- : in std_logic_vector((C_NUM_SS_BITS-1) downto 0);
     SS_O           => ss_o  , -- : out std_logic_vector((C_NUM_SS_BITS-1) downto 0);
     SS_T           => ss_t    -- : out std_logic;
     ----------------------
     );
     -- no interrupt from this mode of core
     IP2INTC_Irpt <= '0';

  -------------------------------------------------------
  -------------------------------------------------------
  SCK_MISO_NO_STARTUP_USED: if C_USE_STARTUP = 0 generate
  -----
  begin
  -----
       SCK_O      <= SCK_O_int;   -- output from the core
       MISO_I_int <= IO1_I;       -- input to the core

  end generate SCK_MISO_NO_STARTUP_USED;
  -------------------------------------------------------

  SCK_MISO_STARTUP_USED: if C_USE_STARTUP = 1 generate
  -----
  begin
  -----
  QSPI_STARTUP_BLOCK_I: entity axi_quad_spi_v3_1.qspi_startup_block
  ---------------------
  generic map
       (
               C_SUB_FAMILY     => C_SUB_FAMILY , -- support for V6/V7/K7/A7 families only
               -----------------
               C_USE_STARTUP    => C_USE_STARTUP,
               -----------------
               C_SPI_MODE       => C_SPI_MODE
               -----------------
       )
  port map
       (
               SCK_O          => SCK_O_int, -- : in std_logic; -- input from the qspi_mode_0_module
               IO1_I_startup  => IO1_I,     -- : in std_logic; -- input from the top level port list
               IO1_Int        => MISO_I_int,-- : out std_logic
	       Bus2IP_Clk     => Bus2IP_Clk,
	       reset2ip_reset => Rst_to_spi_int
       );
  --------------------

  end generate SCK_MISO_STARTUP_USED;
end generate XIP_MODE_GEN;

------------------------------------------------------------------------------
end architecture imp;
------------------------------------------------------------------------------

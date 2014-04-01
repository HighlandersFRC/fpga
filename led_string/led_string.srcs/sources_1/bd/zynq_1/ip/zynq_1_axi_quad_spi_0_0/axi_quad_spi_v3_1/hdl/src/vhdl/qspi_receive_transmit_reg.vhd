-------------------------------------------------------------------------------
-- $Id: qspi_receive_reg.vhd
-------------------------------------------------------------------------------
-- qspi_receive_reg.vhd - Entity and architecture
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
-- Filename:        qspi_receive_reg.vhd
-- Version:         v3.0
-- Description:     Quad Serial Peripheral Interface (SPI) Module for interfacing
--                  with a 32-bit AXI4 Bus.
--
-------------------------------------------------------------------------------
-- Structure:   This section shows the hierarchical structure of axi_spi.
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
--                     |-- async_fifo_fg.vhd -- (helper lib)
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
--                       |-- reset_sync_module.vhd
--                       |-- xip_status_reg.vhd
--                       |-- axi_qspi_xip_if.vhd
--                         |-- qspi_addr_decoder.vhd
--                         |-- async_fifo_fg.vhd -- (helper lib)
--                         |-- comp_defs.vhd    -- (helper lib)
-------------------------------------------------------------------------------

-- Author:      SK
-- ~~~~~~
--  - Redesigned version of axi_spi. Based on xps spi v2.01.b
-- ^^^^^^
-- ~~~~~~
--  SK       12/16/12      -- v3.0
--  1. up reved to major version for 2013.1 Vivado release. No logic updates.
--  2. Updated the version of AXI LITE IPIF to v2.0 in X.Y format
--  3. updated the proc common version to proc_common_v4_0
--  4. No Logic Updates
-- ^^^^^^
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
library ieee;
    use ieee.std_logic_1164.all;

library proc_common_v4_0;
    use proc_common_v4_0.proc_common_pkg.RESET_ACTIVE;

-------------------------------------------------------------------------------
--                     Definition of Generics
-------------------------------------------------------------------------------

--  C_NUM_TRANSFER_BITS         --      SPI Serial transfer width.
--                                      Can be 8, 16 or 32 bit wide
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                  Definition of Ports
-------------------------------------------------------------------------------
-- SYSTEM
--  Bus2IP_Clk                  --      Bus to IP clock
--  Soft_Reset_op                       --      Soft_Reset_op Signal

-- SLAVE ATTACHMENT INTERFACE

--  Bus2IP_Reg_RdCE             --      Read CE for receive register
--  IP2Bus_RdAck_sa             --      IP2Bus read acknowledgement
--  IP2Bus_Receive_Reg_Data                 --      Data to be send on the bus
--  Receive_ip2bus_error        --      Receive register error signal

-- SPI MODULE INTERFACE

--  DRR_Overrun                 --      DRR Overrun bit
--  SR_7_Rx_Empty               --      Receive register empty signal
--  SPI_Received_Data                 --      Data received from receive register
--  SPIXfer_done                --      SPI transfer done flag
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Entity Declaration
-------------------------------------------------------------------------------
entity qspi_receive_transmit_reg is
    generic
    (
        C_S_AXI_DATA_WIDTH   : integer;      -- 32 bits
        ---------------------
        C_NUM_TRANSFER_BITS  : integer       -- Number of bits to be transferred
        ---------------------
    );
    port
    (
     Bus2IP_Clk               : in  std_logic;
     Soft_Reset_op            : in  std_logic;
     ------------------------------------
     -- RECEIVER RELATED SIGNALS
     --=========================
     Bus2IP_Receive_Reg_RdCE  : in  std_logic;
     Receive_ip2bus_error     : out std_logic;
     IP2Bus_Receive_Reg_Data  : out std_logic_vector
                                                 (0 to (C_NUM_TRANSFER_BITS-1));
     -- SPI module ports
     SPIXfer_done             : in  std_logic;
     SPI_Received_Data        : in  std_logic_vector
                                                 (0 to (C_NUM_TRANSFER_BITS-1));
     -- receive & transmit reg signals
     -- DRR_Overrun              : out std_logic;
     SR_7_Rx_Empty            : out std_logic;
     ------------------------------------
     -- TRANSMITTER RELATED SIGNALS
     --============================
     -- Slave attachment ports
     Bus2IP_Transmit_Reg_Data : in std_logic_vector(0 to (C_S_AXI_DATA_WIDTH-1));
     Bus2IP_Transmit_Reg_WrCE : in std_logic;
     Wr_ce_reduce_ack_gen     : in std_logic;
     Rd_ce_reduce_ack_gen     : in std_logic;
     --SPI Transmitter signals
     Transmit_ip2bus_error    : out std_logic;

     -- SPI module ports
     DTR_underrun             : in  std_logic;
     SR_5_Tx_Empty            : out std_logic;
     DTR_Underrun_strobe      : out std_logic;
     Transmit_Reg_Data_Out    : out std_logic_vector
                                               (0 to (C_NUM_TRANSFER_BITS-1))
    );
end qspi_receive_transmit_reg;

-------------------------------------------------------------------------------
-- Architecture
---------------
architecture imp of qspi_receive_transmit_reg is
---------------------------------------------------

----------------------------------------------------------------------------------
-- below attributes are added to reduce the synth warnings in Vivado tool
attribute DowngradeIPIdentifiedWarnings: string;
attribute DowngradeIPIdentifiedWarnings of imp : architecture is "yes";
----------------------------------------------------------------------------------

-- Signal Declarations
----------------------
signal Received_register_Data         : std_logic_vector(0 to (C_NUM_TRANSFER_BITS-1));
signal sr_7_Rx_Empty_reg         : std_logic;
signal drr_Overrun_strobe      : std_logic;
--------------------------------------------
signal sr_5_Tx_Empty_i         : std_logic;
signal tx_Reg_Soft_Reset_op            : std_logic;
signal dtr_Underrun_strobe_i   : std_logic;
signal dtr_underrun_d1         : std_logic;
signal SPIXfer_done_delay : std_logic;
--------------------------------------------
begin
-----
-- RECEIVER LOGIC
--=================
--  Combinatorial operations
----------------------------
SR_7_Rx_Empty   <= sr_7_Rx_Empty_reg;
-- DRR_Overrun     <= drr_Overrun_strobe;

DELAY_XFER_DONE_P:process(Bus2IP_Clk)
    begin
        if (Bus2IP_Clk'event and Bus2IP_Clk='1') then
            if (Soft_Reset_op = RESET_ACTIVE) then
                 SPIXfer_done_delay <= '0';
            else
                 SPIXfer_done_delay <= SPIXfer_done;
            end if;
        end if;
end process DELAY_XFER_DONE_P;
-------------------------------------------------------------------------------
--  RECEIVE_REG_GENERATE : Receive Register Read Operation from SPI_Received_Data
--                         register
--------------------------
RECEIVE_REG_GENERATE: for i in 0 to C_NUM_TRANSFER_BITS-1 generate
begin
-----
    RECEIVE_REG_PROCESS_P:process(Bus2IP_Clk)
    begin
        if (Bus2IP_Clk'event and Bus2IP_Clk='1') then
            if (Soft_Reset_op = RESET_ACTIVE) then
                Received_register_Data(i) <= '0';
            elsif (SPIXfer_done_delay = '1') then--((sr_7_Rx_Empty_reg and SPIXfer_done) = '1') then
                Received_register_Data(i) <= SPI_Received_Data(i);
            end if;
        end if;
    end process RECEIVE_REG_PROCESS_P;
-----
end generate RECEIVE_REG_GENERATE;

-------------------------------------------------------------------------------
--  RECEIVE_REG_RD_GENERATE : Receive Register Read Operation
-----------------------------
RECEIVE_REG_RD_GENERATE: for i in 0 to C_NUM_TRANSFER_BITS-1 generate
begin
     IP2Bus_Receive_Reg_Data(i) <= Received_register_Data(i) and
                                   Bus2IP_Receive_Reg_RdCE;
end generate RECEIVE_REG_RD_GENERATE;

-------------------------------------------------------------------------------
--  RX_ERROR_ACK_REG_PROCESS_P : Strobe error when receive register is empty
--------------------------------
RX_ERROR_ACK_REG_PROCESS_P:process(Bus2IP_Clk)
begin
    if (Bus2IP_Clk'event and Bus2IP_Clk='1') then
        Receive_ip2bus_error <= sr_7_Rx_Empty_reg and
                                Bus2IP_Receive_Reg_RdCE;
    end if;
end process RX_ERROR_ACK_REG_PROCESS_P;

-------------------------------------------------------------------------------
--  SR_7_RX_EMPTY_REG_PROCESS_P : SR_7_Rx_Empty register
-------------------------------
SR_7_RX_EMPTY_REG_PROCESS_P:process(Bus2IP_Clk)
begin
    if (Bus2IP_Clk'event and Bus2IP_Clk='1') then
        if (Soft_Reset_op = RESET_ACTIVE) then
            sr_7_Rx_Empty_reg <= '1';
        elsif (SPIXfer_done = '1') then
            sr_7_Rx_Empty_reg <= '0';
        elsif ((rd_ce_reduce_ack_gen and Bus2IP_Receive_Reg_RdCE) = '1') then
            sr_7_Rx_Empty_reg <= '1';
        end if;
    end if;
end process SR_7_RX_EMPTY_REG_PROCESS_P;
----******************************************************************************
-- TRANSMITTER LOGIC
--==================
--  Combinatorial operations
----------------------------
SR_5_Tx_Empty       <= sr_5_Tx_Empty_i;
DTR_Underrun_strobe <= dtr_Underrun_strobe_i;

tx_Reg_Soft_Reset_op <= SPIXfer_done or Soft_Reset_op;
--------------------------------------

-------------------------------------------------------------------------------
--  TRANSMIT_REG_GENERATE : Transmit Register Write
---------------------------
TRANSMIT_REG_GENERATE: for i in 0 to C_NUM_TRANSFER_BITS-1 generate
begin
-----
    TRANSMIT_REG_PROCESS_P:process(Bus2IP_Clk)
    begin
        if (Bus2IP_Clk'event and Bus2IP_Clk='1') then
            if (tx_Reg_Soft_Reset_op = RESET_ACTIVE) then
                Transmit_Reg_Data_Out(i) <= '0';
            elsif ((wr_ce_reduce_ack_gen and Bus2IP_Transmit_Reg_WrCE) = '1')then
                Transmit_Reg_Data_Out(i) <=
                            Bus2IP_Transmit_Reg_Data
                            (C_S_AXI_DATA_WIDTH-C_NUM_TRANSFER_BITS+i) after 100 ps;
            end if;
        end if;
    end process TRANSMIT_REG_PROCESS_P;
-----
end generate TRANSMIT_REG_GENERATE;
-----------------------------------

--  TX_ERROR_ACK_REG_PROCESS_P : Strobe error when transmit register is full
--------------------------------
TX_ERROR_ACK_REG_PROCESS_P:process(Bus2IP_Clk)
begin
    if (Bus2IP_Clk'event and Bus2IP_Clk='1') then
        Transmit_ip2bus_error <= not(sr_5_Tx_Empty_i) and
                                 Bus2IP_Transmit_Reg_WrCE;
    end if;
end process TX_ERROR_ACK_REG_PROCESS_P;

-------------------------------------------------------------------------------
--  SR_5_TX_EMPTY_REG_PROCESS_P : Tx Empty generate
-------------------------------
SR_5_TX_EMPTY_REG_PROCESS_P:process(Bus2IP_Clk)
begin
    if (Bus2IP_Clk'event and Bus2IP_Clk='1') then
        if (Soft_Reset_op = RESET_ACTIVE) then
            sr_5_Tx_Empty_i <= '1';
        elsif ((wr_ce_reduce_ack_gen and Bus2IP_Transmit_Reg_WrCE) = '1') then
            sr_5_Tx_Empty_i <= '0';
        elsif (SPIXfer_done = '1') then
            sr_5_Tx_Empty_i <= '1';
        end if;
    end if;
end process SR_5_TX_EMPTY_REG_PROCESS_P;

-------------------------------------------------------------------------------
--  DTR_UNDERRUN_REG_PROCESS_P : Strobe to interrupt for transmit data underrun
--                           which happens only in slave mode
-----------------------------
DTR_UNDERRUN_REG_PROCESS_P:process(Bus2IP_Clk)
begin
    if (Bus2IP_Clk'event and Bus2IP_Clk='1') then
        if (Soft_Reset_op = RESET_ACTIVE) then
            dtr_underrun_d1 <= '0';
        else
            dtr_underrun_d1 <= DTR_underrun;
        end if;
    end if;
end process DTR_UNDERRUN_REG_PROCESS_P;
---------------------------------------

dtr_Underrun_strobe_i <= DTR_underrun and (not dtr_underrun_d1);

--******************************************************************************

end imp;
--------------------------------------------------------------------------------

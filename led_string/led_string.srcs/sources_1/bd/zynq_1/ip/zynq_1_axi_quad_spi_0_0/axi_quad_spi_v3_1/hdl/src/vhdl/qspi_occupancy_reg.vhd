-------------------------------------------------------------------------------
-- $Id: qspi_occupancy_reg.vhd
-------------------------------------------------------------------------------
-- qspi_occupancy_reg.vhd - Entity and architecture
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
-- Filename:        qspi_occupancy_reg.vhd
-- Version:         v3.0
-- Description:     Serial Peripheral Interface (SPI) Module for interfacing
--                  with a 32-bit AXI4 Bus.Defines logic for occupancy regist
--                  -er.
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
--  - Redesigned version of axi_quad_spi.
-- ^^^^^^
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

-------------------------------------------------------------------------------
--                     Definition of Generics
-------------------------------------------------------------------------------

--  C_DBUS_WIDTH                --      Width of the slave data bus
--  C_OCCUPANCY_NUM_BITS        --      Number of bits in occupancy count
--  C_NUM_BITS_REG              --      Width of SPI registers
--  C_NUM_TRANSFER_BITS         --      SPI Serial transfer width.
--                                      Can be 8, 16 or 32 bit wide

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--                  Definition of Ports
-------------------------------------------------------------------------------

-- SYSTEM

--  Bus2IP_Clk                  --      Bus to IP clock
--  Reset                       --      Reset Signal

-- SLAVE ATTACHMENT INTERFACE
--===========================
--  Bus2IP_OCC_REG_RdCE             --      Read CE for occupancy register
--  SPIXfer_done                --      SPI transfer done flag

--  FIFO INTERFACE
--  IP2Reg_OCC_Data        --      Occupancy data read from FIFO

--  IP2Bus_OCC_REG_Data                 --      Data to be send on the bus
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Entity Declaration
-------------------------------------------------------------------------------
entity qspi_occupancy_reg is
    generic
    (
        C_OCCUPANCY_NUM_BITS: integer--  --Number of bits in occupancy count
    );
    port
    (
        -- Slave attachment ports
       Bus2IP_OCC_REG_RdCE   : in std_logic;
       IP2Reg_OCC_Data       : in std_logic_vector(0 to (C_OCCUPANCY_NUM_BITS-1));
       IP2Bus_OCC_REG_Data   : out std_logic_vector(0 to (C_OCCUPANCY_NUM_BITS-1))

     );
end qspi_occupancy_reg;

-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------
architecture imp of qspi_occupancy_reg is
-------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- below attributes are added to reduce the synth warnings in Vivado tool
attribute DowngradeIPIdentifiedWarnings: string;
attribute DowngradeIPIdentifiedWarnings of imp : architecture is "yes";
----------------------------------------------------------------------------------

-- Signal Declarations
----------------------
begin
-----
--  OCCUPANCY_REG_RD_GENERATE : Occupancy Register Read Generate
-------------------------------
OCCUPANCY_REG_RD_GENERATE: for j in 0 to C_OCCUPANCY_NUM_BITS-1 generate
begin
    IP2Bus_OCC_REG_Data(j) <= IP2Reg_OCC_Data(C_OCCUPANCY_NUM_BITS-1-j) and
                                                            Bus2IP_OCC_REG_RdCE;
end generate OCCUPANCY_REG_RD_GENERATE;

end imp;
--------------------------------------------------------------------------------

FPGA
====

This repository holds all the projects and docs relating to our work with the Xilinx Zynq 7000 series FPGAs.  These chips are part of Xilinx's system-on-a-chip (SOC) product line.  This means that they not only contain programmable logic (PL), but they also have an embedded processing system (PS) consisting of a dual core ARM cortex processor running at 667 MHZ.

Our intention is to experiment with FPGAs for use in high performance applications such as image processing, computer vision, and drive system monitoring.

Some handy links for the Zynq chip and its associated Vivado design software:

*  [Xilinx Zynq Docs](http://www.xilinx.com/support/index.html/content/xilinx/en/supportNav/silicon_devices/soc/zynq-7000.html)
  *  [Overview](http://www.xilinx.com/support/documentation/data_sheets/ds190-Zynq-7000-Overview.pdf)
  *  [Technical Reference](http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf)
  *  [Clocking User Guide](http://www.xilinx.com/support/documentation/user_guides/ug472_7Series_Clocking.pdf)
  *  [Memory User Guide](http://www.xilinx.com/support/documentation/user_guides/ug473_7Series_Memory_Resources.pdf)
  *  [Packaging and Pinout](http://www.xilinx.com/support/documentation/user_guides/ug865-Zynq-7000-Pkg-Pinout.pdf)
  
* [Vivado Design Suite](http://www.xilinx.com/products/design-tools/vivado/)
  * [Install Guide](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2013_2/ug973-vivado-release-notes-install-license.pdf)
  * [Getting Started](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2013_2/ug910-vivado-getting-started.pdf)
  * [Design Flows Overview](http://www.xilinx.com/support/documentation/sw_manuals/xilinx2013_2/ug888-vivado-design-flows-overview-tutorial.pdf)

Zedboard
--------

Our initial development is being done on a [Zedboard](http://www.zedboard.org/product/zedboard) development board.

* Zedboard links
  * [Getting Started](http://www.zedboard.org/sites/default/files/documentations/GS-AES-Z7EV-7Z020-G-14.1-V6%5B1%5D.pdf)
  * [Tutorials](http://zedboard.org/design/1521/11)
  * [Schematics](http://www.zedboard.org/sites/default/files/documentations/ZedBoard_RevD.2_Schematic_130516.pdf)

Background Info
---------------

Developing on the Zedboard is a bit more low-level than the system-level software many programmers are used to writing. It requires detailed knowledge of which integrated circuits (ICs) are used on the Zedboard and how they communicate.  Below is a list of links that provide some of this information.

* [Introduction to SPI and I2C](http://www.byteparadigm.com/applications/introduction-to-i2c-and-spi-protocols/?/article/AA-00255/22/Introduction-to-SPI-and-IC-protocols.html)

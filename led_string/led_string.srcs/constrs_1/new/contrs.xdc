set_property PACKAGE_PIN U12 [get_ports vdd]
set_property PACKAGE_PIN U11 [get_ports vbat]
set_property PACKAGE_PIN U9 [get_ports reset]
set_property PACKAGE_PIN AB12 [get_ports sclk]
set_property PACKAGE_PIN U10 [get_ports scmd]
set_property PACKAGE_PIN AA12 [get_ports sdata]
set_property PACKAGE_PIN Y11 [get_ports light_clk]
set_property PACKAGE_PIN Y10 [get_ports light_data]

set_property PACKAGE_PIN T22 [get_ports status_led_1]
set_property PACKAGE_PIN T21 [get_ports status_led_2]
set_property PACKAGE_PIN U22 [get_ports status_led_3]
set_property PACKAGE_PIN U21 [get_ports status_led_4]

set_property IOSTANDARD LVCMOS33 [get_ports sclk]
set_property IOSTANDARD LVCMOS33 [get_ports sdata]
set_property IOSTANDARD LVCMOS33 [get_ports scmd]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports vdd]
set_property IOSTANDARD LVCMOS33 [get_ports vbat]
set_property IOSTANDARD LVCMOS33 [get_ports light_clk]
set_property IOSTANDARD LVCMOS33 [get_ports light_data]

set_property IOSTANDARD LVCMOS33 [get_ports status_led_1]
set_property IOSTANDARD LVCMOS33 [get_ports status_led_2]
set_property IOSTANDARD LVCMOS33 [get_ports status_led_3]
set_property IOSTANDARD LVCMOS33 [get_ports status_led_4]

set_property PACKAGE_PIN Y9 [get_ports clk_in]
set_property IOSTANDARD LVCMOS33 [get_ports clk_in]
create_clock -name clk -period 10 [get_ports clk_in]

# GPIO OUT MAP
# 0 - VDD
# 1 - VBAT
# 2 - RESET
# 3 - SCLK
# 4 - SDATA
# 5 - SCMD
# 6 - StatusLED

# SPI OUT MAP
# 7 - LCLK
# 8 - LDATA
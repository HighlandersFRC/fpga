#-----------------------
#Creating new core.
ipx::create_core {xilinx.com} {ip} {zynq_1} {1.0}
#-----------------------
set_property root_directory {} [ipx::current_core]
ipx::add_user_parameter Component_Name [ipx::current_core]
set_property {value_resolve_type} {user} [ipx::get_user_parameter  Component_Name [ipx::current_core]]
set_property {value_format} {string} [ipx::get_user_parameter  Component_Name [ipx::current_core]]
#-----------------------
# SUPORTED FAMILIES     
#-----------------------
set_property supported_families {{zynq} {Production}} [ipx::current_core]

#-----------------------
# OTHER ATTRIBUTES      
#-----------------------
set_property taxonomy {{/Packaged_BlockDiagram_Designs}} [ipx::current_core]
set_property company_url {http://www.xilinx.com} [ipx::current_core]
set_property description {zynq_1} [ipx::current_core]
set_property display_name {zynq_1} [ipx::current_core]

ipx::remove_all_port [ipx::current_core]
ipx::remove_all_file_group [ipx::current_core]
ipx::remove_all_bus_interface [ipx::current_core]

#-----------------------
# SYNTHESIS FILESET
#-----------------------
ipx::add_file_group {xilinx_verilogsynthesis} [ipx::current_core]
ipx::add_file ip/zynq_1_proc_sys_reset_1_0/zynq_1_proc_sys_reset_1_0.xci [ipx::get_file_group xilinx_verilogsynthesis [ipx::current_core]]
ipx::add_file ip/zynq_1_processing_system7_1_0/zynq_1_processing_system7_1_0.xci [ipx::get_file_group xilinx_verilogsynthesis [ipx::current_core]]
ipx::add_file zynq_1_ooc.xdc [ipx::get_file_group xilinx_verilogsynthesis [ipx::current_core]]
ipx::add_file hdl/zynq_1.v [ipx::get_file_group xilinx_verilogsynthesis [ipx::current_core]]
set_property {model_name} {zynq_1} [ipx::get_file_group xilinx_verilogsynthesis [ipx::current_core]]

#-----------------------
# SIMULATION FILESET
#-----------------------
ipx::add_file_group {xilinx_verilogbehavioralsimulation} [ipx::current_core]
ipx::add_file ip/zynq_1_proc_sys_reset_1_0/zynq_1_proc_sys_reset_1_0.xci [ipx::get_file_group xilinx_verilogbehavioralsimulation [ipx::current_core]]
ipx::add_file ip/zynq_1_processing_system7_1_0/zynq_1_processing_system7_1_0.xci [ipx::get_file_group xilinx_verilogbehavioralsimulation [ipx::current_core]]
ipx::add_file zynq_1_ooc.xdc [ipx::get_file_group xilinx_verilogbehavioralsimulation [ipx::current_core]]
ipx::add_file hdl/zynq_1.v [ipx::get_file_group xilinx_verilogbehavioralsimulation [ipx::current_core]]
set_property {model_name} {zynq_1} [ipx::get_file_group xilinx_verilogbehavioralsimulation [ipx::current_core]]

#-----------------------
# PORTS 
#-----------------------
ipx::add_ports_from_hdl [::ipx::current_core] -top_level_hdl_file ./hdl/zynq_1.v -top_module_name zynq_1

#-----------------------
# BUS INTERFACES 
#-----------------------
#------------------
#   Adding DDR
#------------------
ipx::add_bus_interface {DDR} [ipx::current_core]
set_property interface_mode {master} [ipx::get_bus_interface {DDR} [ipx::current_core]]
set_property display_name {DDR} [ipx::get_bus_interface {DDR} [ipx::current_core]]

#   Adding Bus Type VNLV xilinx.com:interface:ddrx:1.0
set_property {bus_type_vlnv} {xilinx.com:interface:ddrx:1.0}  [ipx::get_bus_interface DDR [ipx::current_core]]

#   Adding Abstraction VNLV xilinx.com:interface:ddrx_rtl:1.0
set_property {abstraction_type_vlnv} {xilinx.com:interface:ddrx_rtl:1.0}  [ipx::get_bus_interface DDR [ipx::current_core]]

#   Adding PortMaps
set_property {physical_name} {DDR_cas_n} [ipx::add_port_map {CAS_N}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_cke} [ipx::add_port_map {CKE}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_ck_n} [ipx::add_port_map {CK_N}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_ck_p} [ipx::add_port_map {CK_P}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_cs_n} [ipx::add_port_map {CS_N}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_reset_n} [ipx::add_port_map {RESET_N}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_odt} [ipx::add_port_map {ODT}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_ras_n} [ipx::add_port_map {RAS_N}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_we_n} [ipx::add_port_map {WE_N}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_ba} [ipx::add_port_map {BA}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_addr} [ipx::add_port_map {ADDR}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_dm} [ipx::add_port_map {DM}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_dq} [ipx::add_port_map {DQ}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_dqs_n} [ipx::add_port_map {DQS_N}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
set_property {physical_name} {DDR_dqs_p} [ipx::add_port_map {DQS_P}  [ipx::get_bus_interface {DDR} [ipx::current_core]]]
#------------------
#------------------
#   Adding FIXED_IO
#------------------
ipx::add_bus_interface {FIXED_IO} [ipx::current_core]
set_property interface_mode {master} [ipx::get_bus_interface {FIXED_IO} [ipx::current_core]]
set_property display_name {FIXED_IO} [ipx::get_bus_interface {FIXED_IO} [ipx::current_core]]

#   Adding Bus Type VNLV xilinx.com:display_processing_system7:fixedio:1.0
set_property {bus_type_vlnv} {xilinx.com:display_processing_system7:fixedio:1.0}  [ipx::get_bus_interface FIXED_IO [ipx::current_core]]

#   Adding Abstraction VNLV xilinx.com:display_processing_system7:fixedio_rtl:1.0
set_property {abstraction_type_vlnv} {xilinx.com:display_processing_system7:fixedio_rtl:1.0}  [ipx::get_bus_interface FIXED_IO [ipx::current_core]]

#   Adding PortMaps
set_property {physical_name} {FIXED_IO_mio} [ipx::add_port_map {MIO}  [ipx::get_bus_interface {FIXED_IO} [ipx::current_core]]]
set_property {physical_name} {FIXED_IO_ddr_vrn} [ipx::add_port_map {DDR_VRN}  [ipx::get_bus_interface {FIXED_IO} [ipx::current_core]]]
set_property {physical_name} {FIXED_IO_ddr_vrp} [ipx::add_port_map {DDR_VRP}  [ipx::get_bus_interface {FIXED_IO} [ipx::current_core]]]
set_property {physical_name} {FIXED_IO_ps_srstb} [ipx::add_port_map {PS_SRSTB}  [ipx::get_bus_interface {FIXED_IO} [ipx::current_core]]]
set_property {physical_name} {FIXED_IO_ps_clk} [ipx::add_port_map {PS_CLK}  [ipx::get_bus_interface {FIXED_IO} [ipx::current_core]]]
set_property {physical_name} {FIXED_IO_ps_porb} [ipx::add_port_map {PS_PORB}  [ipx::get_bus_interface {FIXED_IO} [ipx::current_core]]]
#------------------

#-----------------------
# SAVE CORE TO REPOS
#-----------------------
ipx::create_default_gui_files [ipx::current_core]
ipx::save_core [ipx::current_core]
ipx::check_integrity  [ipx::current_core]
update_ip_catalog

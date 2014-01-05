proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {Common-41} -limit 4294967295
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Labtools 27-147} -limit 4294967295

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param gui.test TreeTableDev
  create_project -in_memory -part xc7z020clg484-1
  set_property board em.avnet.com:zynq:zed:d [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir C:/vivado/oled_project/oled_project.data/wt [current_project]
  set_property parent.project_dir C:/vivado/oled_project [current_project]
  add_files C:/vivado/oled_project/oled_project.runs/synth_1/main.dcp
  read_xdc -ref zynq_1_processing_system7_1_0 -cells inst c:/vivado/oled_project/oled_project.srcs/sources_1/bd/zynq_1/ip/zynq_1_processing_system7_1_0/zynq_1_processing_system7_1_0.xdc
  read_xdc -ref zynq_1_proc_sys_reset_1_0 -cells U0 c:/vivado/oled_project/oled_project.srcs/sources_1/bd/zynq_1/ip/zynq_1_proc_sys_reset_1_0/zynq_1_proc_sys_reset_1_0.xdc
  read_xdc -prop_thru_buffers -ref zynq_1_proc_sys_reset_1_0 -cells U0 c:/vivado/oled_project/oled_project.srcs/sources_1/bd/zynq_1/ip/zynq_1_proc_sys_reset_1_0/zynq_1_proc_sys_reset_1_0_board.xdc
  read_xdc -ref zynq_1_axi_gpio_0_0 -cells U0 c:/vivado/oled_project/oled_project.srcs/sources_1/bd/zynq_1/ip/zynq_1_axi_gpio_0_0/zynq_1_axi_gpio_0_0.xdc
  read_xdc -prop_thru_buffers -ref zynq_1_axi_gpio_0_0 -cells U0 c:/vivado/oled_project/oled_project.srcs/sources_1/bd/zynq_1/ip/zynq_1_axi_gpio_0_0/zynq_1_axi_gpio_0_0_board.xdc
  read_xdc C:/vivado/oled_project/oled_project.srcs/constrs_1/new/contrs.xdc
  link_design -top main -part xc7z020clg484-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force main_opt.dcp
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  place_design 
  catch { report_io -file main_io_placed.rpt }
  catch { report_clock_utilization -file main_clock_utilization_placed.rpt }
  catch { report_utilization -file main_utilization_placed.rpt -pb main_utilization_placed.pb }
  catch { report_control_sets -verbose -file main_control_sets_placed.rpt }
  write_checkpoint -force main_placed.dcp
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  catch { report_drc -file main_drc_routed.rpt -pb main_drc_routed.pb }
  catch { report_power -file main_power_routed.rpt -pb main_power_summary_routed.pb }
  catch { report_route_status -file main_route_status.rpt -pb main_route_status.pb }
  catch { report_timing_summary -file main_timing_summary_routed.rpt -pb main_timing_summary_routed.pb }
  write_checkpoint -force main_routed.dcp
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  write_bitstream -force main.bit 
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}


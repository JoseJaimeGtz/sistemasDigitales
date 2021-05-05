# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
<<<<<<< HEAD
set_msg_config -id {Common 17-41} -limit 10000000
=======
>>>>>>> main
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
<<<<<<< HEAD
set_property webtalk.parent_dir {D:/OneDrive - ITESO/- Semestre 4/Fundamentos de Sistemas Digitales/Practica 3/sistemasDigitales/Cronometro/Cronometro.cache/wt} [current_project]
set_property parent.project_path {D:/OneDrive - ITESO/- Semestre 4/Fundamentos de Sistemas Digitales/Practica 3/sistemasDigitales/Cronometro/Cronometro.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo {d:/OneDrive - ITESO/- Semestre 4/Fundamentos de Sistemas Digitales/Practica 3/sistemasDigitales/Cronometro/Cronometro.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  {D:/OneDrive - ITESO/- Semestre 4/Fundamentos de Sistemas Digitales/Practica 3/sistemasDigitales/Cronometro/Cronometro.srcs/sources_1/new/7seg.v}
  {D:/OneDrive - ITESO/- Semestre 4/Fundamentos de Sistemas Digitales/Practica 3/sistemasDigitales/Cronometro/Cronometro.srcs/sources_1/new/clocks.v}
  {D:/OneDrive - ITESO/- Semestre 4/Fundamentos de Sistemas Digitales/Practica 3/sistemasDigitales/Cronometro/Cronometro.srcs/sources_1/new/contador.v}
  {D:/OneDrive - ITESO/- Semestre 4/Fundamentos de Sistemas Digitales/Practica 3/sistemasDigitales/Cronometro/Cronometro.srcs/sources_1/new/enable.v}
  {D:/OneDrive - ITESO/- Semestre 4/Fundamentos de Sistemas Digitales/Practica 3/sistemasDigitales/Cronometro/Cronometro.srcs/sources_1/new/cronometro.v}
=======
set_property webtalk.parent_dir C:/sistemasDigitales/Cronometro/Cronometro.cache/wt [current_project]
set_property parent.project_path C:/sistemasDigitales/Cronometro/Cronometro.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/sistemasDigitales/Cronometro/Cronometro.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/sistemasDigitales/Cronometro/Cronometro.srcs/sources_1/new/7seg.v
  C:/sistemasDigitales/Cronometro/Cronometro.srcs/sources_1/new/clocks.v
  C:/sistemasDigitales/Cronometro/Cronometro.srcs/sources_1/new/contador.v
  C:/sistemasDigitales/Cronometro/Cronometro.srcs/sources_1/new/enable.v
  C:/sistemasDigitales/Cronometro/Cronometro.srcs/sources_1/new/cronometro.v
>>>>>>> main
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
<<<<<<< HEAD
read_xdc {{D:/OneDrive - ITESO/- Semestre 4/Fundamentos de Sistemas Digitales/Practica 3/sistemasDigitales/Cronometro/Cronometro.srcs/constrs_1/new/Basys3.xdc}}
set_property used_in_implementation false [get_files {{D:/OneDrive - ITESO/- Semestre 4/Fundamentos de Sistemas Digitales/Practica 3/sistemasDigitales/Cronometro/Cronometro.srcs/constrs_1/new/Basys3.xdc}}]
=======
read_xdc C:/sistemasDigitales/Cronometro/Cronometro.srcs/constrs_1/new/Basys3.xdc
set_property used_in_implementation false [get_files C:/sistemasDigitales/Cronometro/Cronometro.srcs/constrs_1/new/Basys3.xdc]
>>>>>>> main

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top cronometro -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef cronometro.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file cronometro_utilization_synth.rpt -pb cronometro_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

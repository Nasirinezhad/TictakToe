## Copyright (C) 1991-2009 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.

## VENDOR "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 9.0 Build 235 06/17/2009 Service Pack 2 SJ Web Edition"

## DATE "12/14/2019 11:50:01"

## 
## Device: Altera EPM240T100C5 Package TQFP100
## 

## 
## This Tcl script should be used for PrimeTime (Verilog) only
## 

## This file can be sourced in primetime

set report_default_significant_digits 3
set hierarchy_separator .

set quartus_root "c:/altera/90sp2/quartus/"
set search_path [list . [format "%s%s" $quartus_root "eda/synopsys/primetime/lib"]  ]

set link_path [list *  maxii_io_lib.db maxii_asynch_lcell_lib.db  maxii_ufm_lib.db maxii_lcell_register_lib.db  alt_vtl.db]

read_verilog  maxii_all_pt.v 

##########################
## DESIGN ENTRY SECTION ##
##########################

read_verilog  Dooz.vo
current_design Dooz
link
## Set variable timing_propagate_single_condition_min_slew to false only for versions 2004.06 and earlier
regexp {([1-9][0-9][0-9][0-9]\.[0-9][0-9])} $sh_product_version dummy version
if { [string compare "2004.06" $version ] != -1 } {
   set timing_propagate_single_condition_min_slew false
}
set_operating_conditions -analysis_type single
read_sdf Dooz_v.sdo

################################
## TIMING CONSTRAINTS SECTION ##
################################


## Start clock definition ##
# WARNING:  The required clock period is not set. The default value (100 ns) is used. 
create_clock -period 100.000 -waveform {0.000 50.000} [get_ports { clk } ] -name clk  

set_propagated_clock [all_clocks]
## End clock definition ##

## Start create collections ##
## End create collections ##

## Start global settings ##
## End global settings ##

## Start collection commands definition ##

## End collection commands definition ##

## Start individual pin commands definition ##
## End individual pin commands definition ##

## Start Output pin capacitance definition ##
set_load -pin_load 10 [get_ports { beep } ]
set_load -pin_load 10 [get_ports { col[0] } ]
set_load -pin_load 10 [get_ports { col[1] } ]
set_load -pin_load 10 [get_ports { col[2] } ]
set_load -pin_load 10 [get_ports { col[3] } ]
set_load -pin_load 10 [get_ports { col[4] } ]
set_load -pin_load 10 [get_ports { col[5] } ]
set_load -pin_load 10 [get_ports { col[6] } ]
set_load -pin_load 10 [get_ports { col[7] } ]
set_load -pin_load 10 [get_ports { leds[0] } ]
set_load -pin_load 10 [get_ports { leds[1] } ]
set_load -pin_load 10 [get_ports { leds[2] } ]
set_load -pin_load 10 [get_ports { leds[3] } ]
set_load -pin_load 10 [get_ports { rkey[0] } ]
set_load -pin_load 10 [get_ports { rkey[1] } ]
set_load -pin_load 10 [get_ports { rkey[2] } ]
set_load -pin_load 10 [get_ports { rkey[3] } ]
set_load -pin_load 10 [get_ports { row[0] } ]
set_load -pin_load 10 [get_ports { row[1] } ]
set_load -pin_load 10 [get_ports { row[2] } ]
set_load -pin_load 10 [get_ports { row[3] } ]
set_load -pin_load 10 [get_ports { row[4] } ]
set_load -pin_load 10 [get_ports { row[5] } ]
set_load -pin_load 10 [get_ports { row[6] } ]
set_load -pin_load 10 [get_ports { row[7] } ]
set_load -pin_load 10 [get_ports { sp[0] } ]
set_load -pin_load 10 [get_ports { sp[1] } ]
set_load -pin_load 10 [get_ports { w2[0] } ]
set_load -pin_load 10 [get_ports { w2[1] } ]
set_load -pin_load 10 [get_ports { winner[0] } ]
set_load -pin_load 10 [get_ports { winner[1] } ]
## End Output pin capacitance definition ##

## Start clock uncertainty definition ##
## End clock uncertainty definition ##

## Start Multicycle and Cut Path definition ##
## End Multicycle and Cut Path definition ##

## Destroy Collections ##

update_timing

puts "RM-Info: Running script [info script]\n"

set TECH_HOME "/afs/eos.ncsu.edu/lockers/research/ece/wdavis/tech"
set STDCELL_HOME "${TECH_HOME}/nangate/NanGate_15nm_OCL_v0.1_2014_06.A"

##########################################################################################
# Variables common to all reference methodology scripts
# Script: common_setup.tcl
# Version: P-2019.03-SP2 
# Copyright (C) 2007-2019 Synopsys, Inc. All rights reserved.
##########################################################################################

set DESIGN_NAME                   "CORTEXM0DS"  ;#  The name of the top-level design

set DESIGN_REF_DATA_PATH          "../src/rtl/cortexm0ds"  ;#  Absolute path prefix variable for library/design data.
                                       #  Use this variable to prefix the common absolute path  
                                       #  to the common variables defined below.
                                       #  Absolute paths are mandatory for hierarchical 
                                       #  reference methodology flow.

##########################################################################################
# Hierarchical Flow Design Variables
##########################################################################################

set HIERARCHICAL_DESIGNS           "" ;# List of hierarchical block design names "DesignA DesignB" ...
set HIERARCHICAL_CELLS             "" ;# List of hierarchical block cell instance names "u_DesignA u_DesignB" ...

##########################################################################################
# Library Setup Variables
##########################################################################################

# For the following variables, use a blank space to separate multiple entries.
# Example: set TARGET_LIBRARY_FILES "lib1.db lib2.db lib3.db"

set ADDITIONAL_SEARCH_PATH        "../src/rtl/cortexm0ds"  ;#  Additional search path to be added to the default search path

set TARGET_LIBRARY_FILES          ""  ;#  Target technology logical libraries
append TARGET_LIBRARY_FILES " \
  ${STDCELL_HOME}/front_end/timing_power_noise/CCS/NanGate_15nm_OCL_fast_conditional_ccs.db \
  ${STDCELL_HOME}/front_end/timing_power_noise/CCS/NanGate_15nm_OCL_low_temp_conditional_ccs.db \
  ${STDCELL_HOME}/front_end/timing_power_noise/CCS/NanGate_15nm_OCL_slow_conditional_ccs.db \
  ${STDCELL_HOME}/front_end/timing_power_noise/CCS/NanGate_15nm_OCL_worst_low_conditional_ccs.db \
"

set ADDITIONAL_LINK_LIB_FILES     ""  ;#  Extra link logical libraries not included in TARGET_LIBRARY_FILES

set MIN_LIBRARY_FILES             ""  ;#  List of max min library pairs "max1 min1 max2 min2 max3 min3"...

set MW_REFERENCE_LIB_DIRS         "${TECH_HOME}/ece720/Nangate_15nm_OCL_Milkyway_v2014_06/Nangate_15nm_OCL_v2014_06"  ;#  Milkyway reference libraries (include IC Compiler ILMs here)

set MW_REFERENCE_CONTROL_FILE     ""  ;#  Reference Control file to define the Milkyway reference libs

set TECH_FILE                     "${TECH_HOME}/ece720/Nangate_15nm_OCL_Milkyway_v2014_06/FreePDK15.tf"  ;#  Milkyway technology file
set MAP_FILE                      "${TECH_HOME}/ece720/FreePDK15_star_rcxt/layer.map"  ;#  Mapping file for TLUplus
set TLUPLUS_MAX_FILE              "${TECH_HOME}/ece720/FreePDK15_star_rcxt/FreePDK15_RCmax.tluplus"  ;#  Max TLUplus file
set TLUPLUS_MIN_FILE              "${TECH_HOME}/ece720/FreePDK15_star_rcxt/FreePDK15_Cmin.tluplus"  ;#  Min TLUplus file

set MIN_ROUTING_LAYER            "M1"   ;# Min routing layer
set MAX_ROUTING_LAYER            "MINT5"   ;# Max routing layer

set LIBRARY_DONT_USE_FILE        ""   ;# Tcl file with library modifications for dont_use
set LIBRARY_DONT_USE_PRE_COMPILE_LIST ""; #Tcl file for customized don't use list before first compile
set LIBRARY_DONT_USE_PRE_INCR_COMPILE_LIST "";# Tcl file with library modifications for dont_use before incr compile
##########################################################################################
# Multivoltage Common Variables
#
# Define the following multivoltage common variables for the reference methodology scripts 
# for multivoltage flows. 
# Use as few or as many of the following definitions as needed by your design.
##########################################################################################

set PD1                          ""           ;# Name of power domain/voltage area  1
set VA1_COORDINATES              {}           ;# Coordinates for voltage area 1
set MW_POWER_NET1                "VDD1"       ;# Power net for voltage area 1

set PD2                          ""           ;# Name of power domain/voltage area  2
set VA2_COORDINATES              {}           ;# Coordinates for voltage area 2
set MW_POWER_NET2                "VDD2"       ;# Power net for voltage area 2

set PD3                          ""           ;# Name of power domain/voltage area  3
set VA3_COORDINATES              {}           ;# Coordinates for voltage area 3
set MW_POWER_NET3                "VDD3"       ;# Power net for voltage area 3

set PD4                          ""           ;# Name of power domain/voltage area  4
set VA4_COORDINATES              {}           ;# Coordinates for voltage area 4
set MW_POWER_NET4                "VDD4"       ;# Power net for voltage area 4

puts "RM-Info: Completed script [info script]\n"


ECE 720 - Electronic System Level & Physical Design
DRAM Controller, Bus, and Stub Simulation
(c) 2012-2019 By W. Rhett Davis

Certain files in this archive are Copyright ARM, Ltd. and are for use
only by NCSU Students.  For these files, appropriate copyright notices
are included in the header.  We are not licensed to distribute these files!

This directory contains the files necessary to compile a C-program to run
on the ARM DesignStart Cortex M0 System-on-Chip.  Both RTL and Gate-Level
simulations are supported. 

Files:
 
src/rtl/            - This directory contains the complete RTL code for the
                        SoC.  See the README.txt file in that directory
                        for details on each file.
sim/Makefile        - Makefile for the fibonacci.c program and verilog 
                        simulation with Mentor Graphics Questa
sim/tb.v            - Test-bench to load ram.bin (the compiled binary for
                        fibonacci.c) into memory and simulate with the 
                        SoC.  This file has been extensively modified from the 
                        original ARM DesignStart Cortex-M0 test-bench.
sim/AHBLiteStub.sv  - Stub for generating AHB-Lite transactions
sim/xact.txt        - Transaction source-file for the stub
sim/modelsim.ini    - Setup file for Mentor Graphics Modelsim/Questa
sim/addr_stat.py    - Python script to print out address-access statistics
                        to be used with the "Transaction Dump" process.


Directions:

1) Change to the "sim" directory
2) Use "source addsetup.sh" to add Questa your environment
3) Use "source varsetup.sh" to add additional variables to your environment
4) Use "make" to build the ram.bin file
5) Use "make sim" to execute the Verilog simulation


rem Synthesys script for Windows
@echo off

set DESIGN=00first

rem Compile NSL to Verilog
nsl2vl -O -neg_res %DESIGN%.nsl

rem generate qsf file
quartus_sh -t mkproj-DE0.tcl -project %DESIGN% %DESIGN%.v

rem Compile Verilog to sof
quartus_sh --flow compile %DESIGN%

rem Write sof to FPGA board
quartus_pgm -c "USB-Blaster" -m JTAG -o "p;synth\%DESIGN%.sof"


**THIS EMULATOR WAS NOT PART OF MY FINAL YEAR PROJECT**

This is an emulator for the CPU I designed. It has all of the instructions, and features of the CPU. But doesn't require downloading the Digital software needed to run the CPU.

It can be compiled by compiling and linking all files. Such as ```g++ .\CPU.cpp .\CPU.h .\main.cpp -o SAP``` And has the following syntax for running ```SAP <input_file> [memory_view]```. The input file
should be the machine code of the system, gained from the assembler, or hand-written with `v2.0 raw` as the very first line.

The memory view is an optional argument, and it should be an integer. It runs the CPU in debug mode, where it prints out the instruction it is currently running, with the arguments, and the state
of the A and B register. At the end of the program the memory is printed, and it prints the memory from `0` to `memory_view` and `65535-memory_view` to `65535`.

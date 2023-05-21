# Assembler

To compile the assembly use a C++20 compiler at a minimum. And compile and link all files. For example with the GCC compiler.

```gcc assembler.cpp assembler.h lexer.cpp lexer.h main.cpp token.cpp token.h -o asap```


The syntax for using the assembler is:

```asap <input_file> <output_file>``` The input file is an assembly program, and the output file is a hex file.

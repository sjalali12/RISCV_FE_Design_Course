# RISCV FE Design Course with RISC-V_MYTH_Workshop
RISC-V MYTH stands for "Microprocessor for You in Thirty Hours", a Workshop by [https://www.vlsisystemdesign.com/vsd-iat/](VLSI System Design) (VSD) and 
[https://www.redwoodeda.com/](Redwood EDA). 

This workshop promotes and evangelizes the RISC-V open-source-ISA chip-design ecosystem, through the use of TL-Verilog and [makerchip.com](Makerchip). 

One can combine this workshop knowledge and practicals with extra reading to make a solid foundation in
Front-End (FE) semiconductor design and aim to prepare further for SoC, IP modules, SoS and other kinds of chip-subsystems.

## Course Agenda
Day 1 - Introduction to RISC-V, ISA and its related GNU-TOOLCHAIN for compiling; and SPIKE simulator for checking.
Day 2 - Application Binary Interface (ABI) and Verification flow
Day 3 - Digital Logic with TL-Verilog and Makerchip
Day 4 - Basic RISC-V CPU design with TLV
Day 5 - Pipelined RISC-V CPU Microarchitecture design

## Day 1 - Introduction to RISC-V, GNU Compiler Toolchain and SPIKE 
RISC-V is open-source in its Instructioin Set Architecture(ISA). It supports higher flexibility for custom processor designs. 
RV32I stands for RISC-V 32-bit Integer, which is the base-ISA. 

RISC-V GNU Compiler Toolchain includes the RISC-V C and C++ cross-compiler which allows to compile in RISC-V ISA and run on SPIKE simulator.

The command used in Linux terminal to compile the C code:
  riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o \<objfilename>.o \<codefilename>.c
  
We have used two modes of optimization for compilation namely, -O1 and -Ofast. -Ofast mode performs greater level of optimization while conversion of C to assembly.
To view the compiled assembly code, use this command:

riscv64-unknown-elf-objdump -d \<objfilename>.o | less


## Day 2 - Application Binary Interface (ABI) and Verification flow

## Day 3 - Digital Logic with TL-Verilog and Makerchip

## Day 4 - Basic RISC-V CPU design with TLV

## Day 5 - Pipelined RISC-V CPU Microarchitecture design



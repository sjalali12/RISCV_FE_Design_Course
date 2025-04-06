# RISCV FE Design Course with RISC-V_MYTH_Workshop
RISC-V MYTH stands for "Microprocessor for You in Thirty Hours", a Workshop by [https://www.vlsisystemdesign.com/vsd-iat/](VLSI System Design) (VSD) and 
[https://www.redwoodeda.com/](Redwood EDA). 

This workshop promotes and evangelizes the RISC-V open-source-ISA chip-design ecosystem, through the use of TL-Verilog and [makerchip.com](Makerchip). 

![makerchip_ide](https://github.com/user-attachments/assets/672c7cec-d992-4bcf-8585-39f547a6e207)

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

Data Type representations and format specifiers
![image](https://github.com/user-attachments/assets/11cc3a62-c639-49e1-ae8c-f208a3f0d6e6)

The instruction Set Architecture exposes at two levels - User ISA and System ISA.  Both are used by the OS.
The applications and user programs can only use the User ISA whereas the OS provides suitable wrapper or specializedinterfaces that shield the raw System ISA from harm.

RISC-V utilizes the Little-Endian memory addressing architecture at the hardware abstraction level.

All registers have ABI Names as follows:

![image](https://github.com/user-attachments/assets/47c6275f-6d96-45b3-a1a2-3735f8b17e08)


## Day 3 - Digital Logic with TL-Verilog and Makerchip

This covers the Basic and advanced types of logics and Logic Blocks:
![image](https://github.com/user-attachments/assets/97700835-d0ad-44d7-b9cd-dfbe9f1b0339)

The basic 7 types of Logic gates and their Truth Tables:
![image](https://github.com/user-attachments/assets/e1c33408-5b73-4b0e-b874-5423dc4991b6)

Ex one of the basic building blocks of combinational logic is  2 bit adder.  It can be used as a block to make a larger circuits (abbrev. Used as ckt).

![image](https://github.com/user-attachments/assets/183e1b2b-8cfd-4572-a48a-db1438e53807)


## Day 4 - Basic RISC-V CPU design with TLV



## Day 5 - Pipelined RISC-V CPU Microarchitecture design



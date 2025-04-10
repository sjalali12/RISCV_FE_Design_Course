# RISCV FE Design Course with RISC-V_MYTH_Workshop
RISC-V MYTH stands for "Microprocessor for You in Thirty Hours", a Workshop by [https://www.vlsisystemdesign.com/vsd-iat/](VLSI System Design) (VSD) and 
[https://www.redwoodeda.com/](Redwood EDA). 

This workshop promotes and evangelizes the RISC-V open-source-ISA chip-design ecosystem, through the use of TL-Verilog and [makerchip.com](Makerchip). 

![makerchip_ide](https://github.com/user-attachments/assets/672c7cec-d992-4bcf-8585-39f547a6e207 "Sample IDE View - quadrant split" =100x200)

The most defining part of this course/ workshop is that it uses TLV programming, which is a significant abstraction above plain Verilog, where fine-grained actions were needed to code and debug.

**TL-Verilog:**
Transaction-Level Verilog is a language extension to Verilog that allows for a more abstract and behavioral modeling style, making it easier to design and verify complex digital systems. 

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
![image](https://github.com/user-attachments/assets/11cc3a62-c639-49e1-ae8c-f208a3f0d6e6 =100x200)

The instruction Set Architecture exposes at two levels - User ISA and System ISA.  Both are used by the OS.
The applications and user programs can only use the User ISA whereas the OS provides suitable wrapper or specializedinterfaces that shield the raw System ISA from harm.

RISC-V utilizes the Little-Endian memory addressing architecture at the hardware abstraction level.

All registers have ABI Names as follows:

![image](https://github.com/user-attachments/assets/47c6275f-6d96-45b3-a1a2-3735f8b17e08 =100x200)


## Day 3 - Digital Logic with TL-Verilog and Makerchip

This introduces the Makerchip shell, and covers the Basic and advanced types of logics and Logic Blocks:
![image](https://github.com/user-attachments/assets/97700835-d0ad-44d7-b9cd-dfbe9f1b0339)

The basic 7 types of Logic gates and their Truth Tables:
![image](https://github.com/user-attachments/assets/e1c33408-5b73-4b0e-b874-5423dc4991b6)

Ex one of the basic building blocks of combinational logic is  2 bit adder.  It can be used as a block to make a larger circuits (abbrev. Used as ckt).

![image](https://github.com/user-attachments/assets/183e1b2b-8cfd-4572-a48a-db1438e53807)


## Day 4 - Basic RISC-V CPU design with TLV

It covers how to combine Logic Blocks for higher level functionality to make a tiny uP microarchitecture.
Also makes deeper use of the Makerchip shell and the concepts learnt in earlier seeions.

Micro-architecture of Single Cycle RISC-V CPU is designed as:

![image](https://github.com/user-attachments/assets/28cadc4b-903e-484a-ae8c-9af443332a45 =100x200)

And further,
![image](https://github.com/user-attachments/assets/30002149-958f-4e12-9c06-66dafa7fce69 =100x200)

**Shell** -- (Can call it TLV-shell, or Makerchip Shell)
In the context of Makerchip and TL-Verilog (TLV) programming, "shell" refers to the automated scripts (likely using make or bash) that convert TLV code into a format that can be run on an actual FPGA, specifically supporting Xilinx boards with Vivado software. 

•	Shell Scripts:  These scripts automate the process of taking TL-Verilog code and transforming it into a format that can be synthesized and implemented on a physical FPGA. 

•	EDA Flows:  Makerchip Flows aims at developing EDA (Electronic Design Automation) flows for TL-Verilog leveraging Edalize backend, for open source tools/flows like yosys, Openlane, F4PGA, Silicon Compiler, and also commercial ASIC Synthesis and Simulation tools. 

•	Current Support:  The shell script currently supports Xilinx boards with Vivado software. 

The CPU is like a magic team of hardware components designed in TL-Verilog to implement an execution platform for a specified target Instruction Set as per an ISA.  Here are the major components we put together:

1. Program Counter (PC) - This special register in a CPU (known since the days of the 8-bit Intel 8085 SBC) tracks the memory address of the next instruction to fetch+execute. It is incremented sequentially to the next instruction in the instr-memory, unless overwritten by the calculations of a Branch type instruction.

2. Instruction Decoder - The instruction decoder interprets the binary representation of the op-code part of the instruction to govern the operation of other components in the CPU to execute the instruction.

3. Instruction Memory - This storage holds the binary machine instructions of a program. It is typically read-only (at the system software level, and by op-codes) -- writable only by the CPU hardware circuits. (it seems - technically, it is a RAM). 

4. Data Memory - This storage component stores data to be manipulated by instructions in program execution. The right op-codes can read and write on this. It holds variables, data arrays, and other items that the program uses in execution.

5. ALU (Arithmetic Logic Unit) - The ALU is a fundamental digital circuit within the CPU that performs arithmetic and logic operations like comparisons and bitwise operations (AND, OR, XOR and their NOTs)). The ALU-generated results are used in various computations specified by the instructions.

6. Register File – Called RF in the course/ videos, RF is a set of registers used to hold data during the execution of instructions. Each instruction specifies which registers are involved for read or write involved in the Instruction.  The data from these registers can be used as operands for operations performed by the ALU or other components.
   
Contrary to early feeling by some students, there is a single RF, not separate ones for read or write.  The RF  serves as the primary storage for data during program execution, allowing both read and write operations, through separate read and write ports, it's a single, unified memory unit that supports storing and retrieving of data, 
The RF ensures that the updated data is available for subsequent instructions.
All the above components truly collaborate to execute machine instructions in a CPU. The PC guides the steps to fetch the next instruction, which is then interpreted by the Decoder, the ALU performs computations, the registers in RF hold data, and the memory components provide data storage and access. 
The resulting CPU is like an orchestra that plays out the task executions required by a program's instructions.


## Day 5 - Pipelined RISC-V CPU Microarchitecture design

Final practicals cover the following:
•	Pipelining of RISC-V CPU Design
•	Create 3-Cycle RISC-V - valid & Invalid cycles
•	Modify 3-Cycle RISC-V to distribute Logic
•	Types of pipeline hazards, and their solutions
•	Coding a complete ALU
•	Load/ Store instructions and adding them to a test program
•	Control Logic for jump instructions
•	Wrap-up



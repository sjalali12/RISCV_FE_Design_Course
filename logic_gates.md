
# Introduction to Logic Gates

This section covered **digital logic**, where we use **1s and 0s** (on and off) to make computers and electronics work.

---

## What are Logic Gates?

Logic gates are the **basic building blocks** of all digital circuits.  
They take digital inputs (1s or 0s) and give an output based on logic operations.

Examples:
- **AND** gate: Only gives 1 if *both* inputs are 1  
- **OR** gate: Gives 1 if *any* input is 1  
- **NOT** gate: Flips the input (1 becomes 0, 0 becomes 1)
- **XOR** gate: Gives 1 if *ONLY ONE* of the inputs is 1  
- **NOR** gate: Flips the output of an OR operation 
- **NAND** gate: Only gives 1 if *both* inputs are 1  


---

## 🔨 Combinational Logic

These circuits give outputs **based ONLY on current inputs**.  Memory is NOT used.

### Example: Full Adder

A full adder adds 3 bits together:

- Inputs: A, B, Cin (carry-in)  
- Outputs: S (sum), Cout (carry-out)


---

## Sequential Logic

These circuits are meant to **remember things** by using the clock signal.

- We use **registers** to store values.
- The output depends on both **current input** and **previous values**.

This is useful in order to process data sequentially over time.


---

## Pipeline Logic

instruction Pipelining involves breaking a complex step into smaller steps.

Each smaller step runs in a different clock cycle. This is generally aimed to
reduce the number of Cycles Per (main) Instruction (CPI). 

A pipelined processor can, compared to a nonpipelined design (assuming identical cycle
times),  can significantly reduce the CPI.

---

## Hierarchical Design

After building small parts (e.g. an adder), they can be used to compose bigger parts or 
functional elements.

This helps in organizing big projects better.

---



# Mini Processor (Verilog)

This repository contains a simple 8-bit processor written in Verilog.

- Source files: `project_1.srcs/sources_1`
- Testbench files: `project_1.srcs/sim_1`

## Processor Overview

- 16 8-bit general-purpose registers
- Separate 32 8-bit instruction memory
- 8 bit Accumulator (ACC) register 
- EXT register for storing overflow bits during multiplication
- C/B register for carry/borrow
- 5 bit program counter(PC)

<img width="1202" height="675" alt="image" src="https://github.com/user-attachments/assets/10ed5968-772d-4144-8d09-df8a2812d955" />

## Instruction Set

| Opcode     | Mnemonic      | Operation Description                            |
|------------|---------------|--------------------------------------------------|
| `0000 0000`| `NOP`         | No operation                                     |
| `0001 xxxx`| `ADD Ri`      | ACC ← ACC + Ri, updates C/B                      |
| `0010 xxxx`| `SUB Ri`      | ACC ← ACC - Ri, updates C/B                      |
| `0011 xxxx`| `MUL Ri`      | ACC × Ri, stores high bits in EXT               |
| `0000 0001`| `LSL ACC`     | Logical shift left ACC                           |
| `0000 0010`| `LSR ACC`     | Logical shift right ACC                          |
| `0000 0011`| `CIR ACC`     | Circular right shift ACC                         |
| `0000 0100`| `CIL ACC`     | Circular left shift ACC                          |
| `0000 0101`| `ASR ACC`     | Arithmetic shift right ACC                       |
| `0101 xxxx`| `AND Ri`      | ACC ← ACC & Ri                                   |
| `0110 xxxx`| `XRA Ri`      | ACC ← ACC ⊕ Ri                                   |
| `0111 xxxx`| `CMP Ri`      | Compare ACC with Ri, set C/B                     |
| `0000 0110`| `INC ACC`     | ACC ← ACC + 1, update C/B if overflow            |
| `0000 0111`| `DEC ACC`     | ACC ← ACC - 1, update C/B if underflow           |
| `1000 xxxx`| `BR addr`     | Branch if C/B = 1                                |
| `1001 xxxx`| `MOV ACC, Ri` | ACC ← Ri                                         |
| `1010 xxxx`| `MOV Ri, ACC` | Ri ← ACC                                         |
| `1011 xxxx`| `RET addr`    | Return to address                                |
| `1111 1111`| `HLT`         | Halt execution                                   |

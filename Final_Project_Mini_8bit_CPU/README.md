# Mini 8-bit CPU – Final Project

This project presents the design and simulation of a simple 8-bit CPU using Verilog HDL in Xilinx ISE 14.7.

The CPU was developed in separate modules and then connected together in a final top-level design. The design uses scalar input and output signals for the CPU components.

## Assigned Instruction Set

The project uses the following instructions:

| Opcode | Instruction | Operation |
|--------|-------------|-----------|
| 0001 | LDI | Load immediate value into ACC |
| 0010 | ADD | ACC = ACC + Operand |
| 0011 | SUB | ACC = ACC - Operand |
| 1010 | STA | R = ACC |
| 1011 | LDR | ACC = R |

Unsupported opcodes are treated as NOP.

## CPU Modules

### 1. Program Counter
A 4-bit Program Counter keeps track of the current instruction address.  
It increases after each instruction and returns to 0000 when RESET is active.

### 2. Program ROM
The Program ROM stores the fixed instruction sequence for the assigned CPU program.  
The Program Counter selects the current ROM address.

### 3. Arithmetic Logic Unit
The ALU performs the required operations for this CPU, including:

- LDI
- ADD
- SUB

The operation is selected using control signals from the Control Unit.

### 4. R Register
The R Register is an 8-bit temporary register.

During the STA instruction:

R = ACC

The stored value remains unchanged until another STA instruction is executed.

### 5. ACC and Z Register
The accumulator stores the main CPU result.

The Z flag becomes 1 when the value written to ACC is 00000000.  
Otherwise, Z becomes 0.

### 6. Control Unit
The Control Unit reads the opcode from the Program ROM and generates the required control signals for the ALU, ACC, R Register, and Program Counter.

### 7. Final CPU
The final top-level CPU connects:

Program Counter → Program ROM → Control Unit → ALU → ACC

The R Register is also connected for STA and LDR operations.

## Program Sequence

| PC | Instruction | Expected ACC | Z | Expected R |
|----|-------------|--------------|---|------------|
| 0000 | LDI 0x64 | 01100100 | 0 | 00000000 |
| 0001 | STA | 01100100 | 0 | 01100100 |
| 0010 | SUB 0x14 | 01010000 | 0 | 01100100 |
| 0011 | ADD 0x0A | 01011010 | 0 | 01100100 |
| 0100 | STA | 01011010 | 0 | 01011010 |
| 0101 | SUB 0x5A | 00000000 | 1 | 01011010 |
| 0110 | LDR | 01011010 | 0 | 01011010 |
| 0111 | SUB 0x60 | 11111010 | 0 | 01011010 |

## Final Result

The complete Mini 8-bit CPU was successfully designed, synthesized, and simulated in Xilinx ISE 14.7.

The final simulation showed that the Program Counter, Program ROM, Control Unit, ALU, ACC, R Register, and Z flag worked together correctly for the assigned instruction sequence.

The final accumulator output was:

11111010 (0xFA)

## Tools Used

- Verilog HDL
- Xilinx ISE 14.7
- ISim Simulator
- Oracle VirtualBox

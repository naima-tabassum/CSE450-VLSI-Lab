# 8-bit ALU Design

This project implements an 8-bit Arithmetic Logic Unit (ALU) using Verilog HDL in Xilinx ISE 14.7.

The design was developed step by step by first creating and testing individual 1-bit operations. These operations were then combined into a single 1-bit ALU using opcode inputs. Finally, eight 1-bit ALU blocks were connected to form the complete 8-bit ALU.

## Implemented Operations

- AND
- OR
- XOR
- NOT
- ADD
- SUBTRACT

## Opcode Selection

| Opcode | Operation |
|--------|-----------|
| 000 | AND |
| 001 | OR |
| 010 | XOR |
| 011 | NOT |
| 100 | ADD |
| 101 | SUBTRACT |

## Design Structure

The project contains:

- Individual 1-bit ALU operation modules
- Combined 1-bit ALU
- Final 8-bit ALU
- Verilog testbenches
- RTL schematic screenshots
- Simulation waveform screenshots

The 8-bit design uses separate scalar input and output signals instead of vector notation. The final ALU also includes `Cout` for carry/borrow and `Zero` to indicate when the complete result is zero.

## Tools Used

- Xilinx ISE 14.7
- Verilog HDL
- ISim Simulator

## Verification

Each individual operation was tested separately. The combined 1-bit ALU was then verified using opcode selection, and the final 8-bit ALU was simulated with different input combinations to confirm the expected outputs.

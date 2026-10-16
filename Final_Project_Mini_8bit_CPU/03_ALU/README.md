# 8-bit ALU

This folder contains the Arithmetic Logic Unit used in the Mini 8-bit CPU.

The ALU receives the current ACC value and the operand from the Program ROM. The required operation is selected by the control signals SEL1 and SEL0.

## Implemented Operations

| SEL1 SEL0 | Operation |
|-----------|-----------|
| 00 | LDI |
| 01 | ADD |
| 10 | SUB |

### LDI
The operand is passed directly to the result.

### ADD
The ALU adds the operand to the current ACC value.

### SUB
The ALU subtracts the operand from the current ACC value.

## Tested Results

| Operation | Expected Result |
|-----------|-----------------|
| LDI 0x64 | 01100100 |
| 0x64 - 0x14 | 01010000 |
| 0x50 + 0x0A | 01011010 |
| 0x5A - 0x5A | 00000000 |
| 0x5A - 0x60 | 11111010 |

## Files

- `alu_8bit_cpu.v` – Verilog design of the ALU
- `alu_8bit_cpu_tb.v` – Testbench
- `rtl_schematic_alu_8bit_cpu.png` – RTL schematic
- `simulation_waveform_alu_8bit_cpu.png` – Simulation waveform

## Verification

The simulation showed that the ALU produced the expected results for the LDI, ADD, and SUB operations.

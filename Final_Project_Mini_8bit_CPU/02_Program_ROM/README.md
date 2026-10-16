# Program ROM

This folder contains the Program ROM used in the Mini 8-bit CPU.

The ROM receives the 4-bit Program Counter value and provides the corresponding opcode and operand for the current instruction.

## Stored Program

| PC | Opcode | Operand | Instruction |
|----|--------|---------|-------------|
| 0000 | 0001 | 01100100 | LDI 0x64 |
| 0001 | 1010 | 00000000 | STA |
| 0010 | 0011 | 00010100 | SUB 0x14 |
| 0011 | 0010 | 00001010 | ADD 0x0A |
| 0100 | 1010 | 00000000 | STA |
| 0101 | 0011 | 01011010 | SUB 0x5A |
| 0110 | 1011 | 00000000 | LDR |
| 0111 | 0011 | 01100000 | SUB 0x60 |

Unused addresses produce the default NOP value.

## Files

- `program_rom.v` – Verilog design of the Program ROM
- `program_rom_tb.v` – Testbench
- `rtl_schematic_program_rom.png` – RTL schematic
- `simulation_waveform_program_rom.png` – Simulation waveform

## Verification

The simulation confirmed that each Program Counter address produced the expected opcode and operand.

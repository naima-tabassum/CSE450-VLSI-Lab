# Final Mini 8-bit CPU

This folder contains the complete top-level design and final simulation of the Mini 8-bit CPU.

The previously designed CPU blocks were connected together to form the complete processor.

## Connected CPU Blocks

The final CPU contains:

1. 4-bit Program Counter
2. Program ROM
3. Control Unit
4. 8-bit ALU
5. 8-bit R Register
6. ACC and Z Register

## Basic Data Flow

Program Counter → Program ROM → Control Unit → ALU → ACC

The R Register is connected to ACC for the STA and LDR instructions.

## Inputs

- `CLK`
- `RESET`

## Outputs

- `PC0` to `PC3`
- `Q0` to `Q7`
- `Z`

The Q outputs represent the current ACC value.

## Final Program Execution

| PC | Instruction | ACC / Q | Z | R |
|----|-------------|---------|---|---|
| Reset | RESET | 00000000 | 1 | 00000000 |
| 0000 | LDI 0x64 | 01100100 | 0 | 00000000 |
| 0001 | STA | 01100100 | 0 | 01100100 |
| 0010 | SUB 0x14 | 01010000 | 0 | 01100100 |
| 0011 | ADD 0x0A | 01011010 | 0 | 01100100 |
| 0100 | STA | 01011010 | 0 | 01011010 |
| 0101 | SUB 0x5A | 00000000 | 1 | 01011010 |
| 0110 | LDR | 01011010 | 0 | 01011010 |
| 0111 | SUB 0x60 | 11111010 | 0 | 01011010 |

## Final Output

After completing the assigned instruction sequence:

ACC / Q = 11111010

Hexadecimal value:

0xFA

## Files

- `mini_8bit_cpu.v` – Complete top-level CPU design
- `mini_8bit_cpu_tb.v` – Final CPU testbench
- `rtl_schematic_mini_8bit_cpu_top_level.png` – Top-level RTL schematic
- `rtl_schematic_mini_8bit_cpu_expanded.png` – Expanded CPU RTL schematic
- `simulation_waveform_mini_8bit_cpu.png` – Final CPU simulation waveform

## Verification

The final simulation confirmed that the Program Counter, Program ROM, Control Unit, ALU, ACC, R Register, and Z flag worked together correctly.

The CPU executed the complete instruction sequence and produced the expected final output of 11111010 (0xFA).

# Control Unit

This folder contains the Control Unit of the Mini 8-bit CPU.

The Control Unit receives the opcode from the Program ROM and generates the control signals required by the other CPU blocks.

## Supported Instructions

| Opcode | Instruction |
|--------|-------------|
| 0001 | LDI |
| 0010 | ADD |
| 0011 | SUB |
| 1010 | STA |
| 1011 | LDR |

Unsupported opcodes are treated as NOP.

## Control Signals

- `SEL0` and `SEL1` select the ALU operation.
- `LOAD_ACC` controls when ACC stores a new value.
- `LOAD_R` controls when the R Register stores the ACC value.
- `SELECT_R` selects the R Register as the source for LDR.
- `PC_ENABLE` allows the Program Counter to move to the next instruction.

## Control Table

| Instruction | SEL1 SEL0 | LOAD_ACC | LOAD_R | SELECT_R |
|-------------|-----------|----------|--------|----------|
| NOP | 00 | 0 | 0 | 0 |
| LDI | 00 | 1 | 0 | 0 |
| ADD | 01 | 1 | 0 | 0 |
| SUB | 10 | 1 | 0 | 0 |
| STA | 00 | 0 | 1 | 0 |
| LDR | 00 | 1 | 0 | 1 |

For this instruction set, PC_ENABLE remains active because no jump instruction is used.

## Files

- `control_unit.v` – Verilog design of the Control Unit
- `control_unit_tb.v` – Testbench
- `rtl_schematic_control_unit.png` – RTL schematic
- `simulation_waveform_control_unit.png` – Simulation waveform

## Verification

The simulation confirmed that the Control Unit generated the expected control signals for every supported instruction and treated unsupported opcodes as NOP.

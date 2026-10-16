# ACC and Z Register

This folder contains the Accumulator and Zero Flag logic used in the Mini 8-bit CPU.

The ACC register stores the main result of the CPU.

The Z flag indicates whether the value written to ACC is zero.

## Operation

- RESET = 1 → ACC becomes 00000000 and Z becomes 1.
- LOAD_ACC = 1 → a new value is stored in ACC.
- SELECT_R = 0 → the ALU result is stored in ACC.
- SELECT_R = 1 → the R Register value is stored in ACC.
- If the new ACC value is 00000000, Z becomes 1.
- Otherwise, Z becomes 0.

## Expected ACC Sequence

| Instruction | ACC | Z |
|-------------|-----|---|
| Reset | 00000000 | 1 |
| LDI 0x64 | 01100100 | 0 |
| STA | 01100100 | 0 |
| SUB 0x14 | 01010000 | 0 |
| ADD 0x0A | 01011010 | 0 |
| STA | 01011010 | 0 |
| SUB 0x5A | 00000000 | 1 |
| LDR | 01011010 | 0 |
| SUB 0x60 | 11111010 | 0 |

## Files

- `acc_z_register.v` – Verilog design of the ACC and Z Register
- `acc_z_register_tb.v` – Testbench
- `rtl_schematic_acc_z_register.png` – RTL schematic
- `simulation_waveform_acc_z_register.png` – Simulation waveform

## Verification

The simulation confirmed that ACC stored the expected values and that the Z flag became 1 whenever the new ACC value was zero.

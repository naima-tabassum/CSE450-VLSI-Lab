# 8-bit R Register

This folder contains the 8-bit R Register used in the Mini 8-bit CPU.

The R Register is used as a temporary storage register.

During the STA instruction, the current ACC value is stored in R.

## Operation

- RESET = 1 → R becomes 00000000.
- LOAD_R = 1 → the current ACC value is stored in R.
- LOAD_R = 0 → R keeps its previous value.

## Important Values

- First STA stores 0x64 in R.
- Second STA stores 0x5A in R.
- During other instructions, R keeps its previous value.

## Files

- `r_register_8bit.v` – Verilog design of the R Register
- `r_register_8bit_tb.v` – Testbench
- `rtl_schematic_r_register_8bit.png` – RTL schematic
- `simulation_waveform_r_register_8bit.png` – Simulation waveform

## Verification

The simulation confirmed that the R Register stored the ACC value only when LOAD_R was active and kept the stored value during the other instructions.

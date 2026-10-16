# 4-bit Program Counter

This folder contains the design and simulation of the 4-bit Program Counter used in the Mini 8-bit CPU.

The Program Counter keeps track of the address of the current instruction. It uses four separate output bits: PC0, PC1, PC2, and PC3.

The counter is updated at the rising edge of the clock.

## Operation

- When RESET = 1, the Program Counter is cleared to 0000.
- When PC_ENABLE = 1, the Program Counter increases by 1 at each rising edge of CLK.
- When PC_ENABLE = 0, the Program Counter keeps its previous value.

## Files

- `pc_4bit.v` – Verilog design of the 4-bit Program Counter
- `pc_4bit_tb.v` – Testbench
- `rtl_schematic_pc_4bit.png` – RTL schematic
- `simulation_waveform_pc_4bit.png` – Simulation waveform

## Verification

The simulation confirmed that the Program Counter reset correctly, counted through successive addresses, and held its value when PC_ENABLE was disabled.

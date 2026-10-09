# 8-bit Accumulator – Midterm Lab

This folder contains the Verilog design, testbench, RTL schematics, and simulation result of the 8-bit Accumulator Midterm Lab.

## Files

- `accumulator_8bit.v` – Main Verilog design
- `accumulator_8bit_tb.v` – Testbench
- `rtl_schematic_accumulator_8bit_top_level.png` – Top-level RTL schematic
- `rtl_schematic_accumulator_8bit_expanded.png` – Expanded RTL schematic
- `simulation_waveform_accumulator_8bit.png` – ISim simulation waveform

## Operation

At each rising edge of CLK:

- If RESET = 1, Q is cleared to `00000000`.
- If RESET = 0, Q stores the result of A + B.

The design was implemented and simulated using Verilog HDL in Xilinx ISE 14.7.

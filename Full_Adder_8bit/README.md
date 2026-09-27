# 8-bit Full Adder Design and Simulation

This experiment implements an 8-bit Full Adder using Verilog HDL in Xilinx ISE 14.7.

The design uses eight 1-bit Full Adder modules connected in sequence. The carry output of each stage is connected to the carry input of the next stage.

All input and output signals are implemented separately without using vector notation.

## Design Inputs
- a0 to a7
- b0 to b7
- cin

## Design Outputs
- sum0 to sum7
- carry

## Files
- `full_adder.v` — 1-bit Full Adder module
- `full_adder_8bit.v` — 8-bit Full Adder design
- `full_adder_8bit_tb.v` — Testbench for simulation
- `rtl_schematic_8bit_top_level.png` — Top-level RTL schematic
- `rtl_schematic_8bit_expanded.png` — Expanded RTL schematic
- `simulation_waveform_inputs_8bit.png` — Input simulation waveform
- `simulation_waveform_outputs_8bit.png` — Output simulation waveform

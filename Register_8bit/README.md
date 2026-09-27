# 8-Bit Register Using D Flip-Flops

This project implements and simulates an 8-bit register using eight 1-bit D flip-flop based register stages in Xilinx ISE 14.7.

The design uses separate scalar input and output signals. Each bit has an individual data input and output, while all register stages share the same clock signal.

## Inputs
- D0 to D7
- clk

## Outputs
- Q0 to Q7

## Project Files
- `register_1bit.v` — 1-bit register module
- `register_8bit.v` — 8-bit register design
- `register_8bit_tb.v` — simulation testbench
- `rtl_schematic_register_8bit_top_level.png` — top-level RTL schematic
- `rtl_schematic_register_8bit_expanded.png` — expanded RTL schematic
- `simulation_waveform_output_verification_register_8bit.png` — output verification waveform
- `simulation_waveform_selected_inputs_clock_register_8bit.png` — selected input and clock waveform

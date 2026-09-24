# Full Adder Design and Simulation

This experiment implements and simulates a Full Adder using Verilog HDL in Xilinx ISE 14.7.

## Inputs
- a
- b
- cin

## Outputs
- sum
- carry

## Boolean Expressions

Sum = a XOR b XOR cin

Carry = (a AND b) OR (b AND cin) OR (cin AND a)

## Files

- `full_adder.v` — Verilog HDL implementation of the Full Adder
- `full_adder_output.v` — Verilog testbench used for simulation
- `rtl_schematic.png` — RTL schematic generated using Xilinx ISE
- `simulation_waveform.png` — Simulation waveform generated using ISim

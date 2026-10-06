# 8-bit Accumulator – Midterm Lab

This project contains the design and simulation of an 8-bit accumulator using Verilog HDL in Xilinx ISE 14.7.

The accumulator takes two 8-bit inputs, A and B. At every rising edge of the clock, the result of A + B is stored in the 8-bit output Q. A synchronous active-high RESET is used to clear the output to 00000000.

## Design Operation

- RESET = 1 → Q is cleared to 00000000 at the rising edge of CLK.
- RESET = 0 → Q stores the result of A + B at the rising edge of CLK.
- If the addition produces a value larger than 8 bits, the extra carry is not stored.

## Test Sequence

| Step | Operation | A | B | Expected Q |
|------|-----------|----------|----------|----------|
| 1 | Reset | 00000000 | 00000000 | 00000000 |
| 2 | 3 + 5 | 00000011 | 00000101 | 00001000 |
| 3 | 2 + 1 | 00000010 | 00000001 | 00000011 |
| 4 | 255 + 1 | 11111111 | 00000001 | 00000000 |
| 5 | 170 + 5 | 10101010 | 00000101 | 10101111 |

## Files

- `accumulator_8bit.v` – Verilog design of the 8-bit accumulator
- `accumulator_8bit_tb.v` – Testbench used for simulation
- RTL schematic of the accumulator
- ISim simulation waveform
- Midterm lab report

## Tools Used

- Xilinx ISE 14.7
- Verilog HDL
- ISim Simulator

## Result

The simulation verified that the accumulator correctly adds the two 8-bit inputs and stores the result at each rising edge of the clock. The RESET operation and the 8-bit overflow case were also verified successfully.

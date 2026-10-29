`timescale 1ns / 1ps

module accumulator_8bit(
    input [7:0] A,
    input [7:0] B,
    input CLK,
    input RESET,
    output reg [7:0] Q
);

// 8-bit Adder
wire [7:0] SUM;
assign SUM = A + B;


// 8-bit Register
always @(posedge CLK)
begin
    if (RESET)
        Q <= 8'b00000000;
    else
        Q <= SUM;
end

endmodule

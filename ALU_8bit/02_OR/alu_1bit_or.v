`timescale 1ns / 1ps

module alu_1bit_or(
    input A,
    input B,
    output Y
    );

assign Y = A | B;

endmodule

`timescale 1ns / 1ps

module alu_1bit_subtract_tb;

reg A;
reg B;
reg Bin;

wire Diff;
wire Bout;

alu_1bit_subtract uut (
    .A(A),
    .B(B),
    .Bin(Bin),
    .Diff(Diff),
    .Bout(Bout)
);

initial begin

    A = 0; B = 0; Bin = 0;
    #100;

    A = 0; B = 0; Bin = 1;
    #100;

    A = 0; B = 1; Bin = 0;
    #100;

    A = 0; B = 1; Bin = 1;
    #100;

    A = 1; B = 0; Bin = 0;
    #100;

    A = 1; B = 0; Bin = 1;
    #100;

    A = 1; B = 1; Bin = 0;
    #100;

    A = 1; B = 1; Bin = 1;
    #100;

    $finish;

end

endmodule
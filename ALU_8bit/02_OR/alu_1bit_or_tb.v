`timescale 1ns / 1ps

module alu_1bit_or_tb;

reg A;
reg B;

wire Y;

alu_1bit_or uut (
    .A(A),
    .B(B),
    .Y(Y)
);

initial begin

    A = 0; B = 0;
    #100;

    A = 0; B = 1;
    #100;

    A = 1; B = 0;
    #100;

    A = 1; B = 1;
    #100;

    $finish;

end     
endmodule


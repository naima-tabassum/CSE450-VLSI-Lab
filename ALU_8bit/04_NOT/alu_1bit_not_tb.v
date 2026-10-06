
`timescale 1ns / 1ps

module alu_1bit_not_tb;

reg A;
wire Y;

alu_1bit_not uut (
    .A(A),
    .Y(Y)
);

initial begin

    A = 0;
    #100;

    A = 1;
    #100;

    $finish;

end

endmodule


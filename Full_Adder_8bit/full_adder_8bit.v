`timescale 1ns / 1ps

module full_adder_8bit(
    input a0,
    input a1,
    input a2,
    input a3,
    input a4,
    input a5,
    input a6,
    input a7,

    input b0,
    input b1,
    input b2,
    input b3,
    input b4,
    input b5,
    input b6,
    input b7,

    input cin,

    output sum0,
    output sum1,
    output sum2,
    output sum3,
    output sum4,
    output sum5,
    output sum6,
    output sum7,

    output carry
);

wire c0;
wire c1;
wire c2;
wire c3;
wire c4;
wire c5;
wire c6;

full_adder fa0 (
    .a(a0),
    .b(b0),
    .cin(cin),
    .sum(sum0),
    .carry(c0)
);

full_adder fa1 (
    .a(a1),
    .b(b1),
    .cin(c0),
    .sum(sum1),
    .carry(c1)
);

full_adder fa2 (
    .a(a2),
    .b(b2),
    .cin(c1),
    .sum(sum2),
    .carry(c2)
);

full_adder fa3 (
    .a(a3),
    .b(b3),
    .cin(c2),
    .sum(sum3),
    .carry(c3)
);

full_adder fa4 (
    .a(a4),
    .b(b4),
    .cin(c3),
    .sum(sum4),
    .carry(c4)
);

full_adder fa5 (
    .a(a5),
    .b(b5),
    .cin(c4),
    .sum(sum5),
    .carry(c5)
);

full_adder fa6 (
    .a(a6),
    .b(b6),
    .cin(c5),
    .sum(sum6),
    .carry(c6)
);

full_adder fa7 (
    .a(a7),
    .b(b7),
    .cin(c6),
    .sum(sum7),
    .carry(carry)
);

endmodule



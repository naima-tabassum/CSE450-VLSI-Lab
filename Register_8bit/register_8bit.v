`timescale 1ns / 1ps


module register_8bit(

    // 8 inputs
    input D0,
    input D1,
    input D2,
    input D3,
    input D4,
    input D5,
    input D6,
    input D7,

    input clk,

    // 8 outputs
    output Q0,
    output Q1,
    output Q2,
    output Q3,
    output Q4,
    output Q5,
    output Q6,
    output Q7
);

    // Bit 0
    register_1bit REG0 (
        .D(D0),
        .clk(clk),
        .Q(Q0)
    );

    // Bit 1
    register_1bit REG1 (
        .D(D1),
        .clk(clk),
        .Q(Q1)
    );

    // Bit 2
    register_1bit REG2 (
        .D(D2),
        .clk(clk),
        .Q(Q2)
    );

    // Bit 3
    register_1bit REG3 (
        .D(D3),
        .clk(clk),
        .Q(Q3)
    );

    // Bit 4
    register_1bit REG4 (
        .D(D4),
        .clk(clk),
        .Q(Q4)
    );

    // Bit 5
    register_1bit REG5 (
        .D(D5),
        .clk(clk),
        .Q(Q5)
    );

    // Bit 6
    register_1bit REG6 (
        .D(D6),
        .clk(clk),
        .Q(Q6)
    );

    // Bit 7
    register_1bit REG7 (
        .D(D7),
        .clk(clk),
        .Q(Q7)
    );


endmodule

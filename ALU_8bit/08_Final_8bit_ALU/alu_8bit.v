`timescale 1ns / 1ps

module alu_8bit(
    input A0,
    input A1,
    input A2,
    input A3,
    input A4,
    input A5,
    input A6,
    input A7,

    input B0,
    input B1,
    input B2,
    input B3,
    input B4,
    input B5,
    input B6,
    input B7,

    input op2,
    input op1,
    input op0,

    output Result0,
    output Result1,
    output Result2,
    output Result3,
    output Result4,
    output Result5,
    output Result6,
    output Result7,

    output Cout,
    output Zero
);

wire c1;
wire c2;
wire c3;
wire c4;
wire c5;
wire c6;
wire c7;


// Bit 0
alu_1bit ALU0 (
    .A(A0),
    .B(B0),
    .Cin(1'b0),
    .op2(op2),
    .op1(op1),
    .op0(op0),
    .Result(Result0),
    .Cout(c1)
);


// Bit 1
alu_1bit ALU1 (
    .A(A1),
    .B(B1),
    .Cin(c1),
    .op2(op2),
    .op1(op1),
    .op0(op0),
    .Result(Result1),
    .Cout(c2)
);


// Bit 2
alu_1bit ALU2 (
    .A(A2),
    .B(B2),
    .Cin(c2),
    .op2(op2),
    .op1(op1),
    .op0(op0),
    .Result(Result2),
    .Cout(c3)
);


// Bit 3
alu_1bit ALU3 (
    .A(A3),
    .B(B3),
    .Cin(c3),
    .op2(op2),
    .op1(op1),
    .op0(op0),
    .Result(Result3),
    .Cout(c4)
);


// Bit 4
alu_1bit ALU4 (
    .A(A4),
    .B(B4),
    .Cin(c4),
    .op2(op2),
    .op1(op1),
    .op0(op0),
    .Result(Result4),
    .Cout(c5)
);


// Bit 5
alu_1bit ALU5 (
    .A(A5),
    .B(B5),
    .Cin(c5),
    .op2(op2),
    .op1(op1),
    .op0(op0),
    .Result(Result5),
    .Cout(c6)
);


// Bit 6
alu_1bit ALU6 (
    .A(A6),
    .B(B6),
    .Cin(c6),
    .op2(op2),
    .op1(op1),
    .op0(op0),
    .Result(Result6),
    .Cout(c7)
);


// Bit 7
alu_1bit ALU7 (
    .A(A7),
    .B(B7),
    .Cin(c7),
    .op2(op2),
    .op1(op1),
    .op0(op0),
    .Result(Result7),
    .Cout(Cout)
);


// Zero flag
assign Zero = ~(Result0 | Result1 | Result2 | Result3 |
                Result4 | Result5 | Result6 | Result7);

endmodule
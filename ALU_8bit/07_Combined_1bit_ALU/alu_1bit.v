`timescale 1ns / 1ps

module alu_1bit(
    input A,
    input B,
    input Cin,
    input op2,
    input op1,
    input op0,
    output reg Result,
    output reg Cout
);

wire and_result;
wire or_result;
wire xor_result;
wire not_result;

wire add_sum;
wire add_cout;

wire sub_diff;
wire sub_bout;


// AND operation
alu_1bit_and AND0 (
    .A(A),
    .B(B),
    .Y(and_result)
);


// OR operation
alu_1bit_or OR0 (
    .A(A),
    .B(B),
    .Y(or_result)
);


// XOR operation
alu_1bit_xor XOR0 (
    .A(A),
    .B(B),
    .Y(xor_result)
);


// NOT operation
alu_1bit_not NOT0 (
    .A(A),
    .Y(not_result)
);


// ADD operation
alu_1bit_add ADD0 (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(add_sum),
    .Cout(add_cout)
);


// SUBTRACT operation
alu_1bit_subtract SUB0 (
    .A(A),
    .B(B),
    .Bin(Cin),
    .Diff(sub_diff),
    .Bout(sub_bout)
);


// Select operation using opcode
always @(*) begin

    Result = 0;
    Cout = 0;

    // 000 = AND
    if ((op2 == 0) && (op1 == 0) && (op0 == 0)) begin
        Result = and_result;
        Cout = 0;
    end

    // 001 = OR
    else if ((op2 == 0) && (op1 == 0) && (op0 == 1)) begin
        Result = or_result;
        Cout = 0;
    end

    // 010 = XOR
    else if ((op2 == 0) && (op1 == 1) && (op0 == 0)) begin
        Result = xor_result;
        Cout = 0;
    end

    // 011 = NOT
    else if ((op2 == 0) && (op1 == 1) && (op0 == 1)) begin
        Result = not_result;
        Cout = 0;
    end

    // 100 = ADD
    else if ((op2 == 1) && (op1 == 0) && (op0 == 0)) begin
        Result = add_sum;
        Cout = add_cout;
    end

    // 101 = SUBTRACT
    else if ((op2 == 1) && (op1 == 0) && (op0 == 1)) begin
        Result = sub_diff;
        Cout = sub_bout;
    end

    // 110 and 111 are unused
    else begin
        Result = 0;
        Cout = 0;
    end

end

endmodule
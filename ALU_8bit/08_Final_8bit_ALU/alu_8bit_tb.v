`timescale 1ns / 1ps

module alu_8bit_tb;

reg A0;
reg A1;
reg A2;
reg A3;
reg A4;
reg A5;
reg A6;
reg A7;

reg B0;
reg B1;
reg B2;
reg B3;
reg B4;
reg B5;
reg B6;
reg B7;

reg op2;
reg op1;
reg op0;

wire Result0;
wire Result1;
wire Result2;
wire Result3;
wire Result4;
wire Result5;
wire Result6;
wire Result7;

wire Cout;
wire Zero;


alu_8bit uut (
    .A0(A0),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .A4(A4),
    .A5(A5),
    .A6(A6),
    .A7(A7),

    .B0(B0),
    .B1(B1),
    .B2(B2),
    .B3(B3),
    .B4(B4),
    .B5(B5),
    .B6(B6),
    .B7(B7),

    .op2(op2),
    .op1(op1),
    .op0(op0),

    .Result0(Result0),
    .Result1(Result1),
    .Result2(Result2),
    .Result3(Result3),
    .Result4(Result4),
    .Result5(Result5),
    .Result6(Result6),
    .Result7(Result7),

    .Cout(Cout),
    .Zero(Zero)
);


initial begin

    // Initial values
    A0=0; A1=0; A2=0; A3=0;
    A4=0; A5=0; A6=0; A7=0;

    B0=0; B1=0; B2=0; B3=0;
    B4=0; B5=0; B6=0; B7=0;

    op2=0;
    op1=0;
    op0=0;

    #100;


    // Test 1: AND
    // A = 00001111
    // B = 00110011
    // Result = 00000011

    A0=1; A1=1; A2=1; A3=1;
    A4=0; A5=0; A6=0; A7=0;

    B0=1; B1=1; B2=0; B3=0;
    B4=1; B5=1; B6=0; B7=0;

    op2=0;
    op1=0;
    op0=0;

    #100;


    // Test 2: OR
    // A = 00001111
    // B = 00110011
    // Result = 00111111

    op2=0;
    op1=0;
    op0=1;

    #100;


    // Test 3: XOR
    // A = 00001111
    // B = 00110011
    // Result = 00111100

    op2=0;
    op1=1;
    op0=0;

    #100;


    // Test 4: NOT
    // A = 00001111
    // Result = 11110000

    op2=0;
    op1=1;
    op0=1;

    #100;


    // Test 5: ADD
    // A = 11111111
    // B = 00000001
    // Result = 00000000
    // Cout = 1
    // Zero = 1

    A0=1; A1=1; A2=1; A3=1;
    A4=1; A5=1; A6=1; A7=1;

    B0=1; B1=0; B2=0; B3=0;
    B4=0; B5=0; B6=0; B7=0;

    op2=1;
    op1=0;
    op0=0;

    #100;


    // Test 6: SUBTRACT
    // A = 00000000
    // B = 00000001
    // Result = 11111111
    // Cout = 1 (Borrow)
    // Zero = 0

    A0=0; A1=0; A2=0; A3=0;
    A4=0; A5=0; A6=0; A7=0;

    B0=1; B1=0; B2=0; B3=0;
    B4=0; B5=0; B6=0; B7=0;

    op2=1;
    op1=0;
    op0=1;

    #100;


    $finish;

end

endmodule
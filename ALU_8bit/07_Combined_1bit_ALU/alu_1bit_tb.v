`timescale 1ns / 1ps

module alu_1bit_tb;

    // Inputs
    reg A;
    reg B;
    reg Cin;
    reg op2;
    reg op1;
    reg op0;

    // Outputs
    wire Result;
    wire Cout;

    // Unit Under Test
    alu_1bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .op2(op2),
        .op1(op1),
        .op0(op0),
        .Result(Result),
        .Cout(Cout)
    );

    initial begin

        // Initial values
        A = 0;
        B = 0;
        Cin = 0;
        op2 = 0;
        op1 = 0;
        op0 = 0;

        #100;


        // Test 1: AND
        // opcode = 000
        // 1 AND 1 = 1
        A = 1;
        B = 1;
        Cin = 0;
        op2 = 0;
        op1 = 0;
        op0 = 0;
        #100;


        // Test 2: OR
        // opcode = 001
        // 0 OR 1 = 1
        A = 0;
        B = 1;
        Cin = 0;
        op2 = 0;
        op1 = 0;
        op0 = 1;
        #100;


        // Test 3: XOR
        // opcode = 010
        // 1 XOR 0 = 1
        A = 1;
        B = 0;
        Cin = 0;
        op2 = 0;
        op1 = 1;
        op0 = 0;
        #100;


        // Test 4: NOT
        // opcode = 011
        // NOT 0 = 1
        A = 0;
        B = 0;
        Cin = 0;
        op2 = 0;
        op1 = 1;
        op0 = 1;
        #100;


        // Test 5: ADD
        // opcode = 100
        // 1 + 1 + 0 = 10
        // Result = 0, Cout = 1
        A = 1;
        B = 1;
        Cin = 0;
        op2 = 1;
        op1 = 0;
        op0 = 0;
        #100;


        // Test 6: SUBTRACT
        // opcode = 101
        // 0 - 1 - 0
        // Diff = 1, Borrow = 1
        // Therefore Result = 1, Cout = 1
        A = 0;
        B = 1;
        Cin = 0;
        op2 = 1;
        op1 = 0;
        op0 = 1;
        #100;




        $finish;

    end

endmodule
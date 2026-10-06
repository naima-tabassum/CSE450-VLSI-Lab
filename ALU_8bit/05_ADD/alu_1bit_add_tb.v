`timescale 1ns / 1ps

module alu_1bit_add_tb;

    // Inputs
    reg A;
    reg B;
    reg Cin;

    // Outputs
    wire Sum;
    wire Cout;

    // Unit Under Test
    alu_1bit_add uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin

        // Test 1
        A = 0; B = 0; Cin = 0;
        #100;

        // Test 2
        A = 0; B = 0; Cin = 1;
        #100;

        // Test 3
        A = 0; B = 1; Cin = 0;
        #100;

        // Test 4
        A = 0; B = 1; Cin = 1;
        #100;

        // Test 5
        A = 1; B = 0; Cin = 0;
        #100;

        // Test 6
        A = 1; B = 0; Cin = 1;
        #100;

        // Test 7
        A = 1; B = 1; Cin = 0;
        #100;

        // Test 8
        A = 1; B = 1; Cin = 1;
        #100;

        $finish;

    end

endmodule
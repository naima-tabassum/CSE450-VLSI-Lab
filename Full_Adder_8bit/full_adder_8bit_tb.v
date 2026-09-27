`timescale 1ns / 1ps

module full_adder_8bit_tb;

    // Inputs
    reg a0;
    reg a1;
    reg a2;
    reg a3;
    reg a4;
    reg a5;
    reg a6;
    reg a7;

    reg b0;
    reg b1;
    reg b2;
    reg b3;
    reg b4;
    reg b5;
    reg b6;
    reg b7;

    reg cin;

    // Outputs
    wire sum0;
    wire sum1;
    wire sum2;
    wire sum3;
    wire sum4;
    wire sum5;
    wire sum6;
    wire sum7;

    wire carry;

    // Unit Under Test
    full_adder_8bit uut (
        .a0(a0),
        .a1(a1),
        .a2(a2),
        .a3(a3),
        .a4(a4),
        .a5(a5),
        .a6(a6),
        .a7(a7),

        .b0(b0),
        .b1(b1),
        .b2(b2),
        .b3(b3),
        .b4(b4),
        .b5(b5),
        .b6(b6),
        .b7(b7),

        .cin(cin),

        .sum0(sum0),
        .sum1(sum1),
        .sum2(sum2),
        .sum3(sum3),
        .sum4(sum4),
        .sum5(sum5),
        .sum6(sum6),
        .sum7(sum7),

        .carry(carry)
    );

    initial begin

        // Test 1: 0 + 0 + 0 = 0
        a0=0; a1=0; a2=0; a3=0;
        a4=0; a5=0; a6=0; a7=0;

        b0=0; b1=0; b2=0; b3=0;
        b4=0; b5=0; b6=0; b7=0;

        cin=0;
        #100;


        // Test 2: 0 + 0 + Cin(1) = 1
        cin=1;
        #100;


        // Test 3: 1 + 1 = 2
        cin=0;

        a0=1; a1=0; a2=0; a3=0;
        a4=0; a5=0; a6=0; a7=0;

        b0=1; b1=0; b2=0; b3=0;
        b4=0; b5=0; b6=0; b7=0;

        #100;


        // Test 4: 5 + 3 = 8
        a0=1; a1=0; a2=1; a3=0;
        a4=0; a5=0; a6=0; a7=0;

        b0=1; b1=1; b2=0; b3=0;
        b4=0; b5=0; b6=0; b7=0;

        #100;


        // Test 5: 15 + 1 = 16
        a0=1; a1=1; a2=1; a3=1;
        a4=0; a5=0; a6=0; a7=0;

        b0=1; b1=0; b2=0; b3=0;
        b4=0; b5=0; b6=0; b7=0;

        #100;


        // Test 6: 127 + 1 = 128
        a0=1; a1=1; a2=1; a3=1;
        a4=1; a5=1; a6=1; a7=0;

        b0=1; b1=0; b2=0; b3=0;
        b4=0; b5=0; b6=0; b7=0;

        #100;


        // Test 7: 255 + 1 = 256
        // Expected: sum = 0, carry = 1
        a0=1; a1=1; a2=1; a3=1;
        a4=1; a5=1; a6=1; a7=1;

        b0=1; b1=0; b2=0; b3=0;
        b4=0; b5=0; b6=0; b7=0;

        #100;

        $finish;

    end

endmodule
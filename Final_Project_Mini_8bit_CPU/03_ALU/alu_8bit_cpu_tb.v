`timescale 1ns / 1ps

module alu_8bit_cpu_tb;

reg ACC0;
reg ACC1;
reg ACC2;
reg ACC3;
reg ACC4;
reg ACC5;
reg ACC6;
reg ACC7;

reg OPERAND0;
reg OPERAND1;
reg OPERAND2;
reg OPERAND3;
reg OPERAND4;
reg OPERAND5;
reg OPERAND6;
reg OPERAND7;

reg SEL0;
reg SEL1;

wire RESULT0;
wire RESULT1;
wire RESULT2;
wire RESULT3;
wire RESULT4;
wire RESULT5;
wire RESULT6;
wire RESULT7;


alu_8bit_cpu uut (

    .ACC0(ACC0),
    .ACC1(ACC1),
    .ACC2(ACC2),
    .ACC3(ACC3),
    .ACC4(ACC4),
    .ACC5(ACC5),
    .ACC6(ACC6),
    .ACC7(ACC7),

    .OPERAND0(OPERAND0),
    .OPERAND1(OPERAND1),
    .OPERAND2(OPERAND2),
    .OPERAND3(OPERAND3),
    .OPERAND4(OPERAND4),
    .OPERAND5(OPERAND5),
    .OPERAND6(OPERAND6),
    .OPERAND7(OPERAND7),

    .SEL0(SEL0),
    .SEL1(SEL1),

    .RESULT0(RESULT0),
    .RESULT1(RESULT1),
    .RESULT2(RESULT2),
    .RESULT3(RESULT3),
    .RESULT4(RESULT4),
    .RESULT5(RESULT5),
    .RESULT6(RESULT6),
    .RESULT7(RESULT7)
);


initial begin

    // Initial
    ACC0=0; ACC1=0; ACC2=0; ACC3=0;
    ACC4=0; ACC5=0; ACC6=0; ACC7=0;

    OPERAND0=0; OPERAND1=0; OPERAND2=0; OPERAND3=0;
    OPERAND4=0; OPERAND5=0; OPERAND6=0; OPERAND7=0;

    SEL0=0;
    SEL1=0;


    // ----------------
    // Test 1: LDI 0x64
    // Result = 01100100
    // ----------------

    OPERAND7=0;
    OPERAND6=1;
    OPERAND5=1;
    OPERAND4=0;
    OPERAND3=0;
    OPERAND2=1;
    OPERAND1=0;
    OPERAND0=0;

    SEL1=0;
    SEL0=0;

    #10;


    // ----------------
    // Test 2: SUB
    // 0x64 - 0x14 = 0x50
    // ----------------

    ACC7=0;
    ACC6=1;
    ACC5=1;
    ACC4=0;
    ACC3=0;
    ACC2=1;
    ACC1=0;
    ACC0=0;

    OPERAND7=0;
    OPERAND6=0;
    OPERAND5=0;
    OPERAND4=1;
    OPERAND3=0;
    OPERAND2=1;
    OPERAND1=0;
    OPERAND0=0;

    SEL1=1;
    SEL0=0;

    #10;


    // ----------------
    // Test 3: ADD
    // 0x50 + 0x0A = 0x5A
    // ----------------

    ACC7=0;
    ACC6=1;
    ACC5=0;
    ACC4=1;
    ACC3=0;
    ACC2=0;
    ACC1=0;
    ACC0=0;

    OPERAND7=0;
    OPERAND6=0;
    OPERAND5=0;
    OPERAND4=0;
    OPERAND3=1;
    OPERAND2=0;
    OPERAND1=1;
    OPERAND0=0;

    SEL1=0;
    SEL0=1;

    #10;


    // ----------------
    // Test 4: SUB
    // 0x5A - 0x5A = 0x00
    // ----------------

    ACC7=0;
    ACC6=1;
    ACC5=0;
    ACC4=1;
    ACC3=1;
    ACC2=0;
    ACC1=1;
    ACC0=0;

    OPERAND7=0;
    OPERAND6=1;
    OPERAND5=0;
    OPERAND4=1;
    OPERAND3=1;
    OPERAND2=0;
    OPERAND1=1;
    OPERAND0=0;

    SEL1=1;
    SEL0=0;

    #10;


    // ----------------
    // Test 5: SUB
    // 0x5A - 0x60 = 0xFA
    // ----------------

    OPERAND7=0;
    OPERAND6=1;
    OPERAND5=1;
    OPERAND4=0;
    OPERAND3=0;
    OPERAND2=0;
    OPERAND1=0;
    OPERAND0=0;

    #10;

    $finish;

end

endmodule
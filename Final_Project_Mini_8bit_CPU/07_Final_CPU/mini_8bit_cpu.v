`timescale 1ns / 1ps

module mini_8bit_cpu(
    input CLK,
    input RESET,

    output Q0,
    output Q1,
    output Q2,
    output Q3,
    output Q4,
    output Q5,
    output Q6,
    output Q7,

    output Z,

    output PC0,
    output PC1,
    output PC2,
    output PC3
);


// --------------------
// ROM wires
// --------------------

wire OP0;
wire OP1;
wire OP2;
wire OP3;

wire OPERAND0;
wire OPERAND1;
wire OPERAND2;
wire OPERAND3;
wire OPERAND4;
wire OPERAND5;
wire OPERAND6;
wire OPERAND7;


// --------------------
// Control wires
// --------------------

wire SEL0;
wire SEL1;

wire LOAD_ACC;
wire LOAD_R;
wire SELECT_R;
wire PC_ENABLE;


// --------------------
// ALU result wires
// --------------------

wire ALU0;
wire ALU1;
wire ALU2;
wire ALU3;
wire ALU4;
wire ALU5;
wire ALU6;
wire ALU7;


// --------------------
// ACC wires
// --------------------

wire ACC0;
wire ACC1;
wire ACC2;
wire ACC3;
wire ACC4;
wire ACC5;
wire ACC6;
wire ACC7;


// --------------------
// R register wires
// --------------------

wire R0;
wire R1;
wire R2;
wire R3;
wire R4;
wire R5;
wire R6;
wire R7;


// ====================================================
// 1. PROGRAM COUNTER
// ====================================================

pc_4bit PC (
    .CLK(CLK),
    .RESET(RESET),
    .PC_ENABLE(PC_ENABLE),

    .PC0(PC0),
    .PC1(PC1),
    .PC2(PC2),
    .PC3(PC3)
);


// ====================================================
// 2. PROGRAM ROM
// ====================================================

program_rom ROM (
    .PC0(PC0),
    .PC1(PC1),
    .PC2(PC2),
    .PC3(PC3),

    .OP0(OP0),
    .OP1(OP1),
    .OP2(OP2),
    .OP3(OP3),

    .OPERAND0(OPERAND0),
    .OPERAND1(OPERAND1),
    .OPERAND2(OPERAND2),
    .OPERAND3(OPERAND3),
    .OPERAND4(OPERAND4),
    .OPERAND5(OPERAND5),
    .OPERAND6(OPERAND6),
    .OPERAND7(OPERAND7)
);


// ====================================================
// 3. CONTROL UNIT
// ====================================================

control_unit CONTROL (
    .OP0(OP0),
    .OP1(OP1),
    .OP2(OP2),
    .OP3(OP3),

    .SEL0(SEL0),
    .SEL1(SEL1),

    .LOAD_ACC(LOAD_ACC),
    .LOAD_R(LOAD_R),
    .SELECT_R(SELECT_R),
    .PC_ENABLE(PC_ENABLE)
);


// ====================================================
// 4. ALU
// ====================================================

alu_8bit_cpu ALU (
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

    .RESULT0(ALU0),
    .RESULT1(ALU1),
    .RESULT2(ALU2),
    .RESULT3(ALU3),
    .RESULT4(ALU4),
    .RESULT5(ALU5),
    .RESULT6(ALU6),
    .RESULT7(ALU7)
);


// ====================================================
// 5. R REGISTER
// ====================================================

r_register_8bit R_REGISTER (
    .CLK(CLK),
    .RESET(RESET),
    .LOAD_R(LOAD_R),

    .ACC0(ACC0),
    .ACC1(ACC1),
    .ACC2(ACC2),
    .ACC3(ACC3),
    .ACC4(ACC4),
    .ACC5(ACC5),
    .ACC6(ACC6),
    .ACC7(ACC7),

    .R0(R0),
    .R1(R1),
    .R2(R2),
    .R3(R3),
    .R4(R4),
    .R5(R5),
    .R6(R6),
    .R7(R7)
);


// ====================================================
// 6. ACC + Z REGISTER
// ====================================================

acc_z_register ACC_REGISTER (
    .CLK(CLK),
    .RESET(RESET),
    .LOAD_ACC(LOAD_ACC),
    .SELECT_R(SELECT_R),

    .ALU0(ALU0),
    .ALU1(ALU1),
    .ALU2(ALU2),
    .ALU3(ALU3),
    .ALU4(ALU4),
    .ALU5(ALU5),
    .ALU6(ALU6),
    .ALU7(ALU7),

    .R0(R0),
    .R1(R1),
    .R2(R2),
    .R3(R3),
    .R4(R4),
    .R5(R5),
    .R6(R6),
    .R7(R7),

    .ACC0(ACC0),
    .ACC1(ACC1),
    .ACC2(ACC2),
    .ACC3(ACC3),
    .ACC4(ACC4),
    .ACC5(ACC5),
    .ACC6(ACC6),
    .ACC7(ACC7),

    .Z(Z)
);


// ====================================================
// CPU OUTPUT Q = ACC
// ====================================================

assign Q0 = ACC0;
assign Q1 = ACC1;
assign Q2 = ACC2;
assign Q3 = ACC3;
assign Q4 = ACC4;
assign Q5 = ACC5;
assign Q6 = ACC6;
assign Q7 = ACC7;


endmodule
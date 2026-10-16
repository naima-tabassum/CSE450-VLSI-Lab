`timescale 1ns / 1ps

module acc_z_register_tb;

reg CLK;
reg RESET;
reg LOAD_ACC;
reg SELECT_R;

reg ALU0;
reg ALU1;
reg ALU2;
reg ALU3;
reg ALU4;
reg ALU5;
reg ALU6;
reg ALU7;

reg R0;
reg R1;
reg R2;
reg R3;
reg R4;
reg R5;
reg R6;
reg R7;

wire ACC0;
wire ACC1;
wire ACC2;
wire ACC3;
wire ACC4;
wire ACC5;
wire ACC6;
wire ACC7;

wire Z;


acc_z_register uut (
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


always #5 CLK = ~CLK;


initial begin

    CLK = 0;
    RESET = 1;
    LOAD_ACC = 0;
    SELECT_R = 0;

    ALU0=0; ALU1=0; ALU2=0; ALU3=0;
    ALU4=0; ALU5=0; ALU6=0; ALU7=0;

    R0=0; R1=0; R2=0; R3=0;
    R4=0; R5=0; R6=0; R7=0;


    // Reset
    #10;


    // LDI 0x64
    // ACC = 01100100
    RESET = 0;
    LOAD_ACC = 1;
    SELECT_R = 0;

    ALU7=0; ALU6=1; ALU5=1; ALU4=0;
    ALU3=0; ALU2=1; ALU1=0; ALU0=0;

    #10;


    // STA
    // ACC must remain 0x64
    LOAD_ACC = 0;
    #10;


    // SUB -> 0x50
    LOAD_ACC = 1;

    ALU7=0; ALU6=1; ALU5=0; ALU4=1;
    ALU3=0; ALU2=0; ALU1=0; ALU0=0;

    #10;


    // ADD -> 0x5A
    ALU7=0; ALU6=1; ALU5=0; ALU4=1;
    ALU3=1; ALU2=0; ALU1=1; ALU0=0;

    #10;


    // STA
    // ACC remains 0x5A
    LOAD_ACC = 0;
    #10;


    // SUB -> 0x00
    // Z must become 1
    LOAD_ACC = 1;
    SELECT_R = 0;

    ALU7=0; ALU6=0; ALU5=0; ALU4=0;
    ALU3=0; ALU2=0; ALU1=0; ALU0=0;

    #10;


    // LDR
    // R = 0x5A -> ACC = 0x5A
    // Z becomes 0
    SELECT_R = 1;

    R7=0; R6=1; R5=0; R4=1;
    R3=1; R2=0; R1=1; R0=0;

    #10;


    // SUB -> 0xFA
    SELECT_R = 0;

    ALU7=1; ALU6=1; ALU5=1; ALU4=1;
    ALU3=1; ALU2=0; ALU1=1; ALU0=0;

    #10;


    $finish;

end

endmodule
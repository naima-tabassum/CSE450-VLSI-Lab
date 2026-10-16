`timescale 1ns / 1ps

module control_unit_tb;

reg OP0;
reg OP1;
reg OP2;
reg OP3;

wire SEL0;
wire SEL1;
wire LOAD_ACC;
wire LOAD_R;
wire SELECT_R;
wire PC_ENABLE;


control_unit uut (
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


initial begin

    // NOP = 0000
    OP3=0; OP2=0; OP1=0; OP0=0;
    #10;


    // LDI = 0001
    OP3=0; OP2=0; OP1=0; OP0=1;
    #10;


    // ADD = 0010
    OP3=0; OP2=0; OP1=1; OP0=0;
    #10;


    // SUB = 0011
    OP3=0; OP2=0; OP1=1; OP0=1;
    #10;


    // STA = 1010
    OP3=1; OP2=0; OP1=1; OP0=0;
    #10;


    // LDR = 1011
    OP3=1; OP2=0; OP1=1; OP0=1;
    #10;


    // Unsupported opcode
    // Example = 0100
    OP3=0; OP2=1; OP1=0; OP0=0;
    #10;


    $finish;

end

endmodule
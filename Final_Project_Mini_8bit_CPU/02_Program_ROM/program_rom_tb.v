`timescale 1ns / 1ps

module program_rom_tb;

reg PC0;
reg PC1;
reg PC2;
reg PC3;

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


program_rom uut (
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


initial begin

    // Address 0
    PC3=0; PC2=0; PC1=0; PC0=0;
    #10;

    // Address 1
    PC3=0; PC2=0; PC1=0; PC0=1;
    #10;

    // Address 2
    PC3=0; PC2=0; PC1=1; PC0=0;
    #10;

    // Address 3
    PC3=0; PC2=0; PC1=1; PC0=1;
    #10;

    // Address 4
    PC3=0; PC2=1; PC1=0; PC0=0;
    #10;

    // Address 5
    PC3=0; PC2=1; PC1=0; PC0=1;
    #10;

    // Address 6
    PC3=0; PC2=1; PC1=1; PC0=0;
    #10;

    // Address 7
    PC3=0; PC2=1; PC1=1; PC0=1;
    #10;

    // Address 8 = unused = NOP
    PC3=1; PC2=0; PC1=0; PC0=0;
    #10;

    $finish;

end

endmodule
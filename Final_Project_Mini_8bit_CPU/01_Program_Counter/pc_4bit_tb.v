`timescale 1ns / 1ps

module pc_4bit_tb;

reg CLK;
reg RESET;
reg PC_ENABLE;

wire PC0;
wire PC1;
wire PC2;
wire PC3;

pc_4bit uut (
    .CLK(CLK),
    .RESET(RESET),
    .PC_ENABLE(PC_ENABLE),
    .PC0(PC0),
    .PC1(PC1),
    .PC2(PC2),
    .PC3(PC3)
);

always #5 CLK = ~CLK;

initial begin

    CLK = 0;
    RESET = 1;
    PC_ENABLE = 1;

    // Reset
    #10;

    // Count normally
    RESET = 0;
    #50;

    // Hold PC
    PC_ENABLE = 0;
    #20;

    // Count again
    PC_ENABLE = 1;
    #30;

    $finish;

end

endmodule
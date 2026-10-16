`timescale 1ns / 1ps

module mini_8bit_cpu_tb;

reg CLK;
reg RESET;

wire Q0;
wire Q1;
wire Q2;
wire Q3;
wire Q4;
wire Q5;
wire Q6;
wire Q7;

wire Z;

wire PC0;
wire PC1;
wire PC2;
wire PC3;


mini_8bit_cpu uut (
    .CLK(CLK),
    .RESET(RESET),

    .Q0(Q0),
    .Q1(Q1),
    .Q2(Q2),
    .Q3(Q3),
    .Q4(Q4),
    .Q5(Q5),
    .Q6(Q6),
    .Q7(Q7),

    .Z(Z),

    .PC0(PC0),
    .PC1(PC1),
    .PC2(PC2),
    .PC3(PC3)
);


// Clock
always #5 CLK = ~CLK;


initial begin

    CLK = 0;
    RESET = 1;

    // RESET for one rising edge
    #10;

    RESET = 0;

    // Run all 8 instructions
    #80;

    $finish;

end

endmodule
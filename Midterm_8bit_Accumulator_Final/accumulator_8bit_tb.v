`timescale 1ns / 1ps

module accumulator_8bit_tb;

reg [7:0] A;
reg [7:0] B;
reg CLK;
reg RESET;

wire [7:0] Q;


// Unit under test
accumulator_8bit uut (
    .A(A),
    .B(B),
    .CLK(CLK),
    .RESET(RESET),
    .Q(Q)
);


// Clock
always #5 CLK = ~CLK;


initial begin

    // Initial condition and reset
    CLK = 0;
    RESET = 1;
    A = 8'b00000000;
    B = 8'b00000000;
    #10;

    // 3 + 5 = 8
    RESET = 0;
    A = 8'b00000011;
    B = 8'b00000101;
    #10;

    // 2 + 1 = 3
    A = 8'b00000010;
    B = 8'b00000001;
    #10;

    // 255 + 1 = 0 (8-bit overflow)
    A = 8'b11111111;
    B = 8'b00000001;
    #10;

    // 170 + 5 = 175
    A = 8'b10101010;
    B = 8'b00000101;
    #10;

    $finish;

end

endmodule
`timescale 1ns / 1ps

module alu_8bit_cpu(
    input ACC0,
    input ACC1,
    input ACC2,
    input ACC3,
    input ACC4,
    input ACC5,
    input ACC6,
    input ACC7,

    input OPERAND0,
    input OPERAND1,
    input OPERAND2,
    input OPERAND3,
    input OPERAND4,
    input OPERAND5,
    input OPERAND6,
    input OPERAND7,

    input SEL0,
    input SEL1,

    output reg RESULT0,
    output reg RESULT1,
    output reg RESULT2,
    output reg RESULT3,
    output reg RESULT4,
    output reg RESULT5,
    output reg RESULT6,
    output reg RESULT7
);


// ADD wires
wire ADD0;
wire ADD1;
wire ADD2;
wire ADD3;
wire ADD4;
wire ADD5;
wire ADD6;
wire ADD7;

wire C1;
wire C2;
wire C3;
wire C4;
wire C5;
wire C6;
wire C7;


// SUBTRACT wires
wire SUB0;
wire SUB1;
wire SUB2;
wire SUB3;
wire SUB4;
wire SUB5;
wire SUB6;
wire SUB7;

wire B1;
wire B2;
wire B3;
wire B4;
wire B5;
wire B6;
wire B7;


// --------------------
// ADD
// --------------------

assign ADD0 = ACC0 ^ OPERAND0;
assign C1 = ACC0 & OPERAND0;

assign ADD1 = ACC1 ^ OPERAND1 ^ C1;
assign C2 = (ACC1 & OPERAND1) |
            (ACC1 & C1) |
            (OPERAND1 & C1);

assign ADD2 = ACC2 ^ OPERAND2 ^ C2;
assign C3 = (ACC2 & OPERAND2) |
            (ACC2 & C2) |
            (OPERAND2 & C2);

assign ADD3 = ACC3 ^ OPERAND3 ^ C3;
assign C4 = (ACC3 & OPERAND3) |
            (ACC3 & C3) |
            (OPERAND3 & C3);

assign ADD4 = ACC4 ^ OPERAND4 ^ C4;
assign C5 = (ACC4 & OPERAND4) |
            (ACC4 & C4) |
            (OPERAND4 & C4);

assign ADD5 = ACC5 ^ OPERAND5 ^ C5;
assign C6 = (ACC5 & OPERAND5) |
            (ACC5 & C5) |
            (OPERAND5 & C5);

assign ADD6 = ACC6 ^ OPERAND6 ^ C6;
assign C7 = (ACC6 & OPERAND6) |
            (ACC6 & C6) |
            (OPERAND6 & C6);

assign ADD7 = ACC7 ^ OPERAND7 ^ C7;


// --------------------
// SUBTRACT
// --------------------

assign SUB0 = ACC0 ^ OPERAND0;
assign B1 = (~ACC0) & OPERAND0;

assign SUB1 = ACC1 ^ OPERAND1 ^ B1;
assign B2 = ((~ACC1) & OPERAND1) |
            ((~ACC1) & B1) |
            (OPERAND1 & B1);

assign SUB2 = ACC2 ^ OPERAND2 ^ B2;
assign B3 = ((~ACC2) & OPERAND2) |
            ((~ACC2) & B2) |
            (OPERAND2 & B2);

assign SUB3 = ACC3 ^ OPERAND3 ^ B3;
assign B4 = ((~ACC3) & OPERAND3) |
            ((~ACC3) & B3) |
            (OPERAND3 & B3);

assign SUB4 = ACC4 ^ OPERAND4 ^ B4;
assign B5 = ((~ACC4) & OPERAND4) |
            ((~ACC4) & B4) |
            (OPERAND4 & B4);

assign SUB5 = ACC5 ^ OPERAND5 ^ B5;
assign B6 = ((~ACC5) & OPERAND5) |
            ((~ACC5) & B5) |
            (OPERAND5 & B5);

assign SUB6 = ACC6 ^ OPERAND6 ^ B6;
assign B7 = ((~ACC6) & OPERAND6) |
            ((~ACC6) & B6) |
            (OPERAND6 & B6);

assign SUB7 = ACC7 ^ OPERAND7 ^ B7;


// --------------------
// Select operation
// --------------------

always @(*)
begin

    RESULT0 = 0;
    RESULT1 = 0;
    RESULT2 = 0;
    RESULT3 = 0;
    RESULT4 = 0;
    RESULT5 = 0;
    RESULT6 = 0;
    RESULT7 = 0;


    // SEL1 SEL0 = 00
    // LDI
    if ((SEL1 == 0) && (SEL0 == 0))
    begin
        RESULT0 = OPERAND0;
        RESULT1 = OPERAND1;
        RESULT2 = OPERAND2;
        RESULT3 = OPERAND3;
        RESULT4 = OPERAND4;
        RESULT5 = OPERAND5;
        RESULT6 = OPERAND6;
        RESULT7 = OPERAND7;
    end


    // SEL1 SEL0 = 01
    // ADD
    else if ((SEL1 == 0) && (SEL0 == 1))
    begin
        RESULT0 = ADD0;
        RESULT1 = ADD1;
        RESULT2 = ADD2;
        RESULT3 = ADD3;
        RESULT4 = ADD4;
        RESULT5 = ADD5;
        RESULT6 = ADD6;
        RESULT7 = ADD7;
    end


    // SEL1 SEL0 = 10
    // SUB
    else if ((SEL1 == 1) && (SEL0 == 0))
    begin
        RESULT0 = SUB0;
        RESULT1 = SUB1;
        RESULT2 = SUB2;
        RESULT3 = SUB3;
        RESULT4 = SUB4;
        RESULT5 = SUB5;
        RESULT6 = SUB6;
        RESULT7 = SUB7;
    end

end

endmodule
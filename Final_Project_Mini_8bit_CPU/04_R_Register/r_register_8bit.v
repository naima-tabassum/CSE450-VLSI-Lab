`timescale 1ns / 1ps

module r_register_8bit(
    input CLK,
    input RESET,
    input LOAD_R,

    input ACC0,
    input ACC1,
    input ACC2,
    input ACC3,
    input ACC4,
    input ACC5,
    input ACC6,
    input ACC7,

    output reg R0,
    output reg R1,
    output reg R2,
    output reg R3,
    output reg R4,
    output reg R5,
    output reg R6,
    output reg R7
);

always @(posedge CLK)
begin

    if (RESET)
    begin
        R0 <= 0;
        R1 <= 0;
        R2 <= 0;
        R3 <= 0;
        R4 <= 0;
        R5 <= 0;
        R6 <= 0;
        R7 <= 0;
    end

    else if (LOAD_R)
    begin
        R0 <= ACC0;
        R1 <= ACC1;
        R2 <= ACC2;
        R3 <= ACC3;
        R4 <= ACC4;
        R5 <= ACC5;
        R6 <= ACC6;
        R7 <= ACC7;
    end

end

endmodule
`timescale 1ns / 1ps

module pc_4bit(
    input CLK,
    input RESET,
    input PC_ENABLE,

    output reg PC0,
    output reg PC1,
    output reg PC2,
    output reg PC3
);

always @(posedge CLK)
begin

    if (RESET)
    begin
        PC0 <= 0;
        PC1 <= 0;
        PC2 <= 0;
        PC3 <= 0;
    end

    else if (PC_ENABLE)
    begin
        PC0 <= ~PC0;
        PC1 <= PC1 ^ PC0;
        PC2 <= PC2 ^ (PC1 & PC0);
        PC3 <= PC3 ^ (PC2 & PC1 & PC0);
    end

end

endmodule
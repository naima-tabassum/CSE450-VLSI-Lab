`timescale 1ns / 1ps

module register_1bit(
    input D,
    input clk,
    output reg Q
);

always @(posedge clk)
begin
    Q <= D;
end

endmodule
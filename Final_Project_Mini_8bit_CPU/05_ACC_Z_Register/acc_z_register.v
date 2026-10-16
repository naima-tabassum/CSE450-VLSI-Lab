`timescale 1ns / 1ps

module acc_z_register(
    input CLK,
    input RESET,
    input LOAD_ACC,
    input SELECT_R,

    input ALU0,
    input ALU1,
    input ALU2,
    input ALU3,
    input ALU4,
    input ALU5,
    input ALU6,
    input ALU7,

    input R0,
    input R1,
    input R2,
    input R3,
    input R4,
    input R5,
    input R6,
    input R7,

    output reg ACC0,
    output reg ACC1,
    output reg ACC2,
    output reg ACC3,
    output reg ACC4,
    output reg ACC5,
    output reg ACC6,
    output reg ACC7,

    output reg Z
);

wire DATA0;
wire DATA1;
wire DATA2;
wire DATA3;
wire DATA4;
wire DATA5;
wire DATA6;
wire DATA7;


// SELECT_R = 0 -> ALU result
// SELECT_R = 1 -> R register
assign DATA0 = SELECT_R ? R0 : ALU0;
assign DATA1 = SELECT_R ? R1 : ALU1;
assign DATA2 = SELECT_R ? R2 : ALU2;
assign DATA3 = SELECT_R ? R3 : ALU3;
assign DATA4 = SELECT_R ? R4 : ALU4;
assign DATA5 = SELECT_R ? R5 : ALU5;
assign DATA6 = SELECT_R ? R6 : ALU6;
assign DATA7 = SELECT_R ? R7 : ALU7;


always @(posedge CLK)
begin

    if (RESET)
    begin
        ACC0 <= 0;
        ACC1 <= 0;
        ACC2 <= 0;
        ACC3 <= 0;
        ACC4 <= 0;
        ACC5 <= 0;
        ACC6 <= 0;
        ACC7 <= 0;

        Z <= 1;
    end

    else if (LOAD_ACC)
    begin
        ACC0 <= DATA0;
        ACC1 <= DATA1;
        ACC2 <= DATA2;
        ACC3 <= DATA3;
        ACC4 <= DATA4;
        ACC5 <= DATA5;
        ACC6 <= DATA6;
        ACC7 <= DATA7;

        if ((DATA0 == 0) &&
            (DATA1 == 0) &&
            (DATA2 == 0) &&
            (DATA3 == 0) &&
            (DATA4 == 0) &&
            (DATA5 == 0) &&
            (DATA6 == 0) &&
            (DATA7 == 0))
        begin
            Z <= 1;
        end

        else
        begin
            Z <= 0;
        end
    end

end

endmodule
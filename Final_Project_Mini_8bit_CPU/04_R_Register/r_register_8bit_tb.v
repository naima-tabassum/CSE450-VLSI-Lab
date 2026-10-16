`timescale 1ns / 1ps

module r_register_8bit_tb;

reg CLK;
reg RESET;
reg LOAD_R;

reg ACC0;
reg ACC1;
reg ACC2;
reg ACC3;
reg ACC4;
reg ACC5;
reg ACC6;
reg ACC7;

wire R0;
wire R1;
wire R2;
wire R3;
wire R4;
wire R5;
wire R6;
wire R7;


r_register_8bit uut (
    .CLK(CLK),
    .RESET(RESET),
    .LOAD_R(LOAD_R),

    .ACC0(ACC0),
    .ACC1(ACC1),
    .ACC2(ACC2),
    .ACC3(ACC3),
    .ACC4(ACC4),
    .ACC5(ACC5),
    .ACC6(ACC6),
    .ACC7(ACC7),

    .R0(R0),
    .R1(R1),
    .R2(R2),
    .R3(R3),
    .R4(R4),
    .R5(R5),
    .R6(R6),
    .R7(R7)
);


always #5 CLK = ~CLK;


initial begin

    CLK = 0;
    RESET = 1;
    LOAD_R = 0;

    ACC0=0; ACC1=0; ACC2=0; ACC3=0;
    ACC4=0; ACC5=0; ACC6=0; ACC7=0;

    // Reset
    #10;


    // LDI 0x64
    // R must remain 0x00
    RESET = 0;

    ACC7=0; ACC6=1; ACC5=1; ACC4=0;
    ACC3=0; ACC2=1; ACC1=0; ACC0=0;

    LOAD_R = 0;
    #10;


    // STA
    // R = 0x64
    LOAD_R = 1;
    #10;


    // SUB -> ACC = 0x50
    // R must remain 0x64
    LOAD_R = 0;

    ACC7=0; ACC6=1; ACC5=0; ACC4=1;
    ACC3=0; ACC2=0; ACC1=0; ACC0=0;

    #10;


    // ADD -> ACC = 0x5A
    // R still remains 0x64
    ACC7=0; ACC6=1; ACC5=0; ACC4=1;
    ACC3=1; ACC2=0; ACC1=1; ACC0=0;

    #10;


    // STA
    // R = 0x5A
    LOAD_R = 1;
    #10;


    // Remaining instructions
    // R must stay 0x5A
    LOAD_R = 0;
    #30;


    $finish;

end

endmodule
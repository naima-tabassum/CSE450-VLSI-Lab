`timescale 1ns / 1ps

module control_unit(
    input OP0,
    input OP1,
    input OP2,
    input OP3,

    output reg SEL0,
    output reg SEL1,

    output reg LOAD_ACC,
    output reg LOAD_R,
    output reg SELECT_R,
    output reg PC_ENABLE
);

always @(*)
begin

    // Default = NOP
    SEL0 = 0;
    SEL1 = 0;

    LOAD_ACC = 0;
    LOAD_R = 0;
    SELECT_R = 0;

    // For Set 8, PC goes to next instruction every cycle
    PC_ENABLE = 1;


    // --------------------
    // LDI
    // Opcode = 0001
    // --------------------
    if ((OP3==0) && (OP2==0) && (OP1==0) && (OP0==1))
    begin
        SEL1 = 0;
        SEL0 = 0;

        LOAD_ACC = 1;
        LOAD_R = 0;
        SELECT_R = 0;
    end


    // --------------------
    // ADD
    // Opcode = 0010
    // --------------------
    else if ((OP3==0) && (OP2==0) && (OP1==1) && (OP0==0))
    begin
        SEL1 = 0;
        SEL0 = 1;

        LOAD_ACC = 1;
        LOAD_R = 0;
        SELECT_R = 0;
    end


    // --------------------
    // SUB
    // Opcode = 0011
    // --------------------
    else if ((OP3==0) && (OP2==0) && (OP1==1) && (OP0==1))
    begin
        SEL1 = 1;
        SEL0 = 0;

        LOAD_ACC = 1;
        LOAD_R = 0;
        SELECT_R = 0;
    end


    // --------------------
    // STA
    // Opcode = 1010
    // R <- ACC
    // --------------------
    else if ((OP3==1) && (OP2==0) && (OP1==1) && (OP0==0))
    begin
        LOAD_ACC = 0;
        LOAD_R = 1;
        SELECT_R = 0;
    end


    // --------------------
    // LDR
    // Opcode = 1011
    // ACC <- R
    // --------------------
    else if ((OP3==1) && (OP2==0) && (OP1==1) && (OP0==1))
    begin
        LOAD_ACC = 1;
        LOAD_R = 0;
        SELECT_R = 1;
    end

end

endmodule
`timescale 1ns / 1ps

module program_rom(
    input PC0,
    input PC1,
    input PC2,
    input PC3,

    output reg OP0,
    output reg OP1,
    output reg OP2,
    output reg OP3,

    output reg OPERAND0,
    output reg OPERAND1,
    output reg OPERAND2,
    output reg OPERAND3,
    output reg OPERAND4,
    output reg OPERAND5,
    output reg OPERAND6,
    output reg OPERAND7
);

always @(*)
begin

    // Default = NOP
    OP0 = 0;
    OP1 = 0;
    OP2 = 0;
    OP3 = 0;

    OPERAND0 = 0;
    OPERAND1 = 0;
    OPERAND2 = 0;
    OPERAND3 = 0;
    OPERAND4 = 0;
    OPERAND5 = 0;
    OPERAND6 = 0;
    OPERAND7 = 0;


    // Address 0: LDI 0x64
    // Opcode = 0001
    // Operand = 01100100
    if ((PC3==0) && (PC2==0) && (PC1==0) && (PC0==0))
    begin
        OP3 = 0;
        OP2 = 0;
        OP1 = 0;
        OP0 = 1;

        OPERAND7 = 0;
        OPERAND6 = 1;
        OPERAND5 = 1;
        OPERAND4 = 0;
        OPERAND3 = 0;
        OPERAND2 = 1;
        OPERAND1 = 0;
        OPERAND0 = 0;
    end


    // Address 1: STA
    // Opcode = 1010
    else if ((PC3==0) && (PC2==0) && (PC1==0) && (PC0==1))
    begin
        OP3 = 1;
        OP2 = 0;
        OP1 = 1;
        OP0 = 0;
    end


    // Address 2: SUB 0x14
    // Opcode = 0011
    // Operand = 00010100
    else if ((PC3==0) && (PC2==0) && (PC1==1) && (PC0==0))
    begin
        OP3 = 0;
        OP2 = 0;
        OP1 = 1;
        OP0 = 1;

        OPERAND7 = 0;
        OPERAND6 = 0;
        OPERAND5 = 0;
        OPERAND4 = 1;
        OPERAND3 = 0;
        OPERAND2 = 1;
        OPERAND1 = 0;
        OPERAND0 = 0;
    end


    // Address 3: ADD 0x0A
    // Opcode = 0010
    // Operand = 00001010
    else if ((PC3==0) && (PC2==0) && (PC1==1) && (PC0==1))
    begin
        OP3 = 0;
        OP2 = 0;
        OP1 = 1;
        OP0 = 0;

        OPERAND7 = 0;
        OPERAND6 = 0;
        OPERAND5 = 0;
        OPERAND4 = 0;
        OPERAND3 = 1;
        OPERAND2 = 0;
        OPERAND1 = 1;
        OPERAND0 = 0;
    end


    // Address 4: STA
    // Opcode = 1010
    else if ((PC3==0) && (PC2==1) && (PC1==0) && (PC0==0))
    begin
        OP3 = 1;
        OP2 = 0;
        OP1 = 1;
        OP0 = 0;
    end


    // Address 5: SUB 0x5A
    // Opcode = 0011
    // Operand = 01011010
    else if ((PC3==0) && (PC2==1) && (PC1==0) && (PC0==1))
    begin
        OP3 = 0;
        OP2 = 0;
        OP1 = 1;
        OP0 = 1;

        OPERAND7 = 0;
        OPERAND6 = 1;
        OPERAND5 = 0;
        OPERAND4 = 1;
        OPERAND3 = 1;
        OPERAND2 = 0;
        OPERAND1 = 1;
        OPERAND0 = 0;
    end


    // Address 6: LDR
    // Opcode = 1011
    else if ((PC3==0) && (PC2==1) && (PC1==1) && (PC0==0))
    begin
        OP3 = 1;
        OP2 = 0;
        OP1 = 1;
        OP0 = 1;
    end


    // Address 7: SUB 0x60
    // Opcode = 0011
    // Operand = 01100000
    else if ((PC3==0) && (PC2==1) && (PC1==1) && (PC0==1))
    begin
        OP3 = 0;
        OP2 = 0;
        OP1 = 1;
        OP0 = 1;

        OPERAND7 = 0;
        OPERAND6 = 1;
        OPERAND5 = 1;
        OPERAND4 = 0;
        OPERAND3 = 0;
        OPERAND2 = 0;
        OPERAND1 = 0;
        OPERAND0 = 0;
    end

end

endmodule
`timescale 1ns / 1ps

module alu_control_unit_tb;

    
    reg clk;
    reg reset;
    reg [4:0] first_instruction_address;

    
    wire [7:0] ACC;
    wire [7:0] EXT;
    wire [4:0] PC;
    wire C_B;
    wire [7:0] curr_instruction;
    wire [7:0] registers [15:0];

    
    alu_control_unit uut (
        .clk(clk),
        .reset(reset),
        .first_instruction_address(first_instruction_address)
    );

    assign ACC = uut.ACC;
    assign EXT = uut.EXT;
    assign PC = uut.PC;
    assign C_B = uut.C_B;
    assign curr_instruction = uut.curr_instruction;
    
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    integer i;
    
    assign registers[0] = uut.regs.registers[0];
    assign registers[1] = uut.regs.registers[1];
    assign registers[2] = uut.regs.registers[2];
    assign registers[3] = uut.regs.registers[3];
    assign registers[4] = uut.regs.registers[4];
    assign registers[5] = uut.regs.registers[5];
    assign registers[6] = uut.regs.registers[6];
    assign registers[7] = uut.regs.registers[7];
    assign registers[8] = uut.regs.registers[8];
    assign registers[9] = uut.regs.registers[9];
    assign registers[10] = uut.regs.registers[10];
    assign registers[11] = uut.regs.registers[11];
    assign registers[12] = uut.regs.registers[12];
    assign registers[13] = uut.regs.registers[13];
    assign registers[14] = uut.regs.registers[14];
    assign registers[15] = uut.regs.registers[15];

    
    
    initial begin
        

        reset = 1;
        first_instruction_address = 5;

       
        
        for (i = 0; i < 16; i = i + 1)
        begin
            uut.regs.registers[i] = 2*(i + 1); 
            
        end

        

        // 0: INC ACC
        uut.instructions.registers[0] = 8'h06;
        
        // 1: DEC ACC
        uut.instructions.registers[1] = 8'h07;

        // 2: ADD Ri
        uut.instructions.registers[2] = 8'h14;

        // 3: SUB  Ri
        uut.instructions.registers[3] = 8'h22;
       
        // 4: RET
        uut.instructions.registers[4] = 8'hB8;
        
        // 5: ADD Ri
        uut.instructions.registers[5] = 8'h17;
        
        // 6: CMP Ri
        uut.instructions.registers[6] = 8'h7F;
        
        // 7: BR
        uut.instructions.registers[7] = 8'h80;

        // 8: LSL ACC
        uut.instructions.registers[8] = 8'h01;
        
        // 9: MUL Ri
        uut.instructions.registers[9] = 8'h3E;
        
        // 10: ASR ACC
        uut.instructions.registers[10] = 8'h05;
        
        // 11: LSR ACC
        uut.instructions.registers[11] = 8'h02;
        
        // 12: CIL ACC
        uut.instructions.registers[12] = 8'h04;

        // 13: CIL ACC 
        uut.instructions.registers[13] = 8'h04;
       
        // 14: CIR ACC 
        uut.instructions.registers[14] = 8'h03;
        
        // 15: AND Ri
        uut.instructions.registers[15] = 8'h5A;
        
        // 16: XRA Ri
        uut.instructions.registers[16] = 8'h6D;
        
        // 17: MOV Ri, ACC
        uut.instructions.registers[17] = 8'hA8;

        // 18: MOV ACC, Ri
        uut.instructions.registers[18] = 8'h97;

        // 19: NOP
        uut.instructions.registers[19] = 8'h00;

        // 20: HLT
        uut.instructions.registers[20] = 8'hFF;

       
        // Small reset pulse
        #5 reset = 0;
        #10 reset = 1;
        // Run long enough to complete all instructions
        #250;
        
        $finish;
    end
    
endmodule

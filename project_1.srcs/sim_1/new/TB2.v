
`timescale 1ns / 1ps

module TB2;

    reg clk;
    reg reset;
    reg [4:0] first_instruction_address;

    wire [7:0] ACC;
    wire [7:0] EXT;
    wire [4:0] PC;
    wire C_B;
    wire [7:0] curr_instruction;

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

    initial begin
        reset = 1;
        first_instruction_address = 0;

        //Initialize registers
        for (i = 0; i < 16; i = i + 1)
            uut.regs.registers[i] = 0;
        uut.regs.registers[0] = 10;
        uut.regs.registers[1] = 30;

       //IF-ELSE BLOCK
        
        //Load register 0 value into ACC
        uut.instructions.registers[0] = 8'h90;
        
	   //Basically we want to do if(ACC >= register): if block
	   //					 else: else block

        //Compare if ACC < register 1 Value. If yes, C_B = 1
        uut.instructions.registers[1] = 8'h71;

        //Condition check (C_B) = 1 and branch
        uut.instructions.registers[2] = 8'h85;
        
        //If C_B  != 1 (if block)
        
            //Set ACC to the value in register 1
            uut.instructions.registers[3] = 8'h91;
            
            //Moves beyond the else block (halt in this case)
            uut.instructions.registers[4] = 8'hB6;
        
        //If C_B == 1 (else block)
            
            //Decrement ACC 
            uut.instructions.registers[5] = 8'h07;
        
        //HALT
        uut.instructions.registers[6] = 8'hFF;

      
        #5 reset = 0;
        #10 reset = 1;

        
        #200;

        $finish;
    end

endmodule

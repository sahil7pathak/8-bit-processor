`timescale 1ns / 1ps
module InstructionMemory(clk, address, instruction);

	input clk;
	input [7:0] address;
	
	output reg [7:0] instruction;
	
	reg [7:0] memory [0:255];
	
	initial begin
		memory [0] = 8'b10001000; //sub
		memory [1] = 8'b01001000; //add
		memory [2] = 8'b01101100; //addi
		memory [3] = 8'b00001000; //lw
	    memory [4] = 8'b00101001; //sw
		//memory [5] = 8'b10100000; //jmp
	end
	
	always @( posedge clk) begin
		instruction = memory[address];
	end
	//assign instruction = memory[address];
	
endmodule

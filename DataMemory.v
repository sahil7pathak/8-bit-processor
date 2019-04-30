`timescale 1ns / 1ps
module DataMemory (clk, address, MemWrite, MemRead, WriteData, ReadData);

	input clk;
	input [7:0] address;
	input MemWrite, MemRead;
	input [7:0] WriteData; 
	
	output reg [7:0] ReadData;

	reg [7:0] memory[0:127];

	initial begin
		memory [0] = 5;
		memory [1] = 6;
		memory [2] = 7;
		memory [8] = 20;
		memory [12] = 10;
	end
	
	always @ (posedge clk) begin
		if (MemWrite == 1)
			memory[address] = WriteData;
	end
	
	always @(negedge clk) begin
		if (MemRead == 1)
			ReadData <= memory[address];
	end	
endmodule

`timescale 1ns / 1ps
module RegisterFile(clk, RegWrite, ReadRegister1, ReadRegister2, WriteData, ReadData1, ReadData2);

	input clk;
	input RegWrite;
	
	input [1:1] ReadRegister1, ReadRegister2;
	input [7:0] WriteData;
		
	output [7:0] ReadData1, ReadData2;
	
	reg [7:0] memory [0:1];
	initial begin
		memory[0] = 8'b00000010;
		memory[1] = 8'b00001000;
		
	end
	always @(posedge clk) begin
		if (RegWrite == 1)
			memory[ReadRegister1] = WriteData;
	end	
	assign ReadData1 = memory[ReadRegister1];
	assign ReadData2 = memory[ReadRegister2];
	
	
endmodule
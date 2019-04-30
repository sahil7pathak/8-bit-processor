`timescale 1ns / 1ps
module Mux2 (ReadData, Output, MemtoReg, WriteData);

	input [7:0] ReadData, Output;
	input MemtoReg;	
	
	output reg [7:0] WriteData;
	
	always @(ReadData, Output, MemtoReg) begin
		case (MemtoReg)
			0: WriteData = Output; 
			1: WriteData = ReadData;
		endcase
	end
endmodule

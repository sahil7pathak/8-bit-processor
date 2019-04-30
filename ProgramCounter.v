`timescale 1ns / 1ps
module ProgramCounter(clk, reset, PCin, PCout);

	input clk, reset;
	input [7:0] PCin;
	
	output reg [7:0] PCout;
	
	always @(posedge clk) begin
		if (reset == 1) 
			PCout = 0;
		else 
			PCout = PCin + 1; 
	end
endmodule

`timescale 1ns / 1ps
module Increment(PCout, PCin, address, e_extend, Jump);

	input [7:0] PCout;	
	output reg [7:0] PCin;
	
	input Jump;
	output reg [7:0] e_extend;
	input  [4:0] address;
	
	always @(address) begin
		e_extend[7:0] = address[4:0];
	end
	
	always @(*) begin
	   PCin = PCout;
	end
endmodule


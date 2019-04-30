`timescale 1ns / 1ps
module SignExtend (inst, s_extend);

	input [2:0] inst;
	output reg [7:0] s_extend;

	always @(inst) begin
		s_extend[7:0] = inst[2:0];
	end
endmodule

`timescale 1ns / 1ps
module ALU (opCode, A, B, Output);

	input [2:0] opCode;
	input [7:0] A,B;
	
	output reg [7:0] Output;
	
	always @(opCode, A, B) begin
		case (opCode)
			3'b010: Output = A + B;
			3'b100: Output = A - B;
			3'b000: Output = A + B;
			3'b001: Output = A + B;
			default: Output = A + B;
		endcase
	end
endmodule

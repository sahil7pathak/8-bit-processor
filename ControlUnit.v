`timescale 1ns / 1ps
module ControlUnit(
	input [7:5] opCode,
	output reg RegWrite, ALUSrc,
	output reg MemtoReg, MemRead, MemWrite, Jump,
	output reg [1:0] ALUOp);
	always @(*) begin
		case(opCode)
			3'b010: begin //add
				ALUSrc = 0;
				MemtoReg = 0;
				RegWrite = 1;
				MemRead = 0;
				MemWrite = 0;
				Jump = 0;
				ALUOp = 2'b10;;
			end
			3'b100: begin //sub
				ALUSrc = 0;
				MemtoReg = 0;
				RegWrite = 1;
				MemRead = 0;
				MemWrite = 0;
				Jump = 0;
				ALUOp = 2'b10;
			end
			3'b000: begin //lw
				ALUSrc = 1;
				MemtoReg = 1;
				RegWrite = 1;
				MemRead = 1;
				MemWrite = 0;
				Jump = 0;
				ALUOp = 2'b00;
			end
			3'b001: begin //sw
				ALUSrc = 1;
				MemtoReg = 0;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 1;
				Jump = 0;
				ALUOp = 2'b00;
			end
			3'b011: begin // addi  
                ALUSrc = 1;
				MemtoReg = 0;
				RegWrite = 1;
				MemRead = 0;
				MemWrite = 0;
				Jump = 0;
				ALUOp = 2'b11;
                end  
             3'b101: begin //jmp
				ALUSrc = 0;
				MemtoReg = 0;
				RegWrite = 0;
				MemRead = 0;
				MemWrite = 0;
				Jump = 1;
				ALUOp = 2'b00;;
			end  
              
		endcase
	end
endmodule

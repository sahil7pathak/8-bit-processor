`timescale 1ns / 1ps
module CPU(clk, reset, PCin, PCout, instruction, RegWrite, ALUSrc, MemtoReg, 
MemRead, MemWrite, ALUOp, ReadData1, ReadData2, s_extend, e_extend, res, Output,
ReadData, WriteData, Jump);
					
	input clk;
	input reset;
	
	output wire [7:0] PCin, PCout;
	ProgramCounter pc(
		//inputs
		.clk(clk),
		.reset(reset),
		.PCin(PCin),
		//outputs
		.PCout(PCout)	
	);

	output wire [7:0] instruction;
	InstructionMemory im(
		//inputs
		.clk(clk),
		.address(PCin),
		//outputs
		.instruction(instruction)	
	);
	
	output wire RegWrite, ALUSrc, MemtoReg, MemRead, MemWrite;
	output wire Jump;
	output wire [1:0] ALUOp;
	ControlUnit cu(
		//inputs
		.opCode(instruction[7:5]),
		//outputs
		.RegWrite(RegWrite),
		.ALUSrc(ALUSrc),
		.MemtoReg(MemtoReg),
		.MemRead(MemRead),
		.MemWrite(MemWrite),
		.Jump(Jump),
		.ALUOp(ALUOp)	
	);
	
	output wire [7:0] ReadData1, ReadData2;
	output wire [7:0] WriteData;
	RegisterFile rf(
		//inputs
		.clk(clk),
		.ReadRegister1(instruction[3:3]),
		.ReadRegister2(instruction[4:4]),
		.RegWrite(RegWrite),	
		.WriteData(WriteData),
		//outputs
		.ReadData1(ReadData1),
		.ReadData2(ReadData2)	
	);
	
	output wire [7:0] s_extend;
	SignExtend se(
		//inputs
		.inst(instruction[2:0]),
		//outputs
		.s_extend(s_extend)
	);
	
	output wire [7:0] res;
	Mux1 m1(
		//inputs
		.ALUSrc(ALUSrc),
		.ReadData2(ReadData2),
		.s_extend(s_extend),
		//outputs
		.res(res)	
	);
	
	output wire [7:0] Output;
	ALU alu(
		//inputs
		.A(ReadData1),
		.B(res),
		.opCode(instruction[7:5]),
		//outputs
		.Output(Output)
	);
	
	output wire [7:0] ReadData;
	DataMemory  dm(
		//inputs
		.clk(clk),
		.address(Output),
		.MemWrite(MemWrite),
		.MemRead(MemRead),
		.WriteData(ReadData2),
		//outputs
		.ReadData(ReadData)
	);

	Mux2 m2(
	//inputs
	.ReadData(ReadData),
	.Output(Output),
	.MemtoReg(MemtoReg),
	//outputs
	.WriteData(WriteData)
	);	

	output wire [7:0] e_extend;
	Increment inc(
	//inputs
	.PCout(PCout),
	.address(instruction[4:0]),
	.Jump(Jump),
	//outputs
	.PCin(PCin),
	.e_extend(e_extend)
	);
endmodule
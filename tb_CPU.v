`timescale 1ns / 1ps
 module tb_CPU(clk, reset);  
      // Inputs  
      input clk;  
      input reset;  
      // Outputs  
      wire [7:0] PCout;  
      wire [7:0] Output; 
      wire [7:0] ReadData1, ReadData2, ReadData;
      wire [7:0] instruction;
      wire [7:0] WriteData_Reg;
      wire [7:0] s_extend;
      //wire [7:0] e_extend;
      wire [7:0] res;
      wire Jump;
      wire MemRead;
      wire ALUSrc;
      wire RegWrite;
      wire MemtoReg;
      //wire [1:0] ALUOp;
      wire MemWrite;
      CPU uut (  
           .clk(clk),   
           .reset(reset),   
            .PCout(PCout),
            .instruction(instruction),
            .ReadData1(ReadData1), 
            .ReadData2(ReadData2),
            .Output(Output),
            .ReadData(ReadData),
            .WriteData(WriteData_Reg),
            .s_extend(s_extend),
            //.e_extend(e_extend),
            .ALUSrc(ALUSrc),
			.MemtoReg(MemtoReg),
			.RegWrite(RegWrite),
			.MemRead(MemRead),
			.MemWrite(MemWrite),
            .Jump(Jump),
            .res(res)
      );  
      //initial begin  
           //clk = 1;  
           //forever #80 clk = ~clk;  
      //end  
      //initial begin  
        //   reset = 1;             
      //#60
      //reset = 0;
      //end  
 endmodule 


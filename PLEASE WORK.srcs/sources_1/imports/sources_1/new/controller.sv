`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 11:39:57 AM
// Design Name: 
// Module Name: controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module controller(input  logic [6:0] op,
                  input  logic [2:0] funct3,
                  input  logic       funct7b5,
                  input  logic       Zero,
                  output logic [1:0] ResultSrc,
                  output logic       MemWrite,
                  output logic       PCSrc, ALUSrc,
                  output logic       RegWrite, Jump,
                  output logic [1:0] ImmSrc,
                  output logic [2:0] ALUControl);

  logic [1:0] ALUOp;
  logic       Branch;

  main_decoder md(.opCode(op), .resultSrc(ResultSrc), .memWrite(MemWrite), .branch(Branch), .ALUSrc(ALUSrc),
                  .regWrite(RegWrite), .jump(Jump), .immSrc(ImmSrc), .ALUOp(ALUOp));
  ALU_decoder  ad(.op5(op[5]), .funct3(funct3), .funct7(funct7b5), .ALUop(ALUOp), .ALUControl(ALUControl));

  assign PCSrc = Branch & Zero | Jump;
  
endmodule

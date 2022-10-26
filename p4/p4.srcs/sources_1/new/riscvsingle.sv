`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 11:51:59 AM
// Design Name: 
// Module Name: riscvsingle
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


module riscvsingle(input  logic        clk, reset,
                   output logic [31:0] PC,
                   input  logic [31:0] Instr,
                   output logic        MemWrite,
                   output logic [31:0] ALUResult, WriteData,
                   input  logic [31:0] ReadData);

  logic       ALUSrc, RegWrite, Jump, Zero;
  logic [1:0] ResultSrc, ImmSrc;
  logic [2:0] ALUControl;

  // instantiate controller
  controller c(.op(Instr[6:0]), .funct3(Instr[14:12]), .funct7b5(Instr[30]), .Zero(Zero),
               .ResultSrc(ResultSrc), .MemWrite(MemWrite), .PCSrc(PCSrc), .ALUSrc(ALUSrc),
               .RegWrite(RegWrite), .Jump(Jump), .ImmSrc(ImmSrc), .ALUControl(ALUControl));
  
  // instantiate datapath
  datapath dp(.clk(clk), .reset(reset), .ResultSrc(ResultSrc), .PCSrc(PCSrc), .ALUSrc(ALUSrc),
              .RegWrite(RegWrite), .ImmSrc(ImmSrc), .ALUControl(ALUControl), .Zero(Zero),
              .PC(PC), .Instr(Instr), .ALUResult(ALUResult), .WriteData(WriteData), .ReadData(ReadData));

endmodule

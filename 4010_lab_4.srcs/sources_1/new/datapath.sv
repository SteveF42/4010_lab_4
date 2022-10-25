`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class: CSE 4010 Fall 2022
// Engineers: Nathan Bush, Axel Lira, Steve Flores
// 
// Create Date: 10/23/2022 11:29:11 AM
// Design Name: Datapath
// Module Name: datapath
// Project Name: Single Cycle Processor
// Description: A module combining functional units that make up the datapath.
// Dependencies: pc.sv, pc_plus_4.sv, pc_target.sv, register_file.sv, mux2_1.sv,
//               mux3_1.sv, ALU.sv, sign_extender.sv
//
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module datapath(
    input logic clk, PCSrc, ALUSrc, RegWrite, reset,
    input logic [1:0] ResultSrc, ImmSrc,
    input logic [2:0] ALUControl,
    input logic [31:0] Instr, ReadData,
    output logic Zero,
    output logic [31:0] PC, WriteData, ALUResult
    );
    
    logic [31:0] PCNext, PCPlus4, PCTarget;
    logic [31:0] ImmExt;
    logic [31:0] SrcA, SrcB;
    logic [31:0] Result;
    
    // program counter logic
    pc pcreg(.clk(clk), .reset(reset), .next(PCNext), .current(PC));
    pc_plus_4 pcadd4(.current(PC), .next(PCPlus4));
    pc_target pcaddbranch(.pc(PC), .offset(ImmExt), .target(PCTarget));
    mux2_1 pcmux(.input1(PCPlus4), .input2(PCTarget), .select(PCSrc), .cout(PCNext));
    
    // register file logic
    register_file rf(.clk(clk), .WE3(RegWrite), .A1(Instr[19:15]), .A2(Instr[24:20]),
                     .A3(Instr[11:7]), .RD1(SrcA), .RD2(WriteData), .WD3(Result));
    sign_extender ext(.in(Instr), .out(ImmExt), .immSrc(ImmSrc));
    
    // ALU logic
    mux2_1 srcbmux(.input1(WriteData), .input2(ImmExt), .select(ALUSrc), .cout(SrcB));
    ALU alu(.src1(SrcA), .src2(SrcB), .control(ALUControl), .result(ALUResult), .zero(Zero));
    mux3_1 resultmux(.input1(ALUResult), .input2(ReadData), .input3(PCPlus4), .select(ResultSrc), .cout(Result));
    
endmodule

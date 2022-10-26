`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2022 08:00:07 PM
// Design Name: 
// Module Name: tb_datapath
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


module tb_datapath();

    logic clk, reset, PCSrc, ALUSrc, RegWrite;
    logic [1:0] ResultSrc, ImmSrc;
    logic [2:0] ALUControl;
    logic [31:0] Instr, ReadData;
    logic Zero;
    logic [31:0] PC, WriteData, ALUResult;
    
    datapath datapath_dut(.clk(clk), .reset(reset), .PCSrc(PCSrc), .ALUSrc(ALUSrc), .RegWrite(RegWrite),
                          .ResultSrc(ResultSrc), .ImmSrc(ImmSrc), .ALUControl(ALUControl), .Instr(Instr),
                          .ReadData(ReadData), .Zero(Zero), .PC(PC), .WriteData(WriteData), .ALUResult(ALUResult));
    
    initial
        begin
            reset <= 1; #20;
            reset <= 0; PCSrc <= 0; #20;
            assert(PC == 'h00000004) else $error("PC did not increment by 4 as expected.");
            
            PCSrc <= 1; Instr <= 'h02728863; #20;
            assert(PC == 'h00000034) else $error("PC did not increment by PC + offset as expected.");
            
            $finish;
        end
                
    always
        begin
            clk <= 1; #10;
            clk <=0; #10;
        end
endmodule

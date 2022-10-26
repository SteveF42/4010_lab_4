`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2022 08:42:56 PM
// Design Name: 
// Module Name: ALU_decoder_tb
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


module ALU_decoder_tb();
    logic [1:0]ALUop;
    logic [31:0]opCode;
    logic [2:0]ALUControl;


    //ALU ctrl truth table    
    ALU_decoder alu(
        .ALUop(ALUop[1:0]),
        .op5(opCode[4]),
        .funct3(opCode[14:12]),
        .funct7(opCode[30]),
        .ALUControl (ALUControl [2:0])
    );
    
    always
    begin
        ALUop[1:0] <= 'b10;
        opCode <= 'h00500113; //I type
        #100;
        ALUop[1:0] <= 'b10;
        opCode <= 'h0023E233; //R type
        #100;
        ALUop[1:0] <= 'b01;
        opCode <= 'h02728863; //beq type
        #100;
        ALUop[1:0] <= 'b00;
        opCode <= 'h0471AA23; //sw
        #100;
    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2022 04:12:41 PM
// Design Name: 
// Module Name: ALU_decoder
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


module ALU_decoder(
    input logic[1:0] ALUop,
    input logic op5, //bit 5 from opcode
    input logic[2:0] funct3,
    input logic funct7, //bit 5 from funct 7
    output logic[2:0] ALUControl
    );
    
    always_comb
    if(ALUop[1:0] == 'b00)//add
        ALUControl <= 'b000;
    else if(ALUop[1:0] == 'b01) //sub
        ALUControl <= 'b001;
    else if(ALUop[1:0] == 'b10) // add sub SLT OR AND
        if(funct3[2:0] == 'b000) // op5,funct7 == 00, 01, 10 add
            if({op5,funct7} != 'b11)
                ALUControl <= 'b000;
            else
                ALUControl  <= 'b001; // op, funct7 == 11
        else if(funct3[2:0] == 'b010)
            ALUControl <= 'b101;    //SLT
        else if(funct3[2:0] == 'b110)
            ALUControl <= 'b011;    //OR
        else if(funct3[2:0] == 'b111)
            ALUControl <= 'b010;    //AND

    
endmodule

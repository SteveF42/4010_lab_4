`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2022 04:00:04 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input logic[6:0] opCode,
    input logic zeroFlag,
    output logic PCsrc,
    output logic [1:0]resultSrc,
    output logic memWrite,
    output logic [1:0]immSrc,
    output logic [1:0]ALUSrc,
    output logic regWrite,
    output logic [1:0]ALUOp,
    );
    
    logic branch;
    logic jump;

    //opcode truth table   
    always_comb
    if(opCode == 'b0000011)begin //lw
        regWrite <= 'b1;
        immSrc[1:0] <= 'b00;
        ALUSrc[1:0] <= 'b01;
        memWrite <= 'b0;
        resultSrc[1:0] <= 'b01;
        branch <= 'b0;
        ALUOp <= 'b00;
        jump <= 'b0;
    end
    else if(opCode == 'b0100011)begin //sw
        regWrite <= 'b0;
        immSrc[1:0] <= 'b01;
        ALUSrc[1:0] <= 'b01;
        memWrite <= 'b1;
        branch <= 'b0;
        ALUOp <= 'b00;
        jump <= 'b0;
    end
    else if(opCode == 'b0110011)begin //R-type
        regWrite <= 'b1;
        ALUSrc[1:0] <= 'b00;
        memWrite <= 'b0;
        resultSrc[1:0] <= 'b00;
        branch <= 'b0;
        ALUOp <= 'b10;
        jump <= 'b0;
    end //R-type
    else if(opCode == 'b1100011)begin //beq
        regWrite <= 'b0;
        immSrc[1:0] <= 'b10;
        ALUSrc[1:0] <= 'b00;
        memWrite <= 'b0;
        branch <= 'b1;
        ALUOp <= 'b01;
        jump <= 'b0;
    end //beq
    else if(opCode == 'b0010011)begin //I=type
        regWrite <= 'b1;
        immSrc[1:0] <= 'b00;
        ALUSrc[1:0] <= 'b00;
        memWrite <= 'b0;
        resultSrc[1:0] <= 'b00;
        branch <= 'b0;
        ALUOp <= 'b10;
        jump <= 'b0;
    end
    else if(opCode == 'b0010011)begin // Jal
        regWrite <= 'b1;
        immSrc[1:0] <= 'b11;
        memWrite <= 'b0;
        resultSrc[1:0] <= 'b10;
        branch <= 'b0;
        jump <= 'b1;
    end
    
    //PCSrc ptr I'm not 100 sure how this logic gate makes any sense 0 and branch or jump????
    always_comb begin
    if((branch == zeroFlag) || jump == 'b1)
        PCsrc <= 1;
    else
        PCsrc  <= 0;
    end

    
endmodule

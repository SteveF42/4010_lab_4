`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2022 06:17:17 PM
// Design Name: 
// Module Name: control_unit_tb
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


module control_unit_tb();
    logic [31:0]instruction = 'h00500113;
    logic PCsrc;
    logic [1:0]resultSrc;
    logic memWrite;
    logic [1:0]immSrc;
    logic [1:0]ALUSrc;
    logic regWrite;
    logic [1:0]ALUOp;
    logic [2:0] ALUControl;
    
    control_unit test(.opCode (instruction[6:0]),
            .funct3(instruction[14:12]),
            .funct7(instruction[30]),
            .PCsrc(PCsrc),
            .resultSrc(resultSrc),
            .memWrite(memWrite),
            .immSrc(immSrc),
            .ALUSrc(ALUSrc),
            .regWrite(regWrite),
            .ALUOp(ALUOp),
            .ALUControl(ALUControl)
        );
        
    always
    begin
        instruction[31:0] <='h00500113; //i type
        #100;
        instruction[31:0] <='h0023E233; //or
        #100;
        instruction[31:0] <='h00020463; //beq
        #100;
        instruction[31:0] <='h06002103; //lw
        #100;
        instruction[31:0] <='h008001EF; //jal
        #100;
    end
endmodule

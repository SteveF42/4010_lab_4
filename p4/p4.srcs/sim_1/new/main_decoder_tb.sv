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


module main_decoder_tb();
    logic [31:0]instruction;
    logic PCsrc;
    logic [1:0]resultSrc;
    logic memWrite;
    logic [1:0]immSrc;
    logic [1:0]ALUSrc;
    logic regWrite;
    logic [1:0]ALUOp;
    logic zeroFlag = 0;
    logic jump;
    logic branch;
    
    main_decoder test(
            .opCode (instruction[6:0]),
            .resultSrc(resultSrc),
            .memWrite(memWrite),
            .immSrc(immSrc),
            .ALUSrc(ALUSrc),
            .regWrite(regWrite),
            .ALUOp(ALUOp),
            .branch(branch),
            .jump(jump)
        );
        
    always
    begin
        instruction[31:0] <='h00500113; //i type
        #100;
        instruction[31:0] <='h0023E233; // R type
        #100;
        instruction[31:0] <='h00020463; //beq
        #100;
        instruction[31:0] <='h06002103; //lw
        #100;
        instruction[31:0] <='h008001EF; //jal
        #100;
    end
endmodule

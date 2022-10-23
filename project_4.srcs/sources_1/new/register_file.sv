`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class: CSE 4010 Fall 2022
// Engineers: Nathan Bush, Axel Lira, Steve Flores
// 
// Create Date: 10/23/2022 11:29:11 AM
// Design Name: Register File
// Module Name: register_file
// Project Name: Single Cycle Processor
// Description: A module describing a 32x32 reigster file with read/write control.
// 
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////



module register_file(
    input logic clk, WE3,
    input logic [4:0]A1, A2, A3,
    input logic [31:0]WD3,
    output logic [31:0]RD1, RD2
    );
    
    logic [31:0] RAM[31:0];
    
    always_ff @(posedge clk)
        begin
            if(WE3)
                RAM[A3] <= WD3;
        end
        
    assign RD1 = RAM[A1];
    assign RD2 = RAM[A2];
    
endmodule

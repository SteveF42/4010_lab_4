`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class: CSE 4010 Fall 2022
// Engineers: Nathan Bush, Axel Lira, Steve Flores
// 
// Create Date: 10/23/2022 11:29:11 AM
// Design Name: Program Counter
// Module Name: pc
// Project Name: Single Cycle Processor
// Description: A module describing a program counter.
// 
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module pc(
    input logic clk, reset,
    input logic [31:0]next,
    output logic [31:0]current
    );
    
    always_ff@(posedge clk)
        if (reset) current <= 0;
        else current <= next;

endmodule

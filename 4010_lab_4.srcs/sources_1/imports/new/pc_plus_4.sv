`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class: CSE 4010 Fall 2022
// Engineers: Nathan Bush, Axel Lira, Steve Flores
// 
// Create Date: 10/23/2022 11:29:11 AM
// Design Name: Program Counter + 4
// Module Name: pc_plus_4
// Project Name: Single Cycle Processor
// Description: A module describing that adds 4 to the current program counter value.
// 
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module pc_plus_4(
    input logic [31:0]current,
    output logic [31:0]next
    );
    
    assign next = current + 32'd4;
    
endmodule

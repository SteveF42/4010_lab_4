`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2022 04:57:05 PM
// Design Name: 
// Module Name: mux3_1
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


module mux3_1(
input logic [31:0]input1, 
input logic [31:0]input2, 
input logic [31:0]input3,
input logic [0:1]select, 
output logic [31:0]cout
);

always_comb
    case(select)
        2'b00: cout = input1;
        2'b01: cout = input2;
        2'b10 cout = input3;
        default:0;
    endcase
endmodule


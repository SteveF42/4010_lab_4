`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2022 06:58:28 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
input logic [31:0]src1,
input logic[31:0]src2,
input logic [2:0]control,
output logic [31:0] result,
output logic zero
    );
    
    always_comb
    case(control)
        3'b000: result = src1 + src2;
        3'b001: result = src1 - src2;
        3'b010: result = src1 & src2;
        3'b011: result = src1 | src2; 
        3'b101: result = (src1 < src2) ? 1 : 0;
        default: result = 0;
    endcase
    assign zero = (result) ? 0 : 1;
endmodule

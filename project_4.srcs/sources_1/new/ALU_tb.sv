`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2022 07:48:51 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();

logic [31:0]src1;
logic[31:0]src2;
logic [2:0]control;
logic [31:0] result;

  ALU exec(.src1(src1), .src2(src2), .control(control), .result(result), .zero(zero);

initial 
begin
src1 = 2;
src2 = 1;
control = 3'b000;
#20;
src1 = 2;
src2 = 1;
control = 3'b001;
#20;
src1 = 0;
src2 = 1;
control = 3'b010;
#20;
src1 = 0;
src2 = 1;
control = 3'b011;
#20;
src1 = 0;
src2 = 1;
control = 3'b101;
#20;
src1 = 2;
src2 = 1;
control = 3'b101;
#20;
end
endmodule

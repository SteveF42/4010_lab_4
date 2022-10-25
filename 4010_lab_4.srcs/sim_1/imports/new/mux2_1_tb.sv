`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2022 07:21:47 PM
// Design Name: 
// Module Name: mux2_1_tb
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


module mux2_1_tb;
logic [31:0]input1;
logic [31:0]input2;
logic select;
logic [31:0]cout;

mux2_1 invoke(.input1(input1), .input2(input2), .select(select), .cout(cout));

initial 

begin
input1 = 0;
input2 = 1;
select = 1;
#20;
input1 = 0;
input2 = 1;
select = 0;
#20;
input1 = 0;
input2 = 1;
select = 1;
#20;
input1 = 0;
input2 = 1;
select = 0;
#20;
input1 = 0;
input2 = 1;
select = 1;
#20;
input1 = 0;
input2 = 1;
select = 0;
#20;
end
endmodule

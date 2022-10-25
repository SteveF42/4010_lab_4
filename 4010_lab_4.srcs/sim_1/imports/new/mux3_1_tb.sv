`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2022 05:19:30 PM
// Design Name: 
// Module Name: mux3_1_tb
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


module mux3_1_tb;
logic [31:0]input1;
logic [31:0]input2;
logic [31:0]input3;
logic [1:0]select;
logic [31:0]cout;

mux3_1 try(.input1(input1), .input2(input2), .input3(input3), .select(select), .cout(cout));

initial 

begin
input1 = 0;
input2 = 1;
input3 = 2;
select = 2'b00;
#20;
input1 = 0;
input2 = 1;
input3 = 2;
select = 2'b01;
#20;
input1 = 0;
input2 = 1;
input3 = 2;
select = 2'b10;
#20;
input1 = 0;
input2 = 1;
input3 = 2;
select = 2'b11;
#20;
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2022 10:29:53 PM
// Design Name: 
// Module Name: sign_extender_tb
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


module sign_extender_tb();
    //tests addi x2, x0, 5 I type instruction
    logic [31:0]instruction;
    logic [31:0]out;
    logic [1:0]ctrl;


    sign_extender cocka(.in(instruction), .out(out),.immSrc(ctrl));
    begin
        assign ctrl[1:0] = 'b00;
        assign instruction[32:0] = 32'hFF718393;
    end
endmodule

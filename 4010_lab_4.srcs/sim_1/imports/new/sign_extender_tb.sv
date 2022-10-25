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
    logic [31:0]instruction;
    logic [31:0]out;
    logic [1:0]ctrl;

    sign_extender sign_extender_dut(.in(instruction), .out(out), .immSrc(ctrl));
    initial
        begin
            // addi x7, x3, -9 (I-type instruction)
            ctrl <= 'b00; instruction <= 'hFF718393; #20;
            assert (out == 'hfffffff7) else $error("out should be xfffffff7");
            
        end
endmodule

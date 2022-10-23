`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class: CSE 4010 Fall 2022
// Engineers: Nathan Bush, Axel Lira, Steve Flores
// 
// Create Date: 10/23/2022 11:29:11 AM
// Design Name: Program Counter Test Bench
// Module Name: tb_pc
// Project Name: Single Cycle Processor
// Description: Test bench. UAT = pc, a module describing a program counter.
// 
// Dependencies: pc module
// 
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module tb_pc();

    logic clk;
    logic [31:0]next, current;
    
    pc tb_program_counter(.clk(clk), .next(next), .current(current));
    
    initial
        begin
            next <= 'h01234567; #20;
            assert(current == 'h01234567) else $error("current should be x01234567");
            
            next <= 'h12345678; #20;
            assert(current == 'h12345678) else $error("current should be x12345678");
            
            next <= 'h23456789; #20;
            assert(current == 'h23456789) else $error("current should be x23456789");
        end
    
    always
        begin
            clk <= 1; #10;
            clk <=0; #10;
        end
        
endmodule

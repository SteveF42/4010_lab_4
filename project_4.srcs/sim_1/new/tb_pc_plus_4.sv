`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class: CSE 4010 Fall 2022
// Engineers: Nathan Bush, Axel Lira, Steve Flores
// 
// Create Date: 10/23/2022 11:29:11 AM
// Design Name: Program Counter +4 Test Bench
// Module Name: tb_pc_plus_4
// Project Name: Single Cycle Processor
// Description: Test bench. UAT = pc_plus_4, a module adding 4 to the current PC.
// 
// Dependencies: pc_plus_4.sv
// 
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module tb_pc_plus_4();
    logic [31:0]current, next;
    
    pc_plus_4 tb_PC_plus4(.next(next), .current(current));
    
    initial
        begin
            current <= 'h00000000; #20;
            assert (next == 'h00000004) else $error("next should be x0000004");
            
            current <= 'h00000004; #20;
            assert(next == 'h00000008) else $error("next should be x00000008");
            
            current <= 'h00000008; #20;
            assert(next == 'h0000000c) else $error("next should be x0000000c");
        end

endmodule

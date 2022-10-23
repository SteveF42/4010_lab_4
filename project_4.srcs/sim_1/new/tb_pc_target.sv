`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class: CSE 4010 Fall 2022
// Engineers: Nathan Bush, Axel Lira, Steve Flores
// 
// Create Date: 10/23/2022 11:29:11 AM
// Design Name: Program Counter + Immediate Test Bench
// Module Name: tb_pc_target
// Project Name: Single Cycle Processor
// Description: Test bench. UAT = pc_target, a module adding immediate value to the
//              current PC for possible branch or jump address.
// 
// Dependencies: pc_target.sv
// 
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module tb_pc_target();

    logic [31:0]pc, offset, target;
    
        
    pc_target tb_PC_target(.pc(pc), .offset(offset), .target(target));
    
    initial
        begin
            pc <= 'h00000000; offset <= 'h000000ff; #20;
            assert (target == 'h000000ff) else $error("target should be x00000ff");
            
            pc <= 'h000000ff; offset <= 'h0000ff00; #20;
            assert(target == 'h0000ffff) else $error("target should be x0000ffff");
            
            pc <= 'h12345678; offset <= 'haabbccdd; #20;
            assert(target == 'hbcf02355) else $error("target should be xbcf02355");
        end
endmodule

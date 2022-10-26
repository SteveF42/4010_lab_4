`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Class: CSE 4010 Fall 2022
// Engineers: Nathan Bush, Axel Lira, Steve Flores
// 
// Create Date: 10/23/2022 11:29:11 AM
// Design Name: Register File Test Bench
// Module Name: tb_register_file
// Project Name: Single Cycle Processor
// Description: Test bench. UAT = register_file, a module setting up a 32x32 register
//                          with read/write functionality based on control signal.
//
// Dependencies: register_file.sv
// 
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module tb_register_file();

    logic clk, WE3;
    logic [4:0]A1, A2, A3;
    logic [31:0]WD3, RD1, RD2;
    
    register_file tb_RF(.clk(clk), .WE3(WE3), .A1(A1), .A2(A2), .A3(A3), .WD3(WD3), .RD1(RD1), .RD2(RD2));
    
    initial
        begin
            // Load operation: write to register 3, control is 1
            WE3 <= 1; A1 <= 'd1; A2 <= 'd2; A3 <= 'd3; WD3 <= 'h12345678; #20;
            
            // Load operation: write to register 4, control is 1
            A3 <= 'd4; WD3 <= 'haabbccdd; #20;
            
            // Store operation: read from registers 3 and 4, control is 0
            WE3 <= 0; A1 <= 'd3; A2 <= 'd4; #20;
            assert (RD1 == 'h12345678 && RD2 == 'haabbccdd) else $error("Incorrect values stored in target registers.");
        end
    
    always
        begin
            clk <= 1; #10;
            clk <=0; #10;
        end
endmodule

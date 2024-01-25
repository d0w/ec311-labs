`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2023 05:38:21 PM
// Design Name: 
// Module Name: ALU_testbench
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


module ALU_testbench(
        
    );
    
    reg [2:0] a;
    reg [2:0] b;
    reg c_in;
    reg [1:0] mode;
    wire c_out;
    wire [2:0] result;
    integer c, i, j;
    ALU a1(.a(a), .b(b), .mode(mode), .c_in(c_in), .result(result), .c_out(c_out));
    
    initial
    begin
        #50;
        a = 5;
        b = 1;
        mode = 0;
        for (c = 0; c < 2; c = c+1) begin
        for (i = 0; i < 8; i = i+1) begin
            for (j = 0; j < 8; j = j+1) begin
                c_in = c;
                a = i;
                b = j;
                #10;
            end        
        end
        end
        #50
        mode=1;
        for (c = 0; c < 2; c = c+1) begin
        for (i = 0; i < 8; i = i+1) begin
            for (j = 0; j < 8; j = j+1) begin
                c_in = c;
                a = i;
                b = j;
                #10;
            end        
        end
        end
        #50;
        mode = 2;
        for (c = 0; c < 2; c = c+1) begin
        for (i = 0; i < 8; i = i+1) begin
            for (j = 0; j < 8; j = j+1) begin
                c_in = c;
                a = i;
                b = j;
                #10;
            end        
        end
        end
        #50;
        mode = 3;
        for (c = 0; c < 2; c = c+1) begin
        for (i = 0; i < 8; i = i+1) begin
            for (j = 0; j < 8; j = j+1) begin
                c_in = c;
                a = i;
                b = j;
                #10;
            end        
        end
        end
    end
    
endmodule

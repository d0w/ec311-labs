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
    
    reg [3:0] a;
    reg [3:0] b;
    reg c_in;
    reg mode;
    reg [2:0] operation;
    wire c_out;
    wire [3:0] result;
    integer c, i, j, o, m;
    ALU a1(.a(a), .b(b), .mode(mode), .operation(operation), .c_in(c_in), .result(result), .c_out(c_out));
    
    initial
    begin
        a = 0;
        b = 0;
        c_in = 0;
        operation = 0;
        mode = 0;
        for (m = 1; m < 2; m = m+1) begin
            mode = m;
        for (o = 0; o < 8; o = o+1) begin
            operation = o;
            for (c = 0; c < 2; c = c+1) begin
            for (i = 0; i < 16; i = i+1) begin
                for (j = 0; j < 16; j = j+1) begin
                    c_in = c;
                    a = i;
                    b = j;
                    #10;
                end        
            end
            end
        end
        end
        
    end
    
endmodule

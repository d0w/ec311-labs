`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2023 06:23:25 PM
// Design Name: 
// Module Name: moore_FSM_tb
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


module moore_FSM_tb();

    reg clk, reset, read;
    reg [7:0] in;
    wire out;
    
    moore_FSM fsm1(out, clk, reset, read, in);
    
    always #20 clk = ~clk;
    
    initial
    begin
        reset = 0;
        read = 0;
        in = 7'b1001101;
        clk = 0;
        
        read = 1;
        #400;
        
        read = 0;
        reset = 1;
        #80;
        
        reset = 0;
        #40;
        
        
        
        
        
    end

endmodule

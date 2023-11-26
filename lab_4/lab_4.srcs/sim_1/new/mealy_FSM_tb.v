`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2023 06:56:53 PM
// Design Name: 
// Module Name: mealy_FSM_tb
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


module mealy_FSM_tb();
    reg clk, reset;
    reg in;
    wire out;
    
    mealy_FSM fsm1(out, clk, reset, in);
    
    always #5 clk = ~clk;
    
    initial
    begin
        reset = 0;
        in = 1;
        clk = 0;
        
        #30;
        
        reset = 1;
        #10;
        
        in = 0;
        #10

        reset = 0;

        #30;
        
        in = 1;
        #30;
        
        
        
        
        
        
    end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2023 12:23:30 PM
// Design Name: 
// Module Name: mux_testbench
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


module mux_testbench(

    );
    
    reg select, first, second;
    wire out;
    
    mux_2x1 m1(select, first, second);
    
    initial begin
    select = 0; first = 0; second = 0;
    
    #10
    first  = 1;
    #10
    second = 1;
    #10
    select = 1;
    #10
    first = 0;
    #10
    first = 1;
    second = 0;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 04:27:34 PM
// Design Name: 
// Module Name: half_adder_testbench
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


module half_adder_testbench(
    
    );
    
    reg a, b;
    wire sum, c_out;
    
    half_adder half(a, b, sum, c_out);
    
        
    initial
    begin
    a = 0; b = 0;
    #10 a=1;
    #10 b=1;
    #10 a=0;
    #10 $finish;
    end
    
    
endmodule

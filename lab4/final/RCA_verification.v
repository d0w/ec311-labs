`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2023 07:25:09 PM
// Design Name: 
// Module Name: adding_verification
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


module RCA_verification #(parameter n = 1) (a, b, sum);
    input [n-1:0] a;
    input [n-1:0] b;
    output [n:0] sum;
    
    assign sum = a + b;
endmodule

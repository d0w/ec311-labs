`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 04:54:12 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input c_in,
    input a,
    input b,
    output sum,
    output c_out
    );
    
    wire w1, w2, w3;
    half_adder half1(.a(a), .b(b), .sum(w1), .c_out(w2));
    half_adder half2(.a(c_in), .b(w1), .sum(sum), .c_out(w3));
    
    assign c_out = w3 | w2;
    
    
endmodule

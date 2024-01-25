`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2023 07:15:41 PM
// Design Name: 
// Module Name: Nbit_fulladder
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


module RCA_Nbit #(parameter n=1) (c_in, a, b, sum);
    input [n-1:0] a;
    input [n-1:0] b;
    input c_in;
    output [n:0] sum; 
    
    wire [n-1:0] temp;

    genvar i;
    generate
        full_adder f(c_in, a[0], b[0], sum[0], temp[0]);
        for (i = 1; i < n; i = i+1) begin
            full_adder fi(.c_in(temp[i-1]), .a(a[i]), .b(b[i]), .sum(sum[i]), .c_out(temp[i]));
            //full_adder fi(.c_in(0), .a(1), .b(0), .sum(sum[i]), .c_out(temp[i]));
        end
        assign sum[n] = temp[n-1];
    
    endgenerate
endmodule

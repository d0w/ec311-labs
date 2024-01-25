`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2023 03:58:12 PM
// Design Name: 
// Module Name: carry_select_adder
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


module carry_select_adder(
        input [3:0] a,
        input [3:0] b,
        input cin,
        output [3:0] sum,
        output cout
    );
    
    wire [3:0] carry1, carry2;
    wire [3:0] w1, w2;
    
    full_adder f01(1'b0, a[0], b[0], w1[0], carry1[0]);
    full_adder f02(carry1[0], a[1], b[1], w1[1], carry1[1]);
    full_adder f03(carry1[1], a[2], b[2], w1[2], carry1[2]);
    full_adder f04(carry1[2], a[3], b[3], w1[3], carry1[3]);
    
    full_adder f11(1'b1, a[0], b[0], w2[0], carry2[0]);
    full_adder f12(carry2[0], a[1], b[1], w2[1], carry2[1]);
    full_adder f13(carry2[1], a[2], b[2], w2[2], carry2[2]);
    full_adder f14(carry2[2], a[3], b[3], w2[3], carry2[3]);
    
    // carry mux gives cout
    mux_2x1 carry_mux(cin, carry1[3], carry2[3], cout);
    
    // sum muxs gives sum
    mux_2x1 mux1(cin, w1[0], w2[0], sum[0]);
    mux_2x1 mux2(cin, w1[1], w2[1], sum[1]);
    mux_2x1 mux3(cin, w1[2], w2[2], sum[2]);
    mux_2x1 mux4(cin, w1[3], w2[3], sum[3]);
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 05:54:50 PM
// Design Name: 
// Module Name: ripple_adder_testbench
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


module ripple_adder_testbench(

    );
    reg [2:0]a;
    reg [2:0]b;
    reg c_in;
    wire [2:0]sum;
    wire c_out;
    integer c, i, j;
    ripple_adder ripple1_1(c_in, a, b, sum, c_out);
    
        
    initial
    begin
    a=0;b=0;c_in=0;
    
    #100;
    a=2;
    b=1;
    c_in=0;

    #50;
    for (c = 0; c < 2; c = c+1) begin
        for (i = 0; i < 8; i = i+1) begin
            for (j = 0; j < 8; j = j+1) begin
                c_in = c;
                a = i;
                b = j;
                #50;
            end        
        end
    end
    
    
    end
    
endmodule

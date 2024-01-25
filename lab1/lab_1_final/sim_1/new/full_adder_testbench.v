`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 05:12:14 PM
// Design Name: 
// Module Name: full_adder_testbench
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


module full_adder_testbench(

    );
    
    reg a, b, c_in;
    wire sum, c_out;
    
    full_adder full_1(a, b, c_in, sum, c_out);
    
    always
     #10 c_in = ~c_in;
    always
        #20 b = ~b;
    always
        #40 a = ~a;
        
    initial
    begin
    a=0;b=0;c_in=0;
//    initial
//    begin
//    a = 0;
//    b = 0;
//    c_in = 0;
    
//    #10 a=1;
//    #10 b=1;
//    #10 c_in=1;
//    #10 c_in=0;
//    #10 c_in=1;b=0;
//    #10 c_in=0;
//    #10 c_in=1;b=1;a=0;
//    #10 c_in=0;
//    #10 c_in=1; b=0;
//    #10 c_in=0;
//    end
    end
endmodule

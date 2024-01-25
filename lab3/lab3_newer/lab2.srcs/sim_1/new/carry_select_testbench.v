`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2023 04:20:35 PM
// Design Name: 
// Module Name: carry_select_testbench
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


module carry_select_testbench (

    );

    // input
    reg [3:0] A;
    reg [3:0] B;
    reg cin;
    
    // output
    wire [3:0] sum;
    wire cout;  
    integer i,j,error;
    
    carry_select_adder cs1(
        .a(A), 
        .b(B), 
        .cin(cin), 
        .sum(sum), 
        .cout(cout)
    );

    initial 
    begin
    A = 0;
    B = 0;
    error = 0;
    
    // cin = 0
    cin = 0;
    for(i=0; i<16; i=i+1) begin
        for(j=0; j<16; j=j+1) begin
            A = i;
            B = j;
            #10;
//            if({cout,sum} != (i+j)) 
//                error <= error + 1;
//            $display("%d", sum);
//            $display("%d", error);
        end  
    end
       
    // cin = 1
    cin = 1; 
    for(i=0; i<16; i=i+1) begin
        for(j=0; j<16; j=j+1) begin
            A = i;
            B = j;
            #10;
//            if({cout,sum} != (i+j+1)) 
//                error <= error + 1;
//            $display("%d", sum);
//            $display("%d", error);
        end  
    end 
   end
    
endmodule

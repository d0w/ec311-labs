`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2023 07:26:51 PM
// Design Name: 
// Module Name: Nbit_fulladder_tb
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


module RCA_32bit_tb;

    // inputs
    reg [31:0] a;
    reg [31:0] b;
    
    // adder outputs
    wire [32:0] sum;
    
    // verification outputs
    wire [32:0] ver_sum;
    
    wire error_flag;
    
    RCA_Nbit #(32) adder(0, a, b, sum);
    
    RCA_verification #(32) verify(a, b, ver_sum);
    
    // error handling
    assign error_flag = (sum != ver_sum);
    
    always @(sum) begin
        if (error_flag)
            $display("Error occurs when a = %d and b = %d", a, b); 
    end
    
    
    integer i, j;
    initial
    begin
        a = 32'b11100101111101011100101011011010;
        b = 32'b11100011100111110011100110010010;
        
        #100;
        
        a = 0;
        b = 0;
        
        for (i = 0; i < 32'b11111111111111111111111111111111; i = i+1) begin
            for (j = 0; j < 32'b11111111111111111111111111111111; j = j+1) begin
                a = i;
                b = j;
                #5;  
            end   
        end
        
    end 
    
    

endmodule

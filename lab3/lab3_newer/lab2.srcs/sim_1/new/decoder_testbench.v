`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2023 06:31:49 PM
// Design Name: 
// Module Name: decoder_testbench
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


module decoder_testbench(
    
    );
    reg out_control;
    reg [3:0] opCode;
    reg [3:0] result;
    wire [6:0] LED_out;
    integer i, j, k;
    
    decoder d1(out_control, opCode, result, LED_out);
    
    initial
    begin
    out_control = 0;
    result = 0;
    opCode = 0;
        for (i = 0; i < 2; i = i+1) begin
            out_control = i;
            for (j = 0; j < 2; j = j+1) begin
                opCode = j;
                
                for (k = 0; k < 16; k = k+1) begin
                    result = k;
                    #10;
                end
            end
            
            
        end
    end
    
    
endmodule

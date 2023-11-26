`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2023 08:10:04 PM
// Design Name: 
// Module Name: moore_FSM
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


module moore_FSM(out, clk, reset, read, in);
    input clk, reset, read; 
    input [7:0] in;
    output reg out;
    
    reg [3:0] p; // 0-7 
    reg [1:0] present_state, next_state;
    
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
    
    initial present_state = S3;
    
    always @(reset or read or present_state)
        case(present_state)
            S0: begin 
                    if(reset)               next_state <= S3;
                    else if(read)           next_state <= S1;
                    else                    next_state <= S0;
                end
            S1: begin out <= in[p];      next_state <= S2; end
            S2: begin
//                    if (p > 7) p <= 0; 
//                    else p <= p + 1;  
                    p <= p + 1;          
                    next_state <= S0; 
                end
            S3: begin p <= 0; out <= 0; next_state = S0; end    
        endcase
    
    always @(posedge clk) begin
        if (reset == 1'b1) begin
            present_state <= S3;
        end
        else begin
            present_state <= next_state;
        end    
    
   end 


endmodule
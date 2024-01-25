`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2023 06:48:44 PM
// Design Name: 
// Module Name: mealy_FSM
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


module mealy_FSM(out, clk, reset, in);
    input clk, reset;
    input in;
    output reg out;
    
    reg [3:0] p; // 0-7 
    reg [1:0] present_state, next_state;
    
    parameter S0 = 0, S1 = 1, S2 = 2;
    
    initial present_state = S0;
    
    always @(present_state or in)
        case(present_state)
            S0: begin 
                    if(in) begin next_state <= S1; out <= 0; end
                    else begin next_state <= S2; out <= 0; end
                end
            S1: begin
                    if(in) begin next_state <= S1; out <= 1; end
                    else begin next_state <= S2; out <= 1; end
                end
            S2: begin
                    if(in) begin next_state <= S1; out <= 0; end
                    else begin next_state <= S2; out <= 0; end
                end
        endcase
    
    always @(posedge clk) begin
        if (reset) present_state <= S0;
        else present_state <= next_state;
 
    
   end 
endmodule

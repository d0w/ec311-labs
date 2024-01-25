`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2023 12:26:35 PM
// Design Name: 
// Module Name: display_testbench
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


module display_testbench(

    );
    reg [6:0] LED_out;
    wire [6:0] cathode;
    wire [7:0] anode;
    integer i;
    
    display d1(LED_out, cathode, anode);
    
    initial begin
    for (i = 0; i < 7; i = i+1) begin
        LED_out = i;
    end
    end

endmodule

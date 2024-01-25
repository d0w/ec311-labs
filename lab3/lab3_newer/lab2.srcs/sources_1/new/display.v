`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2023 05:52:46 PM
// Design Name: 
// Module Name: display
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


//module display(
//        input [6:0] LED_out,
//        output [6:0] cathode,
//        output [7:0] anode
//    );
    
//    assign anode = 8'b01111111;
//    assign cathode = LED_out;
//endmodule

// fpga4student.com: FPGA projects, Verilog projects, VHDL projects
// FPGA tutorial: seven-segment LED display controller on Basys  3 FPGA
module display(
    input [7:0] anode,
    input [6:0] cathode,
    output [7:0] ANODE_OUT,
    output [6:0] CATHODE_OUT
    );
    
    assign ANODE_OUT = anode;
    assign CATHODE_OUT = cathode;
    
 endmodule


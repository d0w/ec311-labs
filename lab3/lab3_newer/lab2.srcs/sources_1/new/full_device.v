`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2023 05:25:34 PM
// Design Name: 
// Module Name: full_device
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


module full_device( 
        input [3:0] op_code, 
        input [3:0] A,
        input [3:0] B,
        input TMP_INT,
        input CLK100MHZ,
        input c_in,
        input control,
        
        output c_out,
        output [6:0] cathode,
        output [7:0] anode
    );
    
    
    wire [3:0] out;
    wire [6:0] LED_out;
    wire [7:0] temp_anode;
    
    ALU alu(
        .a(A), 
        .b(B), 
//        .mode(op_code[3]), 
        .operation(op_code), 
        .c_in(c_in), 
        .result(out), 
        .c_out(c_out)
    );

    
    decoder d1(
        .out_control(control),
        .opCode(op_code),
        .number(TMP_INT),
        .clock_100Mhz(CLK100MHZ),
        
        .LED_out(LED_out),
        .Anode_Activate(temp_anode)
    );
    
    display disp(
        .anode(temp_anode),
        .cathode(LED_out),
        .ANODE_OUT(anode),
        .CATHODE_OUT(cathode)
    );
//    display disp(
//        .clock_100Mhz(CLK100MHZ),
//        .number({A, B}),
//        .LED_out(cathode),
//        .Anode_Activate(anode)
//    );
    
    

    
endmodule

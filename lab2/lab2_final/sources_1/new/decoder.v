`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2023 02:38:36 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
        input out_control,
        input [3:0] opCode,
        input [3:0] result,
        output reg [6:0] LED_out
    );
    
    reg [6:0] LED_out1;
    reg [6:0] LED_out2;
//    ALU a1(.a(A), .b(B), .mode(operation[3]), .operation(operation[2:0]), .c_in(1'b0), .sum(w1), .c_out(cout));
    
    always @(*)
    begin
        case(result)
        4'b0000: LED_out1 = 7'b0000001; // "0"  
        4'b0001: LED_out1 = 7'b1001111; // "1" 
        4'b0010: LED_out1 = 7'b0010010; // "2" 
        4'b0011: LED_out1 = 7'b0000110; // "3" 
        4'b0100: LED_out1 = 7'b1001100; // "4" 
        4'b0101: LED_out1 = 7'b0100100; // "5" 
        4'b0110: LED_out1 = 7'b0100000; // "6" 
        4'b0111: LED_out1 = 7'b0001111; // "7" 
        4'b1000: LED_out1 = 7'b0000000; // "8"  
        4'b1001: LED_out1 = 7'b0000100; // "9"
        4'b1010: LED_out1 = 7'b0001000; // "A"
        4'b1011: LED_out1 = 7'b1100000; // "b"
        4'b1100: LED_out1 = 7'b0110001; // "C"
        4'b1101: LED_out1 = 7'b1000010; // "d"
        4'b1110: LED_out1 = 7'b0110000; // "E"
        4'b1111: LED_out1 = 7'b0111000; // "F"
        default: LED_out1 = 7'b0000001; // "0"
        endcase
        
        case(opCode)
        4'b0000: LED_out2 = 7'b0000001; // "0"  
        4'b0001: LED_out2 = 7'b1001111; // "1" 
        4'b0010: LED_out2 = 7'b0010010; // "2" 
        4'b0011: LED_out2 = 7'b0000110; // "3" 
        4'b0100: LED_out2 = 7'b1001100; // "4" 
        4'b0101: LED_out2 = 7'b0100100; // "5" 
        4'b0110: LED_out2 = 7'b0100000; // "6" 
        4'b0111: LED_out2 = 7'b0001111; // "7" 
        4'b1000: LED_out2 = 7'b0000000; // "8"  
        4'b1001: LED_out2 = 7'b0000100; // "9"
        4'b1010: LED_out2 = 7'b0001000; // "A"
        4'b1011: LED_out2 = 7'b1100000; // "b"
        4'b1100: LED_out2 = 7'b0110001; // "C"
        4'b1101: LED_out2 = 7'b1000010; // "d"
        4'b1110: LED_out2 = 7'b0110000; // "E"
        4'b1111: LED_out2 = 7'b0111000; // "F"
        default: LED_out2 = 7'b0000001; // "0"
        endcase
        
        LED_out = out_control ? LED_out1 : LED_out2;
        //LED_out = 7'b0000001
    end
    
    
    
endmodule

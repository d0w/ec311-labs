`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2023 05:14:32 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
        input [2:0] a,
        input [2:0] b,
        input [1:0] mode,
        input c_in,
        output reg c_out,
        output reg [2:0] result
    );
    
    wire [2:0] w1;
    wire [2:0] added;
    wire co;
    wire cin;
    subtractor s1(.mode(mode == 1 ? 1 : 0), .in(b), .out(w1));
    
    assign cin = mode == 1 ? 1 : c_in; 
    
    ripple_adder ripple_1(.c_in(cin), .a(a), .b(w1), .sum(added), .c_out(co));
    
    //assign { c_out, result } = (mode == 2) ? (mode == 3 ? { 1'b0, a & b } : { 1'b0, a ^ b}) : { co, added };
 
//    always @(*)
//    begin
//        if (mode == 2'b00 || mode == 2'b01)
//            { result, c_out } = {added, co};
//        if (mode == 2'b10)
//            { result, c_out } = { a ^ b, 0 };
//        if (mode == 2'b11)
//            { result, c_out } = { a & b, 0 };
//    end
    always @(a, b, mode, c_in)
    begin
        case(mode)
            0: {c_out, result} = { co, added };
            1: {c_out, result} = { co, added };
            2: {c_out, result} = { 1'b0, a ^ b };
            3: {c_out, result} = { 1'b0, a & b };
        default
            {c_out, result} = { co, added };
        endcase     
    end
   
endmodule

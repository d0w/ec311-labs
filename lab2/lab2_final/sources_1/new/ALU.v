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
        input [3:0] a,
        input [3:0] b,
//        input mode,
        input [3:0] operation,
        input c_in,
        output reg c_out,
        output reg [3:0] result
    );
    
    //wire [3:0] w1;
    wire [3:0] added;
    wire co;
 
    //wire cin;
    //subtractor s1(.mode(operation == 3'b011 || operation == 3'b101 ? 1 : 0), .in(operation == 3'b101 ? a : b), .out(w1));
    
    //assign cin = operation == 3'b011 || operation == 3'b101 ? 1 : c_in; 
    
    carry_select_adder carry1(.cin(c_in), .a(a), .b(b), .sum(added), .cout(co));

    always @(*)
    begin
//        if (mode == 0) begin
            case(operation)
                4'b0000: begin c_out = 1'b0; result = a & b;  end
                4'b0001: begin c_out = 1'b0; result = a | b;  end
                4'b0010: begin  c_out = 1'b0; result = ~(a & b); end
                4'b0011: begin c_out = 1'b0; result = ~(a | b);  end
                4'b0100: begin c_out = 1'b0; result = a ^ b;  end
                4'b0101: begin c_out = 1'b0; result = ~(a ^ b);  end
                4'b0110: begin c_out = 1'b0; result = ~a;  end
                4'b0111: begin c_out = 1'b0; result = ~b;  end
                4'b1000: begin c_out = 1'b1; result = ~a+1;  end
                4'b1001: begin c_out = 1'b1; result = ~b+1;  end
                4'b1010: begin c_out = co; result = added; end
                4'b1011: begin {c_out, result} = a - b;  end
                4'b1100: begin {c_out, result} = a * b;  end
                4'b1101: begin {c_out, result} = b - a;  end
                4'b1110: begin {c_out, result} = a + 1;  end
                4'b1111: begin {c_out, result} = a - 1;  end
            endcase

    end
   
endmodule






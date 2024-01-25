`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2023 05:59:07 PM
// Design Name: 
// Module Name: device_testbench
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


module device_testbench(
        
    );
    reg [3:0] A;
    reg [3:0] B;
    reg c_in;
    reg control;
    reg [3:0] opCode;
    wire c_out;
    wire [7:0] anode;
    wire [6:0] cathode;
    integer i, j, cin, cont, op;
    
    full_device device(opCode, A, B, c_in, control, c_out, cathode, anode);
    
    initial
    begin
    A = 0;
    B = 0;
    c_in = 0;
    control = 0;
    opCode = 0;
    for (cont = 1; cont < 2; cont = cont+1) begin
        control = cont;
        for (op = 0; op < 16; op = op+1) begin
            opCode = op;
            for (cin = 0; cin < 2; cin = cin+1) begin
                c_in = cin;
                
                for (i = 0; i < 16; i = i+1) begin
                    for (j = 0; j < 16; j = j+1) begin
                        A = i;
                        B = j;
                        #5;
                    end
                end
            end
            
            
        end
    end
    end
    
endmodule

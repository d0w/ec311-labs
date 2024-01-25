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
        input out_control, // controls whether code or result is shown
        input [3:0] opCode, // op code
        //input [3:0] result, // result of ALU
        input clock_100Mhz, // 100 Mhz clock source on Basys 3 FPGA
        input [15:0] number, // result of ALU
        output reg [6:0] LED_out,
        output reg warning_out,
        output reg [7:0] Anode_Activate // anode signals of the 7-segment LED display
    );
    
    reg [6:0] LED_out1;
    reg [6:0] LED_out2;
    reg [6:0] LED_out3;
//    ALU a1(.a(A), .b(B), .mode(operation[3]), .operation(operation[2:0]), .c_in(1'b0), .sum(w1), .c_out(cout));
    reg [3:0] LED_BCD;
    reg [19:0] refresh_counter; 
     
    wire [1:0] LED_activating_counter; 
    
    always @(*)
    begin
        case(number[3:0]) // check 4 least signifcant bits
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
        
        case(LED_BCD)
        4'b0000: LED_out3 = 7'b0000001; // "0"     
        4'b0001: LED_out3 = 7'b1001111; // "1" 
        4'b0010: LED_out3 = 7'b0010010; // "2" 
        4'b0011: LED_out3 = 7'b0000110; // "3" 
        4'b0100: LED_out3 = 7'b1001100; // "4" 
        4'b0101: LED_out3 = 7'b0100100; // "5" 
        4'b0110: LED_out3 = 7'b0100000; // "6" 
        4'b0111: LED_out3 = 7'b0001111; // "7" 
        4'b1000: LED_out3 = 7'b0000000; // "8"     
        4'b1001: LED_out3 = 7'b0000100; // "9" 
        default: LED_out3 = 7'b0000001; // "0"
        endcase
        
        // for temperature sensing
        if (opCode == 14 || opCode == 15) begin
            
            case(LED_activating_counter)
            2'b00: begin
                Anode_Activate = 8'b01111111; 
                // activate LED1 and Deactivate LED2, LED3, LED4
                LED_BCD = number/1000;
                // the first digit of the 16-bit number
                  end
            2'b01: begin
                Anode_Activate = 8'b10111111; 
                // activate LED2 and Deactivate LED1, LED3, LED4
                LED_BCD = (number % 1000)/100;
                // the second digit of the 16-bit number
                  end
            2'b10: begin
                Anode_Activate = 8'b11011111; 
                // activate LED3 and Deactivate LED2, LED1, LED4
                LED_BCD = ((number % 1000)%100)/10;
                // the third digit of the 16-bit number
                    end
            2'b11: begin
                Anode_Activate = 8'b11101111; 
                // activate LED4 and Deactivate LED2, LED3, LED1
                LED_BCD = ((number % 1000)%100)%10;
                // the fourth digit of the 16-bit number    
                   end
            endcase
        end
        
        // LED_OUT SETTING
        // 14 and 15 will be temperature
        if (opCode == 4'b1110) begin
            if (number > 'd80) warning_out = 1;
            else warning_out = 0;
            LED_out = LED_out3;
        end
        
        if (opCode == 4'b1111) begin
            if (number > 'd30) warning_out = 1;
            else warning_out = 0;
            LED_out = LED_out3;
        end

        
        else begin
            warning_out = 0;
            LED_out = out_control ? LED_out1 : LED_out2;
            Anode_Activate = 8'b01111111;
        end
        //LED_out = 7'b0000001
    end
   
   


    // decoder to generate anode signals 
    always @(posedge clock_100Mhz)
    begin 
        if (refresh_counter > 1048575)
            refresh_counter <= 0;
        refresh_counter <= refresh_counter + 1;
    end 
    assign LED_activating_counter = refresh_counter[19:18];

    
endmodule

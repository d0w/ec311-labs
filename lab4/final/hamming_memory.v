`timescale 1ns / 1ps
module hamming_memory(
        Address,
   	    MemRead, 
		ReadData,
    	MemWrite,
		WriteData,
		err
    );
    
input MemRead, MemWrite; 
input [8:0] Address; // 9 bit address, largest is 511
input [15:0]   WriteData;
output reg [15:0]  ReadData;
output wire err;     // set this error flag only for double-errors (which are uncorrectable)
// If you need extra registers, you can instantiate them here.
// 
// YOUR CODE HERE 
// 
reg [4:0] parity;

// 512 entries in RAM. Instantiate memory.
localparam MEM_DEPTH = 1 << 9;
reg [21:0]     ram[0:MEM_DEPTH-1]; // 16 bits + 5 parity bits
reg [21:0] fetchedData; 
// bit position:  1   2     3   4    5  6  7    8   9 10 11 12 13 14 15  16   17 ... 21
// value:         p_1 p_2 data p_4  |< data >| p_8 |<------ data ---->| p_16  |< data >|
/* Initialize memory. Do not modify. */
integer i;
initial begin
	for (i=0;i<MEM_DEPTH;i=i+1) begin
		ram[i] = 0;
	end
end
always@(MemRead or MemWrite or Address or WriteData) begin
	if (MemRead) begin
	    fetchedData = ram[Address];
		//ReadData = ram[Address];
		// Currently, the above line just reads the data from the memory at that address.
		// Comment out that line and add your error-correcting code according to the instructions
		// You should be outputting to "ReadData" at the end.
		// 
        // YOUR CODE HERE 
        // 
        parity[0] <= ram[Address][0] ^ ram[Address][2] ^ ram[Address][4] ^ ram[Address][6] ^ ram[Address][8] ^ ram[Address][10] ^ ram[Address][12] ^ ram[Address][14] ^ ram[Address][16] ^ ram[Address][18] ^ ram[Address][20];
	    parity[1] <= ram[Address][1] ^ ram[Address][2] ^ ram[Address][5] ^ ram[Address][6] ^ ram[Address][9] ^ ram[Address][10] ^ ram[Address][13] ^ ram[Address][14] ^ ram[Address][17] ^ ram[Address][18];
	    parity[2] <= ram[Address][3] ^ ram[Address][4] ^ ram[Address][5] ^ ram[Address][6] ^ ram[Address][11] ^ ram[Address][12] ^ ram[Address][13] ^ ram[Address][14] ^ ram[Address][20];
	    parity[3] <= ram[Address][7] ^ ram[Address][8] ^ ram[Address][9] ^ ram[Address][10] ^ ram[Address][11] ^ ram[Address][12] ^ ram[Address][13] ^ ram[Address][14];
	    parity[4] <= ram[Address][15] ^ ram[Address][16] ^ ram[Address][17] ^ ram[Address][18] ^ ram[Address][19] ^ ram[Address][20];
	    if(| parity) begin
	       ram[Address][parity] = ~ram[Address][parity];
	    end

      ReadData = { ram[Address][20:16], ram[Address][14:8], ram[Address][6:4], ram[Address][2] };
       
	end
	
	if (MemWrite) begin

	   ram[Address] = { 1'b0, WriteData[15:11], 1'b0, WriteData[10:4], 1'b0, WriteData[3:1], 1'b0, WriteData[0], 1'b0, 1'b0 };
	   ram[Address][0] = ram[Address][2] ^ ram[Address][4] ^ ram[Address][6] ^ ram[Address][8] ^ ram[Address][10] ^ ram[Address][12] ^ ram[Address][14] ^ ram[Address][16] ^ ram[Address][18] ^ ram[Address][20];
	   ram[Address][1] = ram[Address][2] ^ ram[Address][5] ^ ram[Address][6] ^ ram[Address][9] ^ ram[Address][10] ^ ram[Address][13] ^ ram[Address][14] ^ ram[Address][17] ^ ram[Address][18];
	   ram[Address][3] = ram[Address][4] ^ ram[Address][5] ^ ram[Address][6] ^ ram[Address][11] ^ ram[Address][12] ^ ram[Address][13] ^ ram[Address][14] ^ ram[Address][20];
	   ram[Address][7] = ram[Address][8] ^ ram[Address][9] ^ ram[Address][10] ^ ram[Address][11] ^ ram[Address][12] ^ ram[Address][13] ^ ram[Address][14];
	   ram[Address][15] = ram[Address][16] ^ ram[Address][17] ^ ram[Address][18] ^ ram[Address][19] ^ ram[Address][20];
	   ram[Address][21] = ram[Address][0] ^ ram[Address][1] ^ ram[Address][2] ^ ram[Address][3] ^ ram[Address][4] ^ ram[Address][5] ^ ram[Address][6] ^ ram[Address][7] ^ ram[Address][8] ^ ram[Address][9] ^  ram[Address][10] ^ ram[Address][11] ^ ram[Address][12] ^ ram[Address][13] ^ ram[Address][14] ^ ram[Address][15] ^ ram[Address][16] ^ ram[Address][17] ^ ram[Address][18] ^ ram[Address][19] ^ ram[Address][20];
//       $display("%b", ~(^ram[Address]));
	end
end
assign err = !(|parity) & ~(^ram[Address]);
endmodule


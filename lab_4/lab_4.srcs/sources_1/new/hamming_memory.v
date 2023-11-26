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
output reg err;     // set this error flag only for double-errors (which are uncorrectable)

// If you need extra registers, you can instantiate them here.
// 
// YOUR CODE HERE 
// 
reg p1, p2, p4, p8, p16;
reg [20:0] temp;

reg c1, c2, c4, c8, c16;

// 512 entries in RAM. Instantiate memory.
localparam MEM_DEPTH = 1 << 9;
reg [21:0]     ram[0:MEM_DEPTH-1]; // 16 bits + 5 parity bits

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
		//ReadData = ram[Address];
		// Currently, the above line just reads the data from the memory at that address.
		// Comment out that line and add your error-correcting code according to the instructions
		// You should be outputting to "ReadData" at the end.
		// 
        // YOUR CODE HERE 
        // 
	
//         c1 = read_temp[0] ^ read_temp[2] ^ read_temp[4] ^ read_temp[6] ^ read_temp[8] ^ read_temp[10] ^ read_temp[12] ^ read_temp[14] ^ read_temp[16] ^ read_temp[18] ^ read_temp[20];
//         c2 = read_temp[1] ^ read_temp[2] ^ read_temp[5] ^ read_temp[6] ^ read_temp[9] ^ read_temp[10] ^ read_temp[13] ^ read_temp[14] ^ read_temp[17] ^ read_temp[18];
//         c4 = read_temp[3] ^ read_temp[4] ^ read_temp[5] ^ read_temp[6] ^ read_temp[11] ^ read_temp[12] ^ read_temp[13] ^ read_temp[14] ^ read_temp[19] ^ read_temp[20];
//         c8 = read_temp[7] ^ read_temp[8] ^ read_temp[9] ^ read_temp[10] ^ read_temp[11] ^ read_temp[12] ^ read_temp[13] ^ read_temp[14];
//         c16 = read_temp[15] ^ read_temp[16] ^ read_temp[17] ^ read_temp[18] ^ read_temp[19] ^ read_temp[20];
//        c1 = read_temp[21] ^ read_temp[19] ^ read_temp[17] ^ read_temp[15] ^ read_temp[13] ^ read_temp[11] ^ read_temp[9] ^ read_temp[7] ^ read_temp[5] ^ read_temp[3] ^ read_temp[1];
//        c2 = read_temp[20] ^ read_temp[19] ^ read_temp[16] ^ read_temp[15] ^ read_temp[12] ^ read_temp[11] ^ read_temp[8] ^ read_temp[7] ^ read_temp[4] ^ read_temp[3];
//        c4 = read_temp[18] ^ read_temp[17] ^ read_temp[16] ^ read_temp[15] ^ read_temp[10] ^ read_temp[9] ^ read_temp[8] ^ read_temp[7] ^ read_temp[2] ^ read_temp[1];
//        c8 = read_temp[14] ^ read_temp[13] ^ read_temp[12] ^ read_temp[11] ^ read_temp[10] ^ read_temp[9] ^ read_temp[8] ^ read_temp[7];
//        c16 = read_temp[6] ^ read_temp[5] ^ read_temp[4] ^ read_temp[3] ^ read_temp[2] ^ read_temp[1];
        
        c1 = ram[Address][21] ^ ram[Address][19] ^ ram[Address][17] ^ ram[Address][15] ^ ram[Address][13] ^ ram[Address][11] ^ ram[Address][9] ^ ram[Address][7] ^ ram[Address][5] ^ ram[Address][3] ^ ram[Address][1];
        c2 = ram[Address][20] ^ ram[Address][19] ^ ram[Address][16] ^ ram[Address][15] ^ ram[Address][12] ^ ram[Address][11] ^ ram[Address][8] ^ ram[Address][7] ^ ram[Address][4] ^ ram[Address][3];
        c4 = ram[Address][18] ^ ram[Address][17] ^ ram[Address][16] ^ ram[Address][15] ^ ram[Address][10] ^ ram[Address][9] ^ ram[Address][8] ^ ram[Address][7] ^ ram[Address][2] ^ ram[Address][1];
        c8 = ram[Address][14] ^ ram[Address][13] ^ ram[Address][12] ^ ram[Address][11] ^ ram[Address][10] ^ ram[Address][9] ^ ram[Address][8] ^ ram[Address][7];
        c16 = ram[Address][6] ^ ram[Address][5] ^ ram[Address][4] ^ ram[Address][3] ^ ram[Address][2] ^ ram[Address][1];
        

 
         if ({ c16, c8, c4, c2, c1 } != 0 && { c16, c8, c4, c2, c1 } != 1 && { c16, c8, c4, c2, c1 } != 2 && { c16, c8, c4, c2, c1 } != 4 && { c16, c8, c4, c2, c1 } != 8 && { c16, c8, c4, c2, c1 } != 16) begin
//            read_temp[21 - { c16, c8, c4, c2, c1 }] = ~read_temp[21 - { c16, c8, c4, c2, c1 }];
            ram[Address][22 - { c16, c8, c4, c2, c1 } ] = ~ram[Address][22 - { c16, c8, c4, c2, c1 }];
         end
    
         
         err = (c16 || c8 || c4 || c2 || c1) && ~(^ram[Address]);
        $display("%b", ram[Address]);
		ReadData = { ram[Address][19], ram[Address][17:15], ram[Address][13:7], ram[Address][5:1] };
		
	end
	
	if (MemWrite) begin
		//ram[Address] = WriteData;
		// Currently, the above line just writes the data to the memory at that address.
		// Comment out that line and add your parity-bits code according to the instructions.
		// You should be setting all 22 bits of ram[Address].
		// 
        // YOUR CODE HERE 
        // 
        p1 = WriteData[15] ^ WriteData[14] ^ WriteData[12] ^ WriteData[11] ^ WriteData[9] ^ WriteData[7] ^ WriteData[5] ^ WriteData[4] ^ WriteData[2] ^ WriteData[0];
        p2 = WriteData[15] ^ WriteData[13] ^ WriteData[12] ^ WriteData[10] ^ WriteData[9] ^ WriteData[6] ^ WriteData[5] ^ WriteData[3] ^ WriteData[2];
        p4 = WriteData[14] ^ WriteData[13] ^ WriteData[12] ^ WriteData[8] ^ WriteData[7] ^ WriteData[6] ^ WriteData[5] ^ WriteData[1] ^ WriteData[0];
        p8 = WriteData[11] ^ WriteData[10] ^ WriteData[9] ^ WriteData[8] ^ WriteData[7] ^ WriteData[6] ^ WriteData[5];
        p16 = WriteData[4] ^ WriteData[3] ^ WriteData[2] ^ WriteData[1] ^ WriteData[0];
        
//         p1 = WriteData[0] ^ WriteData[1] ^ WriteData[3] ^ WriteData[4] ^ WriteData[6] ^ WriteData[8] ^ WriteData[10] ^ WriteData[11] ^ WriteData[13] ^ WriteData[15];
//         p2 = WriteData[0] ^ WriteData[2] ^ WriteData[3] ^ WriteData[5] ^ WriteData[6] ^ WriteData[9] ^ WriteData[10] ^ WriteData[12] ^ WriteData[13];
//         p4 = WriteData[1] ^ WriteData[2] ^ WriteData[3] ^ WriteData[7] ^ WriteData[8] ^ WriteData[9] ^ WriteData[10] ^ WriteData[14] ^ WriteData[15];
//         p8 = WriteData[4] ^ WriteData[5] ^ WriteData[6] ^ WriteData[7] ^ WriteData[8] ^ WriteData[9] ^ WriteData[10];
//         p16 = WriteData[11] ^ WriteData[12] ^ WriteData[13] ^ WriteData[14] ^ WriteData[15];
        

        ram[Address][21:1] = { p1, p2, WriteData[15], p4, WriteData[14:12], p8, WriteData[11:5], p16, WriteData[4:0] };
        ram[Address][0] = ^(ram[Address][21:1]);
       
		
	end
end

endmodule

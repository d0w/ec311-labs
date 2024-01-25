Names: 
Derek Xu (U18821640), 
Michael Waetzman (U39730459)

Summary:
The ALU relies on a mode input, 2 3bit inputs, a carry-in input, and a c_out and result output. 
Within the ALU, we first run the b input into a MUX that checks if the mode is 1, and if so, inverts b.
We also assign the carry in to be 1 if the mode is 1, if not then the carry in wire is equal to input c_in.
Then the input a and the output from the inverter as well as the carry in are fed into the ripple adder.
Within the ripple adder uses multiple modules of full adders which each take in two bits and output a carry out or a 1/0 depending
on the two bit input. The carry outs of each full adder feed into the next full adder, and each output from each full adder
represents a bit in the output.
Back in the ALU, we have a case which checks the mode and if its 0 or 1, then simply make output the output from the adder.
If mode is 2, XOR a and b, and if 3, then AND a and b.
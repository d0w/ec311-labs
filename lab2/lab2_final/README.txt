
Name: Derek Xu
UID: U18821640

The project's top module is within the "full_device" module which houses the ALU, decoder, and the
display modules. The device takes in the opcode and two inputs which first enter the 
ALU, the output of the ALU is then sent to the decoder along with the opcode and the
output mode. The decoder then outputs the display signals based on the opcode, the ALU
input, and the mode. This signal is then sent to the display module which outputs
an 8 bit value for the anode of the display and a 7 bit value for the cathode of the display.

The ALU utilizes a carry_select_adder (you will see a ripple_adder and a subtracter but
these are unused for the top level device and are there for testing purposes). The
carry select adder also utilizes a 2x1 mux which is used to select between the carry signal
or the non carry signal.

You will see the test benches for the ALU, carry select adder, decoder, display, and the
various adders used for the carry select adder. Each of these test all possible values for each
module. Please note some of the modules will start at testing inputs when mode=1 or something of the sort which is meant
for testing specifically the arithmetic of the ALU and showing the output on the display instead
of what opmode is active.



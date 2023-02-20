`define DELAY 20
module or_32bit_testbench(); 
	reg [31:0] a, b;
	wire [31:0] res;

	or_32bit or_32bit_test(res, a, b);

	initial begin
		a = 32'b1001_0000_0000_0000_0000_0000_0000_1010; b =32'b0001_0000_0000_0000_0000_0000_0001_1110;//or
		#`DELAY;
		a = 32'b1111_0000_1110_0000_0000_0110_0000_1010; b =32'b0001_0000_0000_0000_1111_1100_0001_1111;//or
		#`DELAY;		
	end
	  
	initial begin
	$monitor("time = %2d, a =%32b, b=%32b, res=%32b", $time, a, b, res);
	end
endmodule
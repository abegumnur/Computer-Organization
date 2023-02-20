`define DELAY 20
module nor_32bit_testbench(); 
	reg [31:0] a, b;
	wire [31:0] res;

	nor_32bit nor_32bit_test(res, a, b);

	initial begin
		a = 32'b1001_0000_0000_0000_0000_0000_0000_1010; b =32'b0001_0000_0000_0000_0000_0000_0001_1110;//nor
		#`DELAY;
		a = 32'b1111_0000_0100_0110_0000_0000_0011_1010; b =32'b0111_0000_1100_0000_0000_0110_0001_1111;//nor
		#`DELAY;		
	end
	  
	initial begin
	$monitor("time = %2d, a =%32b, b=%32b, res=%32b", $time, a, b, res);
	end
endmodule
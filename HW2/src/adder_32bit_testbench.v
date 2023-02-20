`define DELAY 20
module adder_32bit_testbench();

	reg signed [31:0] a, b;
	wire signed [31:0] sum;
	reg cin;
	wire cout;
	
	adder_32bit adder32(cout, sum, a, b, cin);
	
	initial 
		begin
			a = 32'b00000001000000000000000000000111; b =32'b00000000000000000000000000111111; cin = 1'b0;
			#`DELAY;
			a = 32'b00000000000000000000000010011011; b =32'b00000000000000000000000000111111; cin = 1'b0;
			#`DELAY;
			a = 32'b11111111111111111111111111111110; b =32'b11111111111111111111111111101110; cin = 1'b0;
			#`DELAY;
			a = 32'b11111111111111111111001000010011; b =32'b00000000000000000100000000100000; cin = 1'b0;
			#`DELAY;
			a= 32'b11111111111111111111011000010011; b =32'b00000000000000000000000000000000; cin = 1'b1;
			#`DELAY;
			a = 32'b01111111111111111111111111111111; b =32'b00000000000000000000000001000011; cin = 1'b0;
			#`DELAY;
		end

	
	initial 
		begin
			$monitor("time=%2d, a=%32b, b=%32b, cin=%1b, cout=%1b, sum=%32b",$time, a, b, cin, cout, sum);
		end
		
endmodule	
	
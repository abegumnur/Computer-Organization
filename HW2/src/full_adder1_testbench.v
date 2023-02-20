`define DELAY 20
module full_adder1_testbench();

	reg a, b, cin;
	wire cout, sum;
	
	full_adder1 fa(cout, sum, a, b, cin);
	
	
	initial
		begin
			a = 1'b0; b = 1'b0; cin = 1'b0;
			#`DELAY
			a = 1'b0; b = 1'b0; cin = 1'b1;
			#`DELAY
			a = 1'b0; b = 1'b1; cin = 1'b0;
			#`DELAY
			a = 1'b0; b = 1'b1; cin = 1'b1;
			#`DELAY
			a = 1'b1; b = 1'b0; cin = 1'b0;
			#`DELAY
			a = 1'b1; b = 1'b0; cin = 1'b1;
			#`DELAY
			a = 1'b1; b = 1'b1; cin = 1'b0;
			#`DELAY
			a = 1'b1; b = 1'b1; cin = 1'b1;
		end
		
	initial 
		begin
		
		$monitor("time = %2d, a =%1b, b=%1b, cin=%1b, sum=%1b, cout=%1b", $time, a, b, cin, sum, cout);
		end
		
		
endmodule
		
		
		
		
		
		
		
		
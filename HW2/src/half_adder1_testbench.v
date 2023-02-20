`define DELAY 20
module half_adder1_testbench();
	reg a, b;
	wire cout, sum;
	
	half_adder1 ha(cout, sum, a, b);
	
	initial
		begin
			a = 1'b0; b = 1'b0;
			#`DELAY;
			a = 1'b0; b = 1'b1;
			#`DELAY;
			a = 1'b1; b = 1'b0; 
			#`DELAY;
			a = 1'b1; b = 1'b1; 
			#`DELAY;
		end
		
	initial 
		begin
		$monitor("time = %2d, a =%1b, b=%1b, sum=%1b, cout=%1b", $time, a, b, sum, cout);
		end
		
		
endmodule
					
`define DELAY 20
module mux2x1_testbench();

	reg sel, in0, in1;
	wire out;
	
	mux2x1 mux2x1_test(out, sel, in0, in1);
	
	initial 
		begin
			in0 = 1'b1; in1 = 1'b0; sel =1'b0;	
			#`DELAY;
			in0 = 1'b0; in1 = 1'b0; sel =1'b1;	
			#`DELAY;
			in0 = 1'b1; in1 = 1'b0; sel =1'b0;	
			#`DELAY;
		end
	  
	initial begin
	$monitor("time = %2d, in0 = %1b, in1 = %1b, sel = %1b, out = %1b", $time, in0, in1, sel, out);
	end	
	
endmodule

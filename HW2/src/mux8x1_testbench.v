`define DELAY 20
module mux8x1_testbench();

	reg [2:0] s;
	reg in0, in1, in2, in3, in4, in5, in6, in7;
	wire out;
	
	mux8x1 mux8x1_test(out, s, in0, in1, in2, in3, in4, in5, in6, in7);
	
	
	initial
		begin
			s = 3'b000; in0 =1'b1; in1 = 1'b0; in2 = 1'b0;in3 = 1'b1;in4 = 1'b0;in5 = 1'b0;in6 = 1'b1;in7 = 1'b1;
			#`DELAY;
			s = 3'b001; in0 =1'b1; in1 = 1'b0; in2 = 1'b0;in3 = 1'b1;in4 = 1'b0;in5 = 1'b0;in6 = 1'b1;in7 = 1'b1;
			#`DELAY;
			s = 3'b010; in0 =1'b1; in1 = 1'b0; in2 = 1'b0;in3 = 1'b1;in4 = 1'b0;in5 = 1'b0;in6 = 1'b1;in7 = 1'b1;
			#`DELAY;
			s = 3'b011; in0 =1'b1; in1 = 1'b0; in2 = 1'b0;in3 = 1'b1;in4 = 1'b0;in5 = 1'b0;in6 = 1'b1;in7 = 1'b1;
			#`DELAY;
			s = 3'b100; in0 =1'b1; in1 = 1'b0; in2 = 1'b0;in3 = 1'b1;in4 = 1'b0;in5 = 1'b0;in6 = 1'b1;in7 = 1'b1;
			#`DELAY;
			s = 3'b101; in0 =1'b1; in1 = 1'b0; in2 = 1'b0;in3 = 1'b1;in4 = 1'b0;in5 = 1'b0;in6 = 1'b1;in7 = 1'b1;
			#`DELAY;
			s = 3'b110; in0 =1'b1; in1 = 1'b0; in2 = 1'b0;in3 = 1'b1;in4 = 1'b0;in5 = 1'b0;in6 = 1'b1;in7 = 1'b1;
			#`DELAY;
			s = 3'b111; in0 =1'b1; in1 = 1'b0; in2 = 1'b0;in3 = 1'b1;in4 = 1'b0;in5 = 1'b0;in6 = 1'b1;in7 = 1'b1;
			#`DELAY;
		end

	initial 
		begin
			$monitor("time=%2d, in7=%1b, in6=%1b, in5=%1b, in4=%1b, in3=%1b, in2=%1b, in1=%1b, in0=%1b, s[2]=%1b, s[1]=%1b, s[0]=%1b, out=%1b", $time, in7, in6, in5, in4, in3, in2, in1, in0,s[2], s[1], s[0], out);
		end
		
		
		
endmodule
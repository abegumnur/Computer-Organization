module mux8x1(out, s, in0, in1, in2, in3, in4, in5, in6, in7);

	input in0, in1, in2, in3, in4, in5, in6, in7;
	input [2:0] s;
	output out;
	
	wire [5:0] x;
	
	/*	7 mux2x1 were used, 4 for the first level, 2 for the second, and 1 for the last one	*/
	/*	since 8/2=4 & 4/2=2 & 2/2=1 makes 4 + 2 + 1	*/ 
	
	mux2x1 layer1_1(x[0], s[0], in0, in1);
	mux2x1 layer1_2(x[1], s[0], in2, in3);
	mux2x1 layer1_3(x[2], s[0], in4, in5);
	mux2x1 layer1_4(x[3], s[0], in6, in7);

	mux2x1 layer2_1(x[4], s[1], x[0], x[1]);
	mux2x1 layer2_2(x[5], s[1], x[2], x[3]);

	mux2x1 layer3_1(out, s[2], x[4], x[5]);
	
	
endmodule
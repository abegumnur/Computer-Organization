module mux4x1(out, sel0, sel1, in0, in1, in2, in3);

	input sel0, sel1, in0, in1, in2, in3;
	output out;
	wire x1, x2;
	
	mux2x1 mux2x1_first_layer_1(x1, sel0, in0, in1);
	mux2x1 mux2x1_first_layer_2(x2, sel0, in2, in3);
	
	mux2x1 mux2x2_second_layer(out, sel1, x1, x2);
	
endmodule
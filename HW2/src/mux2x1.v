module mux2x1(out, sel, in0, in1);
	
	output out;
	input in0, in1, sel;
	wire [1:0] temp;
	wire not_sel;
	
	/* outputs in0 if the selection is 0 and
	in1 if selection is 1	*/
	
	and(temp[0], in1, sel);
	not(not_sel, sel);
	and(temp[1], not_sel, in0);
	
	or(out, temp[0], temp[1]);
	
endmodule

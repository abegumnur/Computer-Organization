module nor1(res, a, b);
	input a, b;
	output res;
	wire a_or_b;
	
	or(a_or_b, a, b);
	not(res, a_or_b);

endmodule
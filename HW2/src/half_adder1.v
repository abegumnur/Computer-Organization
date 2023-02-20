module half_adder1(cout, sum, a, b);
	input a, b;
	output cout, sum;
	
	/*	xor'ing a and b to calculate a + b
	and and'ing a and b to calculate the carry_out	*/
	
	xor1 sum_of_digits(sum, a, b);
	and carry_of_sum(cout, a, b);
	
endmodule
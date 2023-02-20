module full_adder1(cout, sum, a, b, cin);
	input a, b, cin;
	output sum, cout;
	
	wire temp_sum, c1, c2;
	
	/*	one can construct a full-adder using two half-adders  by
	inputting a and b to half adder at first. then the result of the
	first half add operation and the carry_in is inputted to another
	half addder to get the desired result	*/
	
	half_adder1 first_sum(c1, temp_sum, a, b);
	half_adder1 second_sum(c2, sum, temp_sum, cin);
	
	or final_carry_out(cout, c1, c2);
	
endmodule
	
	
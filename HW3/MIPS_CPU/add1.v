module add1 (a,b,ci,s,co); // full adder
	input a, b, ci; // inputs: a, b, carry_in
	output s, co; // outputs: sum, carry_out
	
	assign s = a ^ b ^ ci; // sum of inputs
	assign co = a & b | b & ci | ci & a; // carry_out

endmodule
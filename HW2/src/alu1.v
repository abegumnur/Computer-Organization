module alu1(c_i_plus_1, result, a, b, c_i, alu_op); 


	output c_i_plus_1, result;
	input a, b, c_i;
	input [2:0] alu_op;
	
	wire alu_op2_not, alu_op0_not;
	wire add_op, sub_op;
	wire b_not, b_select;
	wire sum_of_ab;
	wire a_xor_b, a_and_b, a_or_b, a_nor_b;
	
	
	/*	next part calculates c_i_plus_1 for a + b if alu_op[2] = 0 && alu_op_[0] = 0
	because the opcode for addition and multiplication  is 000 and 001 respectively.
	using the minterms of these two opcodes we can say if alu_op_[2] & alu_op_[0] is 0 
	calculate the addition of a and b and c_i_plus_1 for addition operation	*/
	
	not not_alu2(alu_op2_not, alu_op[2]);
	not not_alu0(alu_op0_not, alu_op[0]);
	and add_op_for_c_i_plus_1(add_op, alu_op0_not, alu_op2_not); 
	
	/*	if add_op is 1 we need the b value and not b' but since we only use one adder 
	for addition and subtraction, b-b' values have to be calculated depending on the 
	alu opcodes	*/
	
	not(sub_op, add_op);
	xor(b_select, sub_op, b); 
	
	/*	the above part will assign b to b_select if the sub_op is 0 and b' if the sub_op is 1	*/ 

	
	/*	calculating the addition a + b or the subtraction a - b	*/
	
	full_adder1 adder_ab(c_i_plus_1, sum_of_ab, a, b_select, c_i); 
	
	
	xor1 my_xor_ab(a_xor_b, a, b); /*	calculating a xor b */
	and and_a_b(a_and_b, a, b); /*	calculating a and b	*/
	or or_a_b(a_or_b, a, b); /*	calculating a or b	*/
	nor1 my_nor_ab(a_nor_b, a, b); /*	calculating a nor b	*/
	
	 
	mux8x1 mux8x1_select_op(result, alu_op, sum_of_ab, sum_of_ab, sum_of_ab, a_xor_b, a_and_b, a_or_b, sum_of_ab, a_nor_b); 
	/* for multiplication and addition operations a + b is passed by the multiplexer and,
	for subtraction and set less than operations a - b is passed by the multiplexer	*/

	
endmodule
	
	
	
	
	
	
	
	
	
	
	
	
	
	
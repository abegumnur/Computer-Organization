module alu_32bit(final_result, alu_op, a, b);

	input [31:0] a, b;
	input [2:0] alu_op;
	output [31:0] final_result;
	
	wire alu_op2_not, alu_op0_not, add_op, sub_op;
	wire [31:0] slt_result, result;
	wire [32:0] carry;
	wire overflow, v_set; 
	wire slt_alu_op;
	
	/*	trying to find out whether addition or subtraction is 
	going to be executed by checking the alu_op values: (000) = add & (001) = mult 
	since addition is only required for these two operations	*/
	
	not not_alu2_for_alu32(alu_op2_not, alu_op[2]);
	not not_alu0_for_alu32(alu_op0_not, alu_op[0]);
	and add_op_for_c_i_plus_1_for_alu32(add_op, alu_op0_not, alu_op2_not);	 

	/*	for choosing between the set-less-than result 
	and the result of the other operations, opcode
	for set-less-than is 110	*/
	
	and calc_slt_alu_op(slt_alu_op, alu_op[2], alu_op[1], alu_op0_not); 
	
	/*	if sub_op is 1, carry_in for the least significant 
	bit must be 1 to get the two's complement of b*/
	
	not sub_op_for_alu32(sub_op, add_op); 
		
	/*	input sub_op instead of cin for the least significant bit
	sub_op is 1 if the operation requires a subtraction and 0 otherwise	*/
	
	alu1 alu1_least_sig(carry[1], result[0], a[0], b[0], sub_op, alu_op);
	
	
	/*	calculating the rest of the bits except the most significant bit 
	since we also have to calculate the overflow for it to set it right */
	
	genvar i;
		generate
			for( i = 1; i<31; i = i+1 )
				begin: parallel_loop_alu
					alu1 alu_until_most_sig(carry[i+1], result[i], a[i], b[i], carry[i], alu_op);
				end
		endgenerate
			
	/* calculating the most significant bit 	*/
	alu1 alu_most_sig(carry[32], result[31], a[31], b[31], carry[31], alu_op);
	
	/*	the program for detecting an overflow using the most significant bit	*/ 
	xor1 calc_overflow(overflow, carry[32], carry[31]);
	xor1 calc_v_set(v_set, overflow, result[31]); 
	
	generate
		for( i = 1; i<32; i = i+1 ) /*	set the result bits for slt to 0 except the least significant bit	*/
			begin: parallel_loop_extender
				and( slt_result[i], 1'b0, 1'b0);
			end
	endgenerate
	
	or invert_sign_bit(slt_result[0], v_set, 1'b0); 
	
	/*	choosing between the slt result and the result of other opeatons	*/ 
	generate
		for( i = 0; i<32; i = i+1 )
			begin: parallel_loop_final_result
				mux2x1 last_mux( final_result[i], slt_alu_op, result[i], slt_result[i]);
			end
	endgenerate
	
	

	
endmodule
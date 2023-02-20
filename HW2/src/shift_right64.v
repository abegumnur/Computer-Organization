module shift_right64(input [63:0] num, output [63:0] shifted_num);

/*	takes the result and shift it right one by one.
MSB will be zero anyway. so we can skip it and loop until 63	*/

	genvar i;
	generate
		for(i = 0; i < 63; i = i + 1)
			begin: parallel_loop_right_shift
				and(shifted_num[i], num[i+1], 1'b1);
			end
	endgenerate
	
	
	and(shifted_num[63], 1'b0, 1'b0);

endmodule

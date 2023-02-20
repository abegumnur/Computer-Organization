module adder_32bit(cout, sum, a, b, cin);
	
	input [31:0] a, b; 
	input cin;
	output [31:0] sum;
	output cout;
	
	wire temp_sum, c1, c2; /*	full_adder1 wires	*/	
	wire [30:0] prevcout; /*	31 wires are needed to interchange the cin and cout values between the 1-bit adders	*/
	
	
	full_adder1 fa0(prevcout[0], sum[0], a[0], b[0], cin); 
	/*	LSB is executed at first and it takes the desired carry in value as input
	since we will also use this 32-bit adder as a substractor by giving the inverse 
	of input b and inputting cin as 1 to take the two's complement of b	*/
		
	
	/*	the following generate loop executes the next 30 adders
	last adder will be executed separately to make sure the result is correct	*/

	genvar i;
		generate
			for( i = 1; i<31; i = i+1 )
				begin: parallel_loop_adder
					full_adder1 fa_rest( prevcout[i], sum[i], a[i], b[i], prevcout[i-1] );
				end
		endgenerate
		
		
		full_adder1 fa32bit( cout, sum[31], a[31], b[31], prevcout[30] );
		
endmodule

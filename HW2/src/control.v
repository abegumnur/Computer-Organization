module control(multiplier, multiplicand, product);
	
	input [31:0] multiplier, multiplicand;
	output [63:0] product;
	wire [63:0] temp;
	wire	add_product, shift_right, write, cout;
	
	genvar i;
	generate
		for(i = 0; i < 64; i = i + 1)
			begin: parallel_loop
				and(temp[i], 1'b0, 1'b0);
			end
	endgenerate
	
	adder_32bit add_mult(cout, temp[31:0], multiplier, temp[31:0], 1'b0); //adding the multiplier to the right-side of the product reg
	
		reg clk = 1'b0;
		always
		begin
			#5 clk = ~clk;
			#100 $finish;

		end	

	/*integer x = 0;
	always @ (posedge clk)
		//for(x = 63; x > 31; x = x - 1) //adding the multiiplicand to the left-side of product reg if the least
													//significant bit of the product is 1
		begin
			//begin: parallel_loop_mult
		if(x < 32)	
				begin
		
				my_fsm my_fsm_call( product[0], 1'b0, 1'b0, clk, add_product, shift_right, write);
					
					x <= x + 1;
				
				begin
				if	(add_product)	adder_32bit adder_32bit_mult2(cout, temp[63:32], multiplicand, temp[63:32], 1'b0); 
				end
				if	(shift_right)	shift_right64 shift_right64_temp(temp, temp); 
				end
				//else if(write) 
				end
			end*/
	
	
	
	
	
	
	
	
	

	
	
endmodule
	
module my_fsm_testbench();	

reg		product_0, is_32, Clr_, clk;
wire	add_product, shift_right, write;
	
my_fsm my_fsm_test(
			product_0,
		  	is_32,
		 	Clr_,
			clk,
			add_product,
			shift_right,
			write
	);
	
	
	
	initial
		begin
			clk = 1'b0;
		end
		
	always
		begin
			#5 clk = ~clk;
		end	
		
	initial	
		begin	
			#5 Clr_ = 1'b0;
			#5 Clr_ = 1'b1;
			#5 product_0 = 1'b0;
			#5 is_32 = 1'b0;
			#20 $finish;
		end

	initial 
		begin
			$monitor("time = %2d, Clr_ = %1b, clk = %1b, is_32=%1b, product0 = %1b, write=%1b, add_product=%1b, shift_right=%1b", 
			$time, Clr_, clk, is_32, product_0, write, add_product, shift_right);
			$monitor("time = %2d, present_state = %3b, next_state = %3b", $time, my_fsm_test.present_state, my_fsm_test.next_state); 
		end
		
endmodule

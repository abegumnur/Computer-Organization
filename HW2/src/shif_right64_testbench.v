module shift_right64_testbench();

	reg [63:0] num;
	wire [63:0] shifted_num;
	
	shift_right64 shift_right64_test(
												num,
												shifted_num
												);
   initial
		begin
			num =64'b0000_1100_0000_1111_0000_1100_0000_1111_0000_1100_0000_1111_0000_1100_0000_1111; 
			end
		
		
	initial 
		begin
			$monitor("time = %2d, num =%64b, shifted = %64b", $time, num, shifted_num); 
		end	
		
endmodule
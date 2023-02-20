`define DELAY 20
module alu1_testbench();

	wire c_i_plus_1, result;
	reg a, b, less_i, c_i;
	reg [2:0] alu_op;
	
	
	alu1 alu1_test(c_i_plus_1, result, a, b, less_i, c_i, alu_op);
	
	initial
		begin
			//add
			alu_op = 3'b000; a =1'b1; b = 1'b1; c_i = 1'b1;less_i = 1'b0;
			#`DELAY;
						//add
			alu_op = 3'b000; a =1'b0; b = 1'b1; c_i = 1'b1;less_i = 1'b0;
			#`DELAY;
						//add
			alu_op = 3'b000; a =1'b0; b = 1'b0; c_i = 1'b1;less_i = 1'b0;
			#`DELAY;			//add
			alu_op = 3'b000; a =1'b1; b = 1'b1; c_i = 1'b1;less_i = 1'b0;
			#`DELAY;
			//sub
			alu_op = 3'b001; a =1'b1; b = 1'b0; c_i = 1'b0;less_i = 1'b0;
			#`DELAY;
			//mult
			alu_op = 3'b010; a =1'b1; b = 1'b0; c_i = 1'b1;less_i = 1'b0;
			#`DELAY;
			//xor
			alu_op = 3'b011; a =1'b1; b = 1'b0; c_i = 1'b0;less_i = 1'b0;
			#`DELAY;
			//and
			alu_op = 3'b100; a =1'b1; b = 1'b0; c_i = 1'b1;less_i = 1'b0;
			#`DELAY;
			//or
			alu_op = 3'b101; a =1'b1; b = 1'b0; c_i = 1'b0;less_i = 1'b0;
			#`DELAY;
			//slt
			alu_op = 3'b110; a =1'b1; b = 1'b0; c_i = 1'b0;less_i = 1'b0;
			#`DELAY;
			//nor
			alu_op = 3'b111; a =1'b1; b = 1'b0; c_i = 1'b0;less_i = 1'b0;
			#`DELAY;		
		
		
		end
		
		
	initial 
		begin
			$monitor("time=%2d, a=%1b, b=%1b, c_i=%1b, less_i=%1b, alu_op2=%1b, alu_op1=%1b, alu_op0=%1b, c_i_plus_1=%1b, result=%1b"
	          ,$time, a, b, c_i, less_i ,alu_op[2], alu_op[1], alu_op[0], c_i_plus_1, result);
		end
endmodule
	
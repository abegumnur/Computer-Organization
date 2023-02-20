module my_fsm(
		product_0,
	  	is_32,
	 	Clr_,
		clk,
		add_product,
		shift_right,
		write
);


localparam 	A = 3'b000,
				B = 3'b001,
				C = 3'b010,
				D = 3'b011,
				E = 3'b100;
				
reg [2:0] present_state;
reg [2:0] next_state;
input product_0, is_32, Clr_, clk;
output reg add_product, shift_right, write;

always @(present_state, product_0, is_32, Clr_)
	case(present_state)
		A: if	(Clr_)		next_state = B;
			else 				next_state = A;
		B: if	(product_0)	next_state = C;
			else 				next_state = D;			
		C: 					next_state = D;
		D: 					next_state = E;
		E: if	(is_32)		next_state = A;
			else 				next_state = B;
		default:				next_state =3'bXXX;
	endcase


always @(negedge Clr_, posedge clk)
	if(!Clr_)	present_state <= A;
	else			present_state <= next_state;

always @(present_state)
	case(present_state)
		C:			begin
					add_product = 1;
					shift_right = 0;
					write = 0;
					end
		D:			begin
					shift_right	= 1;
					add_product = 0;
					write = 0;
					end
		E:			begin
					write = 1;
					add_product = 0;
					shift_right = 0;
					end
		default:	begin
					add_product = 0;
					shift_right = 0;
					write = 0;
					end
	endcase
	
endmodule






























/*wire not_s2, not_s1, not_s0, not_is_32, not_product0;
wire n1;
wire n0_1, n0_2, n0_3, n0_4;

not(not_s2, present_state[2]);
and(next_state[2], present_state[2], present_state[1], present_state[0]); //calculates n2

xor1 my_xor(n1, present_state[1], present_state[0]);
and(next_state[1], not_s2, n1); //calculates n1

not(not_s1, present_state[1]);
not(not_s0, present_state[0]);
and(n0_1, not_s2, not_s1, not_s0, Clr_);
not(not_product0, product0);
and(n0_2, not_s2, not_s1, present_state[0], not_product0);
and(n0_3, not_s2, not_s0, present_state[1]);
not(not_is_32, is_32);
and(n0_4, present_state[2], not_s1, not_s0, not_is_32);
or(next_state[0], n0_1, n0_2, n0_3, n0_4); //calculates n0

and(add_product, not_s2, present_state[1], not_s0); //calculates AP

and(shift_right, not_s2, present_state[1], present_state[0]); //calculates SR

and(write, present_state[2], not_s1, not_s0); //calculates write
				
	always  @(posedge clk, negedge Clr_)
		begin	
			if(!Clr_)
				present_state <= 3'b000;
				
			else 
				present_state <= next_state;
	end

endmodule*/
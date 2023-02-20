module alu (a,b,aluc,r,z); // 32-bit alu with a zero flag
	input [15:0] a, b; // inputs: a, b
	input [3:0] aluc; // input: alu control: // aluc[3:0]:
	output [15:0] r; // output: alu result // x 0 0 0 ADD	
	output z; // output: zero flag // x 1 0 0 SUB
	wire [15:0] d_and = a & b; // x 0 0 1 AND
	wire [15:0] d_or = a | b; // x 1 0 1 OR
	wire [15:0] d_xor = a ^	b; // x 0 1 0 XOR
	wire [15:0] d_li = b; // x 1 1 0 LUI
	wire [15:0] d_and_or = aluc[2]? d_or : d_and; // 0 0 1 1 SLL
	wire [15:0] d_xor_li = aluc[2]? d_li : d_xor; // 0 1 1 1 SRL
	wire [15:0] d_as, d_sh; // 1 1 1 1 SRA
	
	
	
	// addsub32 (a,b,sub, s);
	addsub16 as16 (a,b,aluc[2],d_as); // add/sub
	// shift (d,sa, right, arith, sh);
	shift shifter (b,a[4:0],aluc[2],aluc[3],d_sh); // shift
	// mux4x32 (a0, a1, a2, a3, s, y);
	mux4x16 res (d_as,d_and_or,d_xor_li,d_sh,aluc[1:0],r); // alu result
	assign z = |r;	
endmodule

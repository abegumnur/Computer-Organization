module addsub16 (a,b,ci,sub,s,co); // 4-bit adder/subtracter
	input [15:0] a, b; // inputs: a, b
	input ci; // input: carry_in
	input sub; // input: sub==1: s=a-b-ci
	// input: sub==0: s=a+b+ci
	output [15:0] s; // output: sum
	output co; // output: carry_out
	// sub==1, ci==0: a-b-ci = a+(-b)-0 = a+(̃b+1)-0 = a+(b ̂ sub)+(ci ̂ sub)
	// sub==1, ci==1: a-b-ci = a+(-b)-1 = a+(̃b+1)-1 = a+(b ̂ sub)+(ci ̂ sub)
	// sub==0, ci==0: a+b+ci = a+ b +0 = a+ b +0 = a+(b ̂ sub)+(ci ̂ sub)
	// sub==0, ci==1: a+b+ci = a+ b +1 = a+ b +1 = a+(b ̂ sub)+(ci ̂ sub)
	wire [15:0] bx = b ^ {16{sub}}; // b xor sub
	wire cix = ci ^ sub; // ci xor sub
	wire [14:0] c; // internal carries
	// add1 (a, b, ci, s, co);
	add1 a0 (a[0], bx[0], cix, s[0], c[0]); // b: bx[0], ci: cix; co: c[0]
	add1 a1 (a[1], bx[1], c[0], s[1], c[1]); // b: bx[1], ci: c[0]; co: c[1]
	add1 a2 (a[2], bx[2], c[1], s[2], c[2]); // b: bx[2], ci: c[1]; co: c[2]
	add1 a3 (a[3], bx[3], c[2], s[3], c[3]); // b: bx[3], ci: c[2]; co: co
	add1 a4 (a[4], bx[4], c[3], s[4], c[4]); // b: bx[3], ci: c[2]; co: co
	add1 a5 (a[5], bx[5], c[4], s[5], c[5]); // b: bx[3], ci: c[2]; co: co
	add1 a6 (a[6], bx[6], c[5], s[6], c[6]); // b: bx[3], ci: c[2]; co: co
	add1 a7 (a[7], bx[7], c[6], s[7], c[7]); // b: bx[3], ci: c[2]; co: co
	add1 a8 (a[8], bx[8], c[7], s[8], c[8]); // b: bx[3], ci: c[2]; co: co
	add1 a9 (a[9], bx[9], c[8], s[9], c[9]); // b: bx[3], ci: c[2]; co: co
	add1 a10 (a[10], bx[10], c[9], s[10], c[10]); // b: bx[3], ci: c[2]; co: co
	add1 a11 (a[11], bx[11], c[10], s[11], c[11]); // b: bx[3], ci: c[2]; co: co
	add1 a12 (a[12], bx[12], c[11], s[12], c[12]); // b: bx[3], ci: c[2]; co: co
	add1 a13 (a[13], bx[13], c[12], s[13], c[13]); // b: bx[3], ci: c[2]; co: co
	add1 a14 (a[14], bx[14], c[13], s[14], c[14]); // b: bx[3], ci: c[2]; co: co
	add1 a15 (a[15], bx[15], c[14], s[15], co); // b: bx[3], ci: c[2]; co: co


	
	
endmodule
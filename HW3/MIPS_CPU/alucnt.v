//F5 F4 F3 F2 F1 F0        C2 C1 C0
//---------------------------------
//100000 (ADD)             010
//100100 (AND)             000
//100111 (NOR)             111
//100101 (OR)              001
//101010 (SLT)             100
//000000 (SLL)             110
//000010 (SRL)             101
//100010 (SUB)             100
//100110 (XOR)             011



module alucnt(funct, aluSel);
	
	
	
	input [5:0] funct;
	output [2:0] aluSel;
	
	wire [7:0] w;
	
	and a0(w[0], ~funct[2], funct[1]);
	and a1(w[1], funct[2], funct[1], funct[0]);
	and a2(w[2], funct[2], funct[1], ~funct[0]);
	or  a3(aluSel[2], ~funct[5], w[0], w[1]);
	
	and a4(w[3], ~funct[3], ~funct[2], ~funct[1]);
	and a5(w[4], funct[2], funct[1], funct[0]);
	or a6(aluSel[1], w[3], w[4], w[2]);

	and a7(w[5], funct[2], funct[0]);
	and a8(w[6], ~funct[5], funct[1]);
	or  a9(aluSel[0], w[5], w[6], w[2]);
	
	
	
	
endmodule
	
	
	
	
	
	
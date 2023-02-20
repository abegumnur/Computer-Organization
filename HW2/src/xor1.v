module xor1(res, a, b);
	input a, b;
	output res;
	wire nota, notb, w1, w2;
	
	not(nota, a);
	not(notb, b);
	
	and(w1, a, notb);
	and(w2, b, nota);
	
	or(res, w1, w2);

endmodule
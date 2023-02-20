module scinstmem (a,inst); // instruction memory, rom
	input [31:0] a; // address
	output [31:0] inst; // instruction
	wire [31:0] rom [0:31]; // rom cells: 32 words * 32 bits
	// rom[word_addr] = instruction // (pc) label instruction
	assign rom[5'h00] = 32'h3c010000; // (00) 
	assign rom[5'h01] = 32'h34240050; // (04) 
	assign rom[5'h02] = 32'h20050004; // (08) 
	assign rom[5'h03] = 32'h0c000018; // (0c) 
	assign rom[5'h04] = 32'hac820000; // (10) 
	assign rom[5'h05] = 32'h8c890000; // (14) 
	assign rom[5'h06] = 32'h01244022; // (18) 
	assign rom[5'h07] = 32'h20050003; // (1c) 
	assign rom[5'h08] = 32'h20a5ffff; // (20) 
	assign rom[5'h09] = 32'h34a8ffff; // (24) 
	assign rom[5'h0A] = 32'h39085555; // (28) 
	assign rom[5'h0B] = 32'h2009ffff; // (2c) 
	assign rom[5'h0C] = 32'h312affff; // (30) 
	assign rom[5'h0D] = 32'h01493025; // (34) 
	assign rom[5'h0E] = 32'h01494026; // (38) 
	assign rom[5'h0F] = 32'h01463824; // (3c) 
	
endmodule
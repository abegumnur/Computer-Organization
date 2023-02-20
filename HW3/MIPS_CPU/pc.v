module pc(newpc, oldpc, immediate, address, pcsrc, jal );

output [9:0] newpc;
input [9:0] oldpc;
input [15:0] immediate; //i type branch
input [9:0] address; //j-type 
input [1:0] pcsrc;
input jal;
wire [15:0] pc16;
wire [15:0] address16; //extended addresswire [15:0] nextpcreg; //next pc = pc + 1
wire [15:0] nextpcbranch; // pc for branch instruction gives the address
wire [15:0] nextpcjump; //pc for jump instructions
wire [15:0] newpc16;

//extend pc to 16 bits to perform addition
genvar j;
generate
	for( j = 0; j<10; j = j+1 )
		begin: extend
			and( pc16[j], pc[j], 1'b1);
		end
endgenerate
generate
	for( j = 10; j<16; j = j+1 )
		begin: extend2
			and( pc16[j], 1'b0, 1'b0);
		end
endgenerate

genvar i;
generate
	for( i = 0; i<10; i = i+1 )
		begin: extend4
			and( address16[i], address[i], 1'b1);
		end
endgenerate
generate
	for( i = 10; i<16; i = i+1 )
		begin: extend3
			and( address16[i], 1'b0, 1'b0);
		end
endgenerate

addsub16 pcadd(pc16, 16'h0001, 1'b0, 1'b0, nextpcreg); //get regular next pc value
assign nextpcbranch = immediate;
addsub16 pcadd2(nextpcreg, address16, 1'b0, 1'b0, nextpcjump ); //pc value for jump instruction

mux4x16 pc_selection(nextpcreg, nextpcbranch, nextpcjump, 16'h0000, pcsrc, newpc16);

//getting the last ten bit of our result
generate
	for( j = 0; j<10; j = j+1 )
		begin: extend5
			and( newpc[j], newpc16[j], 1'b1);
		end
endgenerate
	
endmodule
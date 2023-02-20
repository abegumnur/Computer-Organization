module mux2x1_16bit( a, b, sel, out);
	input [15:0] a, b; 
	input sel;
	output [15:0] out;
	
	wire [15:0] temp1, temp2 ;
	wire not_sel;
	
	not(not_sel, sel); // inverse of the select bit
		
	generate
	genvar i;
	
		for(i = 0; i < 16; i = i + 1) 
			begin: parallel_loop_and1
			
				and and_1(temp1[i], b[i], sel);
				and and_2(temp2[i], a[i], not_sel);
				or or_1(out[i], temp1[i], temp2[i]);

			end
	endgenerate




endmodule
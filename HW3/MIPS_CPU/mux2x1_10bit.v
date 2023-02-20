module mux2x1_10bit( a, b, sel, out);
	input [9:0] a, b; 
	input sel;
	output [9:0] out;
	
	wire [9:0] temp1, temp2 ;
	wire not_sel;
	
	not(not_sel, sel); // not of the select bit
		
	generate

	genvar i;
		for(i = 0; i < 10; i = i + 1) //if select bit is one output the second input
			begin: parallel_loop_and1
				and and_1(temp1[i], b[i], sel);
				and and_2(temp2[i], a[i], not_sel);
				or or_1(out[i], temp1[i], temp2[i]);

			end
	endgenerate










endmodule
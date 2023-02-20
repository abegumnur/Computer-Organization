module shift (d,sa,right,arith,sh); // barrel shift, behavioral style

	input [15:0] d; // input: 16-bit data to be shifted
	input [3:0] sa; // input: shift amount, 4 bits
	input right; // 1: shift right; 0: shift left
	input arith; // 1: arithmetic shift; 0: logical
	output [15:0] sh; // output: shifted result
	reg [15:0] sh; // will be combinational
	
	
	
	always @* begin // always block
	if (!right) begin // if shift left
	sh = d << sa; // shift left sa bits
	end else if (!arith) begin // if shift right logical
	sh = d >> sa; // shift right logical sa bits
	end else begin // if shift right arithmetic
	sh = $signed(d) >>> sa; // shift right arithmetic sa bits
	end
end
endmodule
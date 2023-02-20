module mux4x16 (a0,a1,a2,a3,s,y); // 4-to-1 multiplexer, 16-bit
	input [15:0] a0, a1, a2, a3; // inputs, 16 bits
	input [1:0] s; // input, 2 bits
	output [15:0] y; // output, 16 bits
	
	
	function [15:0] select; // function name (= return value, 16 bits)
		input [15:0] a0,a1,a2,a3; 
		input [1:0] s; 
			case (s) // cases:
				2'b00: select = a0; // if (s==0) return value = a0
				2'b01: select = a1; // if (s==1) return value = a1
				2'b10: select = a2; // if (s==2) return value = a2
				2'b11: select = a3; // if (s==3) return value = a3
			endcase
		endfunction
	assign y = select(a0,a1,a2,a3,s); // call the function with parameterss
endmodule
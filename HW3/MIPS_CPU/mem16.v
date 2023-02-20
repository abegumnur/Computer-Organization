module mem16(adress, wdata, clk, wen, rdata); //data memory with 2^30 words

	input [15:0] address;
	input [15:0] wdata;
	input clk;
	input wen;
	output [15:0] rdata;
	

	reg [15:0] mem[0:2^30 - 1];
	
	assign rdata = mem[adress[15:0]];
	

	always @ (posedge clk) begin
	
		if(wen) begin
			mem[address[15:0]] <= wdata;
			
			end
	end
		



endmodule

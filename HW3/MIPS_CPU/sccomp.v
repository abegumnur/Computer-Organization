module sccomp (clk, clrn, inst, pc, aluout, memout); // single cycle computer

 input clk, clrn; // clock and reset
 
 output [9:0] pc; // program counter
 output [31:0] inst; // instruction
 output [15:0] aluout; // alu output
 output [15:0] memout; // data memory output
 
 wire [31:0] data; // data to data memory
 wire wmem; // write data memory
 
 
	sccpu cpu (clk,clrn,inst,memout,pc,wmem,aluout,data); // cpu
	scinstmem imem (pc,inst); // inst memory
	scdatamem dmem (clk,memout,data,aluout,wmem); // data memory
	
endmodule
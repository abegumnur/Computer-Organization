module sccpu (clk, clrn, inst, mem, pc, wmem, alu, data);


	//NOTE: INSTRUCTIONS ARE 32 BIT BUT REGISTERS ARE 16 BITS

	input [31:0] inst; // inst from inst memory
	input [31:0] mem; // data from data memory ??
	input clk, clrn; // clock and reset
	
	output [9:0] pc; // program counter
	output [15:0] alu; // alu output
	output [31:0] data; // data to data memory
	output wmem; // write data memory
	
	
	// instruction fields
	
	//R type
	wire [5:0] op = inst[31:26]; // op
	wire [3:0] rs = inst[25:22]; // rs
	wire [3:0] rt = inst[21:18]; // rt
	wire [3:0] rd = inst[17:14]; // rd
	wire [3:0] shamt = inst[13:10]; //shamt
	wire [5:0] func = inst[09:04]; // func
	
	//I type
	wire [15:0] imm = inst[17:02]; // immediate
	
	//J type
	wire [9:0] addr = inst[25:16]; // address
	
	// control signals
	wire [3:0] aluc; // alu operation control
	wire [1:0] pcsrc; // select pc source
	wire wreg; // write regfile
	wire regrt; // dest reg number is rt
	wire m2reg; // instruction is an lw
	wire shift; // instruction is a shift
	wire aluimm; // alu input b is an immediate
	wire jal; // instruction is a jal
	wire sext; // is sign extension
	
	// datapath wires
	wire [9:0] p4; // pc+4
	wire [9:0] bpc; // branch target address
	wire [9:0] npc; // next pc
	wire [15:0] qa; // regfile output port a
	wire [15:0] qb; // regfile output port b
	wire [15:0] alua; // alu input a
	wire [15:0] alub; // alu input b
	wire [15:0] wd; // regfile write port data
	wire [15:0] r; // alu out or mem
	
	wire [3:0] sa = inst[13:10]; // shift amount not sure about this input to alu
	
	//REVIEWWWWWWWWWWWWWWWWWWWWWWWWWWWW
	wire [15:0] s16 = {16{sext & inst[15]}}; // 16-bit signs
	wire [31:0] i32 = {s16,imm}; // 32-bit immediate
	wire [31:0] dis = {s16[13:0],imm,2'b00}; // word distance
	wire [31:0] jpc = {p4[31:28],addr,2'b00}; // jump target address
	wire [3:0] reg_dest; // rs or rt
	wire [3:0] wn = reg_dest | {4{jal}}; // regfile write reg #
	wire z; // alu, zero tag	
	
	
	// control unit
	sccu cu (op,func,z,wmem,wreg, // control unit her şeyi kontrol et 
							regrt,m2reg,aluc,shift,
							aluimm,pcsrc,jal,sext);
	
	
	
	
endmodule
module sccu (op, func, z, wmem, wreg, rmem, regrt, m2reg, aluc, shift, aluimm, pcsrc, jal, li); // control unit

	input [5:0] op;
	input [5:0] func; // opcode and function fields
	input z; // alu zero tag
	output [3:0] aluc; // alu operation control
	output [1:0] pcsrc; // select pc source
	output rmem; // read from memory
	output aluimm; //alu input b is i16
	output wreg; // write regfile
	output regrt; // dest reg number is rt
	output m2reg; // instruction is an lw
	output shift; // instruction is a shift
	output wmem; // write data memory
	output jal; // instruction is jal
	output li;	//instruction is load imm16
	
	wire rtype;
	wire i_add,i_sub;
	wire i_and, i_or, i_xor;
	wire i_sll, i_srl, i_sra;
	wire i_jr, i_addi, i_andi;
	wire i_ori, i_xori, i_li;
	wire i_lw, i_sw, i_beq, i_bne;
	wire i_j, i_jal;
	wire t1,t2; //temporaries
	
	//decode instructions
	
	and a1(rtype,  ~op[5] ,~op[4] ,~op[3], ~op[2] ,~op[1] , ~op[0]); // r format
	and a2 (  i_add,  rtype,  func[5],  ~func[4], ~func[3], ~func[2], ~func[1], ~func[0] );
	and a3(i_sub, rtype,func[5],~func[4],~func[3], ~func[2], func[1], ~func[0]);
	and a4(i_and, rtype, func[5],~func[4],~func[3], func[2], ~func[1],~func[0]);
	and a5(i_or ,rtype, func[5],~func[4], ~func[3], func[2], ~func[1], func[0]);
	and a6(i_xor ,rtype, func[5],~func[4],~func[3],func[2],func[1],~func[0]);	
	and a7(i_sll, rtype, ~func[5], ~func[4],~func[3], ~func[2], ~func[1],~func[0]);
	and a8(i_srl, rtype,~func[5], ~func[4],~func[3],~func[2],func[1],~func[0]);
	and a9(i_sra, rtype, ~func[5],~func[4],~func[3],~func[2], func[1], func[0]);
	and a10(i_jr, rtype, ~func[5],~func[4],func[3],~func[2],~func[1], ~func[0]);	
	and a11(i_addi,~op[5],~op[4],op[3],~op[2],~op[1],~op[0]); //i format
	and a12(i_andi, ~op[5],~op[4], op[3], op[2],~op[1],~op[0]);
	and a13(i_ori,~op[5],~op[4],op[3],op[2],~op[1], op[0]);
	and a14(i_xori, ~op[5], ~op[4], op[3], op[2],op[1], ~op[0]);
	and a15(i_li, ~op[5], ~op[4],op[3],op[2],op[1], op[0]);
	and a16(i_lw, op[5], ~op[4], ~op[3], ~op[2], op[1], op[0]);
	and a17(i_sw, op[5], ~op[4], ~op[3], ~op[2], op[1], op[0]);
	and a18(i_beq, ~op[5], ~op[4], ~op[3], op[2],~op[1], ~op[0]);
	and a19(i_bne, ~op[5], ~op[4], ~op[3], op[2], ~op[1], op[0]);
	and a20(i_j, ~op[5], ~op[4], ~op[3], ~op[2], op[1], ~op[0]); // j format
	and a21(i_jal, ~op[5], ~op[4], ~op[3], ~op[2], op[1], op[0]);
	

	// generate control signals
	
	or a22(regrt, i_addi,i_andi , i_ori, i_xori, i_lw,	i_li);
	and a23( jal, i_jal , 1'b1);
	and a24(m2reg,	i_lw, 1'b1);
	and a25(wmem ,i_sw, 1'b1);
	and a26(aluc[3], i_sra, 1'b1); //alu control signals
	or a27(aluc[2] , i_sub , i_or , i_srl , i_sra , i_ori , i_li);
	and s28(aluc[1] , i_xor , i_sll , i_srl , i_sra , i_xori , i_beq ,i_bne , i_li);
	and a29(aluc[0] , i_and , i_or , i_sll , i_srl , i_sra , i_andi , i_ori);
	or a30( shift , i_sll, i_srl , i_sra); 
	or a31( aluimm , i_addi, 	i_andi , i_ori , i_xori , i_lw , i_li , i_sw); //alusource
	and a32(li , i_li, 1'b1);
 	or a33( pcsrc[1], i_jr, i_j, i_jal);
	and a34(t1, i_beq, z);
	and a35(t2, i_bne, ~z);
	or a36(pcsrc[0], t1, t2);
	or a37( wreg , i_add , i_sub , i_and , i_or , i_xor , i_sll ,i_srl , i_sra , i_addi , i_andi , i_ori , i_xori ,i_lw , i_li , i_jal);
	
	


endmodule

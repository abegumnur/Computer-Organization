`timescale 1ns / 1ps  

module alu_tb();
//Inputs
 reg[15:0] a,b;
 reg[3:0] ALU_Sel;

//Outputs
 wire[15:0] ALU_Out;
 wire zero;
 
 // Verilog code for ALU
 integer i;
 alu test_unit(.a(a), .b(b),   // ALU 8-bit Inputs                 
            .aluc(ALU_Sel),// ALU Selection
            .r(ALL), // ALU 8-bit Output
            .zero(z) // Carry Out Flag
     );
    initial begin
    // hold reset state for 100 ns.
      a = 16'h0011;
      b = 16'h0111;
      ALU_Sel = 4'b0000;
      
      for (i=0;i<=15;i=i+1)
      begin
       ALU_Sel = ALU_Sel + 4'b0001;
       #10;
      end;
      
      a = 16'hF6;
      b = 16'h0A;
      
    end
	 
	 
	 	initial begin
	$monitor("time = %2d, a =%16b, b=%16b, res=%16b , %selection = %4b", $time, a, b, Alu_Out, ALU_Sel);
	end
endmodule
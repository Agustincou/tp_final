`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:22:12 09/06/2017
// Design Name:   InstructionMemory
// Module Name:   C:/Users/Cou/Documents/tp_final/ROM_Test.v
// Project Name:  tp_final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ROM_Test;

	// Inputs
	reg clka;
	reg [7:0] addra;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.clka(clka), 
		.addra(addra), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		addra = 0;

		// Wait 100 ns for global reset to finish
		#100;
      clka = 1;
		#100;
		clka = 0;
		addra = 1;
		#100;
      clka = 1;
		#100;
		clka = 0;
		addra = 2;
		#100;
      clka = 1;
		#100;
		clka = 0;
		addra = 3;
		#100;
      clka = 1;
		#100;
		clka = 0;
		addra = 4;
		#100;
      clka = 1;
		#100;
		clka = 0;
		addra = 5;
		#100;
      clka = 1;
		#100;
		clka = 0;
		addra = 6;
		#100;
      clka = 1;
		#100;
		clka = 0;
		addra = 7;
		#100;
      clka = 1;
		#100;
		clka = 0;
		addra = 8;
		#100;
      clka = 1;
		#100;
		clka = 0;
		addra = 9;
		#100;
      clka = 1;
		#100;
		clka = 0;
		addra = 10;
		#100;
      clka = 1;
		#100;
		clka = 0;
		addra = 11;
		#100;
      clka = 1;
		#100;
		clka = 0;
		addra = 12;
		// Add stimulus here

	end
      
endmodule


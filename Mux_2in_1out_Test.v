`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:22:49 08/22/2017
// Design Name:   Mux_2in_1out
// Module Name:   C:/Xilinx/tp_final/Mux_2in_1out_Test.v
// Project Name:  tp_final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux_2in_1out
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux_2in_1out_Test;

	// Inputs
	reg [31:0] DatoA;
	reg [31:0] DatoB;
	reg Sel;

	// Outputs
	wire [31:0] Salida;

	// Instantiate the Unit Under Test (UUT)
	Mux_2in_1out uut (
		.DatoA(DatoA), 
		.DatoB(DatoB), 
		.Sel(Sel), 
		.Salida(Salida)
	);

	initial begin
		// Initialize Inputs
		DatoA = 1;
		DatoB = 2;
		Sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Sel = 1;
		
		#100;
		
		DatoB = 4;
		DatoA = 6;
		
		#100;
		
		Sel = 0;
		
		

	end
      
endmodule


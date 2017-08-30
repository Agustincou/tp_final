`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:06:00 08/23/2017
// Design Name:   Mux_3in_1out
// Module Name:   C:/Xilinx/tp_final/Mux_3in_1out_Test.v
// Project Name:  tp_final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux_3in_1out
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux_3in_1out_Test;

	// Inputs
	reg [31:0] DatoA;
	reg [31:0] DatoB;
	reg [31:0] DatoC;
	reg [1:0] Sel;

	// Outputs
	wire [31:0] Salida;

	// Instantiate the Unit Under Test (UUT)
	Mux_3in_1out uut (
		.DatoA(DatoA), 
		.DatoB(DatoB), 
		.DatoC(DatoC), 
		.Sel(Sel), 
		.Salida(Salida)
	);

	initial begin
		// Initialize Inputs
		DatoA = 2;
		DatoB = 4;
		DatoC = 6;
		Sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Sel = 1;
		#100;
		Sel = 2;
	end
      
endmodule


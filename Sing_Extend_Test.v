`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:47:35 08/21/2017
// Design Name:   Sign_Extend
// Module Name:   C:/Xilinx/tp_final/Sing_Extend_Test.v
// Project Name:  tp_final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sign_Extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Sing_Extend_Test;

	// Inputs
	reg [15:0] a;

	// Outputs
	wire [31:0] y;

	// Instantiate the Unit Under Test (UUT)
	Sign_Extend uut (
		.a(a), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 1;
	end
      
endmodule


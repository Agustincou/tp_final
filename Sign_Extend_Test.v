`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:34:12 08/22/2017
// Design Name:   Sign_Extend
// Module Name:   C:/Xilinx/tp_final/Sign_Extend_Test.v
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

module Sign_Extend_Test;

	// Inputs
	reg [15:0] a;
	reg zeroEx;

	// Outputs
	wire [31:0] y;

	// Instantiate the Unit Under Test (UUT)
	Sign_Extend uut (
		.a(a), 
		.zeroEx(zeroEx), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		zeroEx = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 2;
		#100;
		a = 16'b1000100010001000;
		#100;
		zeroEx = 1;
		
	end
      
endmodule


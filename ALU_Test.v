`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:52:47 08/23/2017
// Design Name:   ALU
// Module Name:   C:/Xilinx/tp_final/ALU_Test.v
// Project Name:  tp_final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_Test;

	// Inputs
	reg [31:0] busA;
	reg [31:0] busB;
	reg [3:0] opCode;

	// Outputs
	wire [31:0] result;
	wire zero;
	wire overflow;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.busA(busA), 
		.busB(busB), 
		.opCode(opCode), 
		.result(result), 
		.zero(zero), 
		.overflow(overflow)
	);

	initial begin
		// Initialize Inputs
		busA = 2;
		busB = 4;
		opCode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		opCode = 1;
		#100;
		opCode = 2;
		#100;
		opCode = 3;
		#100;
		opCode = 4;
		#100;
		opCode = 5;
		#100;
		opCode = 6;
		#100;
		opCode = 7;
		#100;
		opCode = 8;
		#100;
		opCode = 9;
		#100;
	end
      
endmodule


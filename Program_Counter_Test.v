`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:45:10 08/21/2017
// Design Name:   Program_Counter
// Module Name:   C:/Xilinx/tp_final/Program_Counter_Test.v
// Project Name:  tp_final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Program_Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Program_Counter_Test;

	// Inputs
	reg clk;
	reg enable;
	reg [31:0] addr_in;

	// Outputs
	wire [31:0] addr_out;

	// Instantiate the Unit Under Test (UUT)
	Program_Counter uut (
		.clk(clk),
		.enable(enable),
		.addr_in(addr_in),
		.addr_out(addr_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		enable = 0;
		addr_in = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		addr_in = 6;
		
		#100;
		
		enable = 1;
	end
	
	always 
		begin //clock de 100 Mhz como el de la placa
			clk = 1'b0;
			#(10/2) clk = 1'b1;
			#(10/2);
		end
		
endmodule


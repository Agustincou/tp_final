`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:27:51 09/03/2017
// Design Name:   Fifo
// Module Name:   C:/Users/Cou/Documents/tp_final/Fifo_Test.v
// Project Name:  tp_final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Fifo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Fifo_Test;

	// Inputs
	reg [7:0] w_data;
	reg rd;
	reg wr;
	reg clk;

	// Outputs
	wire [7:0] r_data;
	wire empty;

	// Instantiate the Unit Under Test (UUT)
	Fifo uut (
		.w_data(w_data), 
		.rd(rd), 
		.wr(wr), 
		.r_data(r_data), 
		.empty(empty), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		w_data = 0;
		rd = 0;
		wr = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		w_data = 3;
      #100
		wr = 1;
		#8
		wr = 0;
		#100
		w_data = 5;
		#100
		wr = 1;
		#8
		wr = 0;
		// Add stimulus here
		#100
		rd = 1;
		#8
		rd = 0;
		#100
		rd = 1;
		#8
		rd = 0;
		#100
		rd = 1;
		#8
		rd = 0;
		#100
		rd = 1;
		#8
		rd = 0;
		#100
		rd = 1;
		#8
		rd = 0;
		#100
		rd = 1;
		#8
		rd = 0;
		#100
		rd = 1;
		#8
		rd = 0;

	end
   always begin //clock de 100 Mhz como el de la placa
		clk = 1'b0;
		#(10/2); 
		clk = 1'b1;
		#(10/2);
	end
endmodule


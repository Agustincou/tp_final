`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:22:42 08/23/2017
// Design Name:   Register_File
// Module Name:   C:/Xilinx/tp_final/Register_File_Test.v
// Project Name:  tp_final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Register_File
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Register_File_Test;

	// Inputs
	reg clk;
	reg reset;
	reg wr_enable3;
	reg [4:0] read_addr1;
	reg [4:0] read_addr2;
	reg [4:0] write_addr3;
	reg [31:0] write_data3;

	// Outputs
	wire [31:0] read_data1;
	wire [31:0] read_data2;
	wire [31:0] read_data_to_debug_0;
	wire [31:0] read_data_to_debug_1;
	wire [31:0] read_data_to_debug_2;
	wire [31:0] read_data_to_debug_3;
	wire [31:0] read_data_to_debug_4;

	// Instantiate the Unit Under Test (UUT)
	Register_File uut (
		.clk(clk), 
		.reset(reset), 
		.wr_enable3(wr_enable3), 
		.read_addr1(read_addr1), 
		.read_addr2(read_addr2), 
		.write_addr3(write_addr3), 
		.write_data3(write_data3), 
		.read_data1(read_data1), 
		.read_data2(read_data2), 
		.read_data_to_debug_0(read_data_to_debug_0), 
		.read_data_to_debug_1(read_data_to_debug_1), 
		.read_data_to_debug_2(read_data_to_debug_2), 
		.read_data_to_debug_3(read_data_to_debug_3), 
		.read_data_to_debug_4(read_data_to_debug_4)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		wr_enable3 = 0;
		read_addr1 = 0;
		read_addr2 = 0;
		write_addr3 = 0;
		write_data3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		read_addr1 = 5'b10010;
		#100;
		read_addr2 = 5'b11010;
		#100;
		write_addr3 = 1;
		write_data3 = 17'b11;
		#10;
		wr_enable3 = 1;
		#100;
		read_addr1 = 1;
		#100;
		reset = 1;
	end
	
	always 
		begin //clock de 100 Mhz como el de la placa
			clk = 1'b0;
         #(10/2); 
			clk = 1'b1;
         #(10/2);
      end
      
endmodule


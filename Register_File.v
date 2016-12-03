`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:21:47 12/03/2016 
// Design Name: 
// Module Name:    Register_File 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Register_File(clk, wr_enable3, read_addr1, read_addr2, write_addr3, write_data3, read_data1, read_data2);
//-------------------------------------------Entradas-----------------------------------------//
	input clk;
	input wr_enable3;
	input [4:0] read_addr1;
	input [4:0] read_addr2;
	input [4:0] write_addr3;
	input [31:0] write_data3;
//--------------------------------------------Salidas-----------------------------------------//
	output [31:0] read_data1;
	output [31:0] read_data2;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
	reg [31:0] reg_file[31:0];
	integer i;
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		for (i = 0; i < 31; i = i + 1)
			reg_file[i] = 0;
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	always @(negedge clk)
		begin
			if (wr_enable3 == 1)
				reg_file[write_addr3] <= write_data3;
		end
	
	assign read_data1 = (read_addr1 != 0) ? reg_file[read_addr1] : 0;
	assign read_data2 = (read_addr2 != 0) ? reg_file[read_addr2] : 0;
	
endmodule

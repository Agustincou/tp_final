`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:27:52 12/03/2016 
// Design Name: 
// Module Name:    Data_Memory 
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
module Data_Memory(clk, wr_enable, addr, write_data, read_data);
//-------------------------------------------Entradas-----------------------------------------//
	input clk;
	input wr_enable;
	input [31:0] addr;
	input [31:0] write_data;
//--------------------------------------------Salidas-----------------------------------------//
	output [31:0] read_data;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
	reg [31:0] RAM[63:0];
	integer i;
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		for (i = 0; i < 63; i = i + 1)
			RAM[i] = i;
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	//Lectura
	assign read_data = RAM[addr[31:2]];
	//Escritura
	always @(posedge clk)
		begin
			if (wr_enable == 1)
				RAM[addr[31:2]] <= write_data;
		end

endmodule

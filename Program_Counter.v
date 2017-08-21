`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:20:10 12/03/2016 
// Design Name: 
// Module Name:    Program_Counter 
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
module Program_Counter(clk,enable,addr_in,addr_out);
//-------------------------------------------Entradas-----------------------------------------//
	input clk;
	input enable;
	input	[31:0] addr_in;
//--------------------------------------------Salidas-----------------------------------------//
	output reg [31:0] addr_out;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		begin
			addr_out = 0;
		end
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	always @(posedge clk)
		begin
			if (enable == 1)
				begin
					addr_out <= addr_in;
				end
		end
endmodule

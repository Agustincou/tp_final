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
module Program_Counter(clk,notEnable,reset,enableDebug,resetDebug,addr_in,addr_out);
//-------------------------------------------Entradas-----------------------------------------//
	input clk;
	input notEnable;
	input reset;
	input enableDebug;
	input resetDebug;
	input	[7:0] addr_in;
//--------------------------------------------Salidas-----------------------------------------//
	output reg [7:0] addr_out;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		begin
			addr_out = 0;
		end
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	always @(negedge clk)
		begin
			if(reset || resetDebug)
				begin
					addr_out <= 0;
				end
			else if(~notEnable && enableDebug)
				begin
					addr_out <= addr_in;
				end
		end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:04 11/30/2016 
// Design Name: 
// Module Name:    Multiplexor_2in_1out 
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
module Mux_2in_1out #(parameter DB = 16)(DatoA, DatoB, Sel, Salida);
//-------------------------------------------Entradas-----------------------------------------//
	input [DB-1:0] DatoA;
	input [DB-1:0] DatoB;
	input Sel;
//--------------------------------------------Salidas-----------------------------------------//
	output reg [DB-1:0] Salida;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		begin
			Salida = 0;
		end
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	always @(*)
	begin
		if(Sel == 1)
			Salida = DatoA;
		else
			Salida = DatoB;
	end
endmodule

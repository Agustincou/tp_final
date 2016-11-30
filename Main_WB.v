`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:00:26 11/30/2016 
// Design Name: 
// Module Name:    Main_WB 
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
module Main_WB(Dato1, Dato0, Sel, Resultado_Mux);
//-------------------------------------------Entradas-----------------------------------------//
	input Dato1;
	input Dato0;
	input Sel; //Esto debera verificarse por donde viene
//--------------------------------------------Salidas-----------------------------------------//
	output reg Resultado_Mux;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		begin
			Resultado_Mux = 0;
		end
//--------------------------------------Declaracion de Bloques--------------------------------//
	Mux_2in_1out MUX(Dato1, Dato0, Sel, Resultado_Mux);
//--------------------------------------------Logica------------------------------------------//

endmodule

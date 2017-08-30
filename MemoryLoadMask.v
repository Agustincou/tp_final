`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:38:28 08/28/2017 
// Design Name: 
// Module Name:    MemoryLoadMask 
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
module MemoryLoadMask(dataIn, maskLength, dataOut);
//-------------------------------------------Entradas-----------------------------------------//
	input      [31:0]	dataIn;
	// 0:Palabra completa 1:Media palabra 2:Byte
	input      [1:0]	maskLength;
//--------------------------------------------Salidas-----------------------------------------//
	output reg [31:0]	dataOut;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	initial begin
		dataOut = 0;
	end
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	always @*
		begin
			case (maskLength)
				0: dataOut <= dataIn;
				1: dataOut <= dataIn&32'hFFFF;
				2: dataOut <= dataIn&32'hFF;
				default: dataOut <= dataIn;
			endcase
		end
endmodule

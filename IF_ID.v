`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:17 11/30/2016 
// Design Name: 
// Module Name:    Latch_IF-ID 
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
module IF_ID(clk, reset, clear, stall_ID, programCounter_in, instruction_in, enableDebug, resetDebug, programCounter_out, instruction_out);
//-------------------------------------------Entradas-----------------------------------------//
	input clk;
	input reset;
	input clear;
	input stall_ID;
	input	[7:0] programCounter_in;
	input	[31:0] instruction_in;
	//Debug
	input enableDebug;
	input resetDebug;
//--------------------------------------------Salidas-----------------------------------------//
	output reg [7:0] programCounter_out;
	output reg [31:0] instruction_out;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		begin
			programCounter_out = 0;
			instruction_out = 0;
		end
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	always @(negedge clock)
		begin
			if(reset)
				begin
					instruction_out <= 0;
					programCounter_out <= 0;
				end
			else if(resetDebug)
				begin
					instruction_out <= 0;
					programCounter_out <= 0;
				end
			else if(~stall_ID && enableDebug)
				begin
					if(clear)
						begin
							instruction_out <= 0;
						end
					else
						begin
							instruction_out <= instruction_in;
						end
					programCounter_out <= programCounter_in;
				end
		end
endmodule

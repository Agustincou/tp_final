`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:01:05 11/30/2016 
// Design Name: 
// Module Name:    Latch_MEM-WB 
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
module MEM_WB(clk, reset, enableDebug, resetDebug, regWrite_in, memToReg_in, eop_in, writeReg_in, aluOut_in, readData_in,
					regWrite_out, memToReg_out, eop_out, writeReg_out, aluOut_out, readData_out);
//-------------------------------------------Entradas-----------------------------------------//
	input clk;
	input reset;
	input regWrite_in;
	input memToReg_in;
	input eop_in;
	input [4:0] writeReg_in;
	input [31:0] aluOut_in;
	input [31:0] readData_in;
	//Debug
	input enableDebug;
	input resetDebug;
//--------------------------------------------Salidas-----------------------------------------//
	output reg regWrite_out;
	output reg memToReg_out;
	output reg eop_out;
	output reg [4:0] writeReg_out;
	output reg [31:0] aluOut_out;
	output reg [31:0] readData_out;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	initial begin
		writeReg_out = 0;
		aluOut_out = 0;
		readData_out = 0;
		regWrite_out = 0;
		memToReg_out = 0;
		eop_out = 0;
	end
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	always @(negedge clk)
	begin
		if(reset || resetDebug)
		begin
			writeReg_out <= 0;
			aluOut_out <= 0;
			readData_out <= 0;
			regWrite_out <= 0;
			memToReg_out <= 0;
			eop_out <= 0;
		end
		else if(enableDebug)
		begin
			writeReg_out <= writeReg_in;
			aluOut_out <= aluOut_in;
			readData_out <= readData_in;
			regWrite_out <= regWrite_in;
			memToReg_out <= memToReg_in;
			eop_out <= eop_in;
		end		
	 end
endmodule

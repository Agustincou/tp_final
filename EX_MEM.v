`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:00:53 11/30/2016 
// Design Name: 
// Module Name:    Latch_EX-MEM 
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
module EX_MEM(clk, reset, writeReg_in, writeData_in, aluOut_in, regWrite_in, memToReg_in,
					memWrite_in, memReadWidth_in, eop_in, writeReg_out, writeData_out, aluOut_out,
					regWrite_out, memToReg_out, memWrite_out, memReadWidth_out, eop_out,
					enableDebug, resetDebug);
//-------------------------------------------Entradas-----------------------------------------//
		input clk;
		input reset;
		input	[4:0] writeReg_in;
		input	[31:0] writeData_in;
		input	[31:0] aluOut_in;
		input regWrite_in;
		input memToReg_in;
		input [3:0]memWrite_in;
		input [1:0] memReadWidth_in;
		input	eop_in;
		//Debug
		input enableDebug;
		input resetDebug;
//--------------------------------------------Salidas-----------------------------------------//
		output reg [4:0] writeReg_out;
		output reg [31:0] writeData_out;
		output reg [31:0] aluOut_out;
		output reg regWrite_out;
		output reg memToReg_out;
		output reg [3:0]memWrite_out;
		output reg [1:0] memReadWidth_out;
		output reg eop_out;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		begin
			writeReg_out = 0;
			writeData_out = 0;
			aluOut_out = 0;
			regWrite_out = 0;
			memToReg_out = 0;
			memWrite_out = 0;
			memReadWidth_out = 0;
			eop_out = 0;
		end
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
always @(negedge clk)
	 begin
		if(reset || resetDebug)
		begin
			writeReg_out<=0;
			writeData_out<=0;
			aluOut_out<=0;
			regWrite_out<=0;
			memToReg_out<=0;
			memWrite_out<=0;
			memReadWidth_out<=0;
			eop_out<=0;
		end
		else if(enableDebug)
		begin
			writeReg_out<=writeReg_in;
			writeData_out<=writeData_in;
			aluOut_out<=aluOut_in;
			regWrite_out<=regWrite_in;
			memToReg_out<=memToReg_in;
			memWrite_out<=memWrite_in;
			memReadWidth_out<=memReadWidth_in;
			eop_out<=eop_in;
		end		
	 end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:50 11/30/2016 
// Design Name: 
// Module Name:    Latch_ID-EX 
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
module ID_EX(clk, reset, syncClr, aluSrc_in, aluShiftImm_in, regDst_in, loadImm_in, memToReg_in, regWrite_in, eop_in, 
				memReadWidth, memWrite_in, aluControl_in, rs_in, rt_in, rd_in, sa_in, signImm_in, readData1_in, readData2_in, 
				enableDebug, resetDebug, aluSrc_out, aluShiftImm_out, memToReg_out, regDst_out, loadImm_out, regWrite_out, 
				eop_out, memReadWidth_out, memWrite_out, aluControl_out, rs_out, rt_out, rd_out, sa_out, signImm_out, 
				readData1_out, readData2_out);
//-------------------------------------------Entradas-----------------------------------------//
	input clk;
	input reset;
	input syncClr;
	input aluSrc_in;
	input aluShiftImm_in;
	input regDst_in;
	input loadImm_in;
	input memToReg_in;
	input regWrite_in;
	input eop_in;
	input [1:0] memReadWidth_in;
	input [3:0] memWrite_in;
	input [3:0] aluControl_in;
	input [4:0] rs_in;
	input [4:0] rt_in;
	input [4:0] rd_in;
	input [4:0] sa_in;
	input [31:0] signImm_in;
	input [31:0] readData1_in;
	input [31:0] readData2_in;
	//Debug
	input enableDebug;
	input resetDebug;
//--------------------------------------------Salidas-----------------------------------------//
	output reg aluSrc_out;
	output reg aluShiftImm_out;
	output reg memToReg_out;
	output reg regDst_out;
	output reg loadImm_out;
	output reg regWrite_out;
	output reg eop_out;
	output reg [1:0] memReadWidth_out;
	output reg [3:0] memWrite_out;
	output reg [3:0] aluControl_out;
	output reg [4:0] rs_out;
	output reg [4:0] rt_out;
	output reg [4:0] rd_out;
	output reg [4:0] sa_out;
	output reg [31:0] signImm_out;
	output reg [31:0] readData1_out;
	output reg [31:0] readData2_out;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		begin
			aluControl_out = 0;
			signImm_out = 0;
			readData1_out = 0;
			readData2_out = 0;
			aluSrc_out = 0;
			aluShiftImm_out = 0;
			memWrite_out = 0;
			memToReg_out = 0;
			memReadWidth_out = 0;
			regWrite_out = 0;
			rs_out = 0;
			rt_out = 0;
		   rd_out = 0;
			sa_out = 0;
			regDst_out = 0;
			loadImm_out = 0;
			eop_out = 0;
		end
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	always @(negedge clk)
		begin
			if (reset || resetDebug || (syncClr && enableDebug))
				begin
					aluControl_out <= 0;
					signImm_out <= 0;
					readData1_out <= 0;
					readData2_out <= 0;
					aluSrc_out <= 0;
					aluShiftImm_out <= 0;
					memWrite_out <= 0;
					memToReg_out <= 0;
					memReadWidth_out <= 0;
					regWrite_out <= 0;
					rs_out <= 0;
					rt_out <= 0;
					rd_out <= 0;
					sa_out <= 0;
					regDst_out <= 0;
					loadImm_out <= 0;
					eop_out <= 0;
				end
			else if (enableDebug)
				begin
					aluControl_out <= aluControl_in;
					signImm_out <= signImm_in;
					readData1_out <= readData1_in;
					readData2_out <= readData2_in;
					aluSrc_out <= aluSrc_in;
					aluShiftImm_out <= aluShiftImm_in;
					memWrite_out <= memWrite_in;
					memToReg_out <=  memToReg_in;
					memReadWidth_out <= memReadWidth_in;
					regWrite_out <= regWrite_in;
					rs_out <= rs_in;
					rt_out <= rt_in;
					rd_out <= rd_in;
					sa_out <= sa_in;
					regDst_out <= regDst_in;
					loadImm_out <= loadImm_in;
					eop_out <= eop_in;
				end		
			end
endmodule

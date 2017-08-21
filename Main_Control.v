`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:15:27 12/03/2016 
// Design Name: 
// Module Name:    Main_Control 
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
module Main_Control(Op, Funct, RegWrite, MemtoReg, MemWrite, ALUControl, ALUSrc, RegDst, Branch
    );
//-------------------------------------------Entradas-----------------------------------------//
	input [5:0] Op;
	input [5:0] Funct;
//--------------------------------------------Salidas-----------------------------------------//
	output reg RegWrite;
	output reg MemtoReg;
	output reg MemWrite;
	output reg ALUControl;
	output reg ALUSrc;
	output reg RegDst;
	output reg Branch;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		begin
			RegWrite = 0;
			MemtoReg = 0;
			MemWrite = 0;
			ALUControl = 0;
			ALUSrc = 0;
			RegDst = 0;
			Branch = 0;
		end
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//


endmodule

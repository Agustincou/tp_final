`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:15:59 12/03/2016 
// Design Name: 
// Module Name:    Main_Hazard 
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
module Main_Hazard(branchID, rsID, rtID, rsEX, rtEX, writeRegEX, writeRegMEM, writeRegWB, memToRegEX, memToRegMEM,
						regWriteEX, regWriteMEM, regWriteWB, stallFE, stallID,
						forwardAID, forwardBID, flushEX, forwardAEX, forwardBEX);
//-------------------------------------------Entradas-----------------------------------------//
	input branchID;
	input [4:0] rsID;
	input [4:0]	rtID;
	input [4:0]	rsEX;
	input [4:0]	rtEX;
	input [4:0]	writeRegEX;
	input [4:0]	writeRegMEM;
	input [4:0]	writeRegWB;
	input memToRegEX;
	input memToRegMEM;
	input regWriteEX;
	input regWriteMEM;
	input regWriteWB;
//--------------------------------------------Salidas-----------------------------------------//
	output stallFE;
	output stallID;
	output forwardAID;
	output forwardBID;
	output flushEX;
	output reg [1:0] forwardAEX;
	output reg [1:0] forwardBEX;
//---------------------------------------------Wires------------------------------------------//
	wire lwstall;
	wire branchstall;
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		begin
			forwardAEX = 0;
			forwardBEX = 0;
		end
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	assign lwstall = ((rsID == rtEX) || (rtID == rtEX)) && memToRegEX;
	assign stallFE = lwstall || branchstall;
	assign stallID = lwstall || branchstall;
	assign flushEX = lwstall || branchstall;
	
	assign forwardAID =  (rsID == writeRegMEM) && regWriteMEM;
   assign forwardBID =  (rtID == writeRegMEM) && regWriteMEM;
		
	assign branchstall = (branchID && regWriteEX && (writeRegEX == rsID || writeRegEX == rtID)) || (branchID && memToRegMEM && (writeRegMEM == rsID || writeRegMEM == rtID));

	always @* 
	begin
		if ((rsEX == writeRegMEM) && regWriteMEM)
			begin
				forwardAEX <= 'b10;
			end
		else if ((rsEX == writeRegWB) && regWriteWB)
			begin
				forwardAEX <= 'b01;
			end
		else 
			begin
				forwardAEX <= 'b00;
			end
		
		if ((rtEX == writeRegMEM) && regWriteMEM)
			begin
				forwardBEX <= 'b10;
			end
		else if ((rtEX == writeRegWB) && regWriteWB)
			begin
				forwardBEX <= 'b01;
			end
		else
			begin
				forwardBEX <= 'b00;
			end
	end
endmodule

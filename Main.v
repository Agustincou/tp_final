`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:16:49 12/03/2016 
// Design Name: 
// Module Name:    Main 
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
module Main(clk, reset, uartRx, uartTx, ledIdle, sentFlag, notStartUartTx, ledDataAvailable, sendCounter);
//-------------------------------------------Entradas-----------------------------------------//
	input clk;
	input reset;
	input uartRx;
//--------------------------------------------Salidas-----------------------------------------//
	output uartTx;
	output ledIdle;
	output sentFlag;
	output notStartUartTx;
	output ledDataAvailable;
	output [7:0] sendCounter;
//---------------------------------------------Wires------------------------------------------//
	wire AluZero; 
	wire ALUOverflow;
	wire dcmOut;
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
//--------------------------------------Declaracion de Bloques--------------------------------//
	//Modulo generado con IP core
	Clock clock(
		.CLK_IN1(clk),		// clock de la placa a 100MHz
		.CLK_OUT1(dcmOut)
	);
	
	Main_Datapath datapath( 		
		//Entradas
	   .clk(dcmOut),
		.reset(reset),
		.uartRx(uartRx),
		
		//Salidas
		.uartTx(uartTx),
		.ALUzero(AluZero),
		.ALUOverflow(ALUOverflow),
		.ledIdle(ledIdle),
		.sendCounter(sendCounter),
		.sentFlag(sentFlag),
		.notStartUartTx(notStartUartTx),
		.ledDataAvailable(ledDataAvailable)
	);
//--------------------------------------------Logica------------------------------------------//


endmodule

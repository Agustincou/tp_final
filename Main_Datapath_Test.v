`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:10:59 09/06/2017
// Design Name:   Main_Datapath
// Module Name:   C:/Users/Cou/Documents/tp_final/Main_Datapath_Test.v
// Project Name:  tp_final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main_Datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Main_Datapath_Test;

	// Inputs
	reg clk;
	reg clk_70;
	reg reset;
	reg uartRxPin;

	// Outputs
	wire uartTxPin;
	wire ALUzero;
	wire ALUOverflow;
	wire ledIdle;
	wire sentFlag;
	wire notStartUartTx;
	wire ledDataAvailable;
	wire [7:0] sendCounter;

	// Instantiate the Unit Under Test (UUT)
	Main_Datapath uut (
		.clk(clk), 
		.clk_70(clk_70), 
		.reset(reset), 
		.uartRxPin(uartRxPin), 
		.uartTxPin(uartTxPin), 
		.ALUzero(ALUzero), 
		.ALUOverflow(ALUOverflow), 
		.ledIdle(ledIdle), 
		.sentFlag(sentFlag), 
		.notStartUartTx(notStartUartTx), 
		.ledDataAvailable(ledDataAvailable), 
		.sendCounter(sendCounter)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clk_70 = 0;
		reset = 0;
		uartRxPin = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
		#80;
		reset = 0;
		// Add stimulus here

	end
   
	always begin //clock de 100 Mhz como el de la placa
			clk = 1'b0;
			#(100/2) clk = 1'b1;
			#(100/2);
	end   
	
endmodule


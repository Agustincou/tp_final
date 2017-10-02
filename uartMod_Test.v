`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:20:08 10/02/2017
// Design Name:   Main_Uart
// Module Name:   C:/Users/Cou/Documents/tp_final/uartMod_Test.v
// Project Name:  tp_final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main_Uart
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uartMod_Test;

	// Inputs
	reg clk;
	reg rx;
	reg uart_reset;
	reg readFlag;
	reg [7:0] dataToSend;
	reg uart_tx_start;

	// Outputs
	wire [7:0] receivedData;
	wire dataAvailable;
	wire tx;
	wire uart_tx_done;
	wire [3:0] state;
	wire [7:0] dout_wdata;

	// Instantiate the Unit Under Test (UUT)
	Main_Uart uut (
		.clk(clk), 
		.rx(rx), 
		.uart_reset(uart_reset), 
		.readFlag(readFlag), 
		.dataToSend(dataToSend), 
		.uart_tx_start(uart_tx_start), 
		.receivedData(receivedData), 
		.dataAvailable(dataAvailable), 
		.tx(tx), 
		.uart_tx_done(uart_tx_done), 
		.state(state), 
		.dout_wdata(dout_wdata)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rx = 1;
		uart_reset = 0;
		readFlag = 0;
		dataToSend = 0;
		uart_tx_start = 0;

		// Wait 100 ns for global reset to finish
		#500;
        
		// Add stimulus here
		rx = 1;
		#99999;
		
		#52083.34;
		rx = 0;//start bit
		#52083.34;
		rx = 1;
		#52083.34;
		rx = 1;
		#52083.34;
		rx = 0;
		#52083.34;
		rx = 0;
		#52083.34;
		rx = 0;
		#52083.34;
		rx = 1;
		#52083.34;
		rx = 1;
		#52083.34;
		rx = 0;
		#52083.34;
		rx = 1;//stop bit
		#52083.34;
		
		#99999;
		readFlag = 1;
		
	end
   
	always begin //clock de 100 Mhz como el de la placa
			clk = 1'b0;
			#(80/2) clk = 1'b1;
			#(80/2);
	end
	
endmodule


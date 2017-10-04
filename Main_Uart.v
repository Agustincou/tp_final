`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:24 09/03/2017 
// Design Name: 
// Module Name:    Main_Uart 
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
module Main_Uart(clk, rx, uart_reset, readFlag, dataToSend, uart_tx_start, receivedData, dataAvailable, tx, uart_tx_done
    );
//-------------------------------------------Entradas-----------------------------------------//
   input 			clk; //input clk;
	input 			rx; //input rx; -> Indica inicio de lecutura de la UART
	input 			uart_reset; //input reset;
	input 			readFlag; //wire rd_uart; <- READ DE LA FIFO!
	//input 			writeFlag, //wire wr_uart; <- WRITE DE LA FIFO! NO SE USA
	input 	[7:0]	dataToSend; //	wire [DBIT-1:0] w_data; <- LO QUE VA A ENTRAR A LA FIFO PARA ENVIARSE
	input 			uart_tx_start; //wire empty_txstart; <-CUANDO SE TENGAN TODOS LOS DATOS PARA ENVIAR
//--------------------------------------------Salidas-----------------------------------------//
	output	[7:0]	receivedData; //wire [DBIT-1:0] r_data;
	output			dataAvailable; //output rx_empty; <-habría que negarlo y es lo mismo
	output			tx; //output tx;
	output			uart_tx_done;
//------------------------------------Parametros para UART------------------------------------//
	parameter BaudRate = 1200;
	parameter clk_Mhz = 5;
	parameter DBIT = 8;
	parameter SB_TICK = 16;
//---------------------------------------------Wires------------------------------------------//
	wire [DBIT-1:0] dout_wdata; //Salida del receptor que va a la fifo RX
	wire rxdonetick_wr; //bit que sale del receptor y le indica a la fifo RX que apile el dato ->uart_rx_done
	wire tick_stick; //salida del baudrate generator
	//-> Se reemplaza esta variable sacandola afuera como uart_tx_done
	//wire txdonetick_rd; //bit que pone en 1 el transmisor cuando puede enviar un dato de 8bits (y lee uno de la fifo Tx)
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	assign dataAvailable = ~rx_empty;
//--------------------------------------Declaracion de Bloques--------------------------------//
	Baud_Rate_Generator #(clk_Mhz, BaudRate) baudrategenerator (clk, tick_stick);
	Receiver #(DBIT, SB_TICK) receptor (tick_stick, rx, dout_wdata, rxdonetick_wr, uart_reset, clk);
	Transmitter #(DBIT, SB_TICK) transmisor (tick_stick, tx, dataToSend, uart_tx_done, uart_reset, uart_tx_start, clk);
	Fifo #(DBIT) fifo_receptor (dout_wdata, readFlag, rxdonetick_wr, receivedData, rx_empty, clk);
//--------------------------------------------Logica------------------------------------------//

endmodule

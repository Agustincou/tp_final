`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:21:47 12/03/2016 
// Design Name: 
// Module Name:    Register_File 
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
module Register_File(clk, reset, wr_enable3, read_addr1, read_addr2, write_addr3, write_data3, read_data1, read_data2, 
							read_data_to_debug_0, read_data_to_debug_1, read_data_to_debug_2, read_data_to_debug_3, 
							read_data_to_debug_4, read_data_to_debug_5, read_data_to_debug_6, read_data_to_debug_7,
							read_data_to_debug_8, read_data_to_debug_9, read_data_to_debug_10, read_data_to_debug_11, 
							read_data_to_debug_12, read_data_to_debug_13, read_data_to_debug_14, read_data_to_debug_15,
							read_data_to_debug_16, read_data_to_debug_17, read_data_to_debug_18, read_data_to_debug_19, 
							read_data_to_debug_20, read_data_to_debug_21, read_data_to_debug_22, read_data_to_debug_23,
							read_data_to_debug_24, read_data_to_debug_25, read_data_to_debug_26, read_data_to_debug_27, 
							read_data_to_debug_28, read_data_to_debug_29, read_data_to_debug_30, read_data_to_debug_31);
//-------------------------------------------Entradas-----------------------------------------//
	input clk;
	input reset;
	input wr_enable3;
	input [4:0] read_addr1;
	input [4:0] read_addr2;
	input [4:0] write_addr3;
	input [31:0] write_data3;
//--------------------------------------------Salidas-----------------------------------------//
	output [31:0] read_data1;
	output [31:0] read_data2;
	//Debuger
	output [31:0] read_data_to_debug_0;
	output [31:0] read_data_to_debug_1;
	output [31:0] read_data_to_debug_2;
	output [31:0] read_data_to_debug_3;
	output [31:0] read_data_to_debug_4;
	output [31:0] read_data_to_debug_5;
	output [31:0] read_data_to_debug_6;
	output [31:0] read_data_to_debug_7;
	output [31:0] read_data_to_debug_8;
	output [31:0] read_data_to_debug_9;
	output [31:0] read_data_to_debug_10;
	output [31:0] read_data_to_debug_11;
	output [31:0] read_data_to_debug_12;
	output [31:0] read_data_to_debug_13;
	output [31:0] read_data_to_debug_14;
	output [31:0] read_data_to_debug_15;
	output [31:0] read_data_to_debug_16;
	output [31:0] read_data_to_debug_17;
	output [31:0] read_data_to_debug_18;
	output [31:0] read_data_to_debug_19;
	output [31:0] read_data_to_debug_20;
	output [31:0] read_data_to_debug_21;
	output [31:0] read_data_to_debug_22;
	output [31:0] read_data_to_debug_23;
	output [31:0] read_data_to_debug_24;
	output [31:0] read_data_to_debug_25;
	output [31:0] read_data_to_debug_26;
	output [31:0] read_data_to_debug_27;
	output [31:0] read_data_to_debug_28;
	output [31:0] read_data_to_debug_29;
	output [31:0] read_data_to_debug_30;
	output [31:0] read_data_to_debug_31;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
	reg [31:0] reg_file[31:0];
	integer i;
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		for (i = 0; i <= 31; i = i + 1)
			reg_file[i] = 0;
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	always @(posedge clk,posedge reset)
		begin
			if (reset == 1)
				begin
					for (i = 0; i <= 31; i = i + 1)
						reg_file[i] <= 0;
				end
			else if (wr_enable3 == 1)
				begin
					reg_file[write_addr3] <= write_data3;
				end
		end
	
	assign read_data1 = (read_addr1 != 0) ? reg_file[read_addr1] : 0;
	assign read_data2 = (read_addr2 != 0) ? reg_file[read_addr2] : 0;
	
	//Debug
	assign read_data_to_debug_0 = reg_file[0];
	assign read_data_to_debug_1 = reg_file[1];
	assign read_data_to_debug_2 = reg_file[2];
	assign read_data_to_debug_3 = reg_file[3];
	assign read_data_to_debug_4 = reg_file[4];
	assign read_data_to_debug_5 = reg_file[5];
	assign read_data_to_debug_6 = reg_file[6];
	assign read_data_to_debug_7 = reg_file[7];
	assign read_data_to_debug_8 = reg_file[8];
	assign read_data_to_debug_9 = reg_file[9];
	assign read_data_to_debug_10 = reg_file[10];
	assign read_data_to_debug_11 = reg_file[11];
	assign read_data_to_debug_12 = reg_file[12];
	assign read_data_to_debug_13 = reg_file[13];
	assign read_data_to_debug_14 = reg_file[14];
	assign read_data_to_debug_15 = reg_file[15];
	assign read_data_to_debug_16 = reg_file[16];
	assign read_data_to_debug_17 = reg_file[17];
	assign read_data_to_debug_18 = reg_file[18];
	assign read_data_to_debug_19 = reg_file[19];
	assign read_data_to_debug_20 = reg_file[20];
	assign read_data_to_debug_21 = reg_file[21];
	assign read_data_to_debug_22 = reg_file[22];
	assign read_data_to_debug_23 = reg_file[23];
	assign read_data_to_debug_24 = reg_file[24];
	assign read_data_to_debug_25 = reg_file[25];
	assign read_data_to_debug_26 = reg_file[26];
	assign read_data_to_debug_27 = reg_file[27];
	assign read_data_to_debug_28 = reg_file[28];
	assign read_data_to_debug_29 = reg_file[29];
	assign read_data_to_debug_30 = reg_file[30];
	assign read_data_to_debug_31 = reg_file[31];
endmodule

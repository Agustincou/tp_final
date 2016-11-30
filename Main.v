`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:51:56 11/30/2016 
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
module Main(
    );
//-------------------------------------------Entradas-----------------------------------------//
//--------------------------------------------Salidas-----------------------------------------//
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
//--------------------------------------Declaracion de Bloques--------------------------------//
Main_IF main_if();
Latch_IF_ID latch_if_id();
Main_ID main_id();
Latch_ID_EX latch_id_ex();
Main_EX main_ex();
Latch_EX_MEM latch_ex_mem();
Main_MEM main_mem();
Latch_MEM_WB latch_mem_wb();
Main_WB main_wb();
//--------------------------------------------Logica------------------------------------------//
endmodule

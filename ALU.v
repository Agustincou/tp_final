`timescale 1ns / 1ps
//`define N 7

module ALU #(parameter N=32)(busA, busB, opCode, result, zero, overflow);

//-------------------------------------------Entradas-----------------------------------------//	
	input signed [N-1:0] busA;
   input	signed [N-1:0] busB;
   input [3:0] opCode;
//--------------------------------------------Salidas-----------------------------------------//
	output reg [N-1:0] result;
	output reg zero;
	output reg overflow;
//---------------------------------------------Wires------------------------------------------//	
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		begin
			result = 0;
			zero = 0;
			overflow = 0;
		end
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	always@(*)
		begin
			case(opCode)				
				0: {overflow,result} = busB <<  busA[4:0];	//SLL
				1: {overflow,result} = busB >>  busA[4:0];	//SRL
				2: {overflow,result} = busB >>> busA[4:0];	//SRA
				3: {overflow,result} = busA + busB;				//ADD
				4: {overflow,result} = busA - busB;				//SUB
				5: {overflow,result} = busA & busB;				//AND
				6: {overflow,result} = busA | busB;				//OR
				7: {overflow,result} = busA ^ busB;				//XOR
				8: {overflow,result} = ~(busA | busB);			//NOR
				9: {overflow,result} = (busA < busB);			//SLT
				default: {overflow,result} = 0;
			endcase
			zero = (result==0)? 1'b1 : 1'b0;
		end
endmodule

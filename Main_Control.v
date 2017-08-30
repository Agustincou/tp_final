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
module Main_Control(InstrOP, InstrFunc, RegDst, Branch, BranchType, Jump, MemToReg, MemWrite, ALUSrc,
							ALUShiftImm, RegWrite, LoadImm, ZeroEx, EOP, memReadWidth, aluControlCU);
//-------------------------------------------Entradas-----------------------------------------//
	input [5:0] InstrOP;
	input [5:0] InstrFunc;
//--------------------------------------------Salidas-----------------------------------------//
	output reg RegDst;
	output reg Branch;
	output reg BranchType;
	output reg Jump;
	output reg MemToReg;
	output reg [3:0] MemWrite;
	output reg ALUSrc;
	output reg ALUShiftImm;
	output reg RegWrite;
	output reg LoadImm;
	output reg ZeroEx;
	output reg EOP;
	output reg [1:0] memReadWidth; // 0:Palabra completa 1:Media palabra 2:Byte
	output reg [3:0] aluControlCU;
//---------------------------------------------Wires------------------------------------------//
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		begin
			RegDst = 0;
			Branch = 0;
			BranchType = 0;
			Jump = 0;
			MemToReg = 0;
			MemWrite = 0;
			ALUSrc = 0;
			ALUShiftImm = 0;
			RegWrite = 0;
			LoadImm = 0;
			ZeroEx = 0;
			EOP = 0;
			memReadWidth = 0; // 0:Palabra completa 1:Media palabra 2:Byte
			aluControlCU = 0;
		end
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	always @*
	begin
	case (InstrOP)
		'b100000:
		begin		//LB
			EOP				<= 0; 
			RegDst 			<= 0; 
			Branch 			<= 0;
			BranchType 		<= 0;
			Jump        	<= 0;
			MemToReg		<= 1;
			MemWrite		<= 0;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite	 	<= 1;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 3;
			memReadWidth	<= 2;
		end		
		'b100001:
		begin		//LH
			EOP				<= 0; 
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 1;
			MemWrite		<= 0;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 1;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 3;
			memReadWidth	<= 1;
		end
		'b100011:
		begin		//LW
			EOP				<= 0; 
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 1;
			MemWrite		<= 0;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 1;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 3;
			memReadWidth	<= 0;
		end
		'b100111:
		begin		//LWU
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 1;
			MemWrite		<= 0;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 1;
			LoadImm  		<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 3;
			memReadWidth	<= 0;
		end
		'b100100:
		begin	//LBU
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 1;
			MemWrite		<= 0;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 1;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 3;
			memReadWidth	<= 2;
		end
		'b100101:
		begin	//LHU
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 1;
			MemWrite		<= 0;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 1;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 3;
			memReadWidth	<= 1;
		end
		'b101000:
		begin	//SB
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 0;
			MemWrite		<= 4'd1;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 0;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 3;
			memReadWidth	<= 0;
		end
		'b101001:
		begin	//SH
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 0;
			MemWrite		<= 4'b0011;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 0;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 3;
			memReadWidth	<= 0;
		end
		'b101011:
		begin	//SW
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 0;
			MemWrite		<= 4'b1111;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 0;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 3;
			memReadWidth	<= 0;
		end
		'b001000:
		begin	//ADDI
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 0;
			MemWrite		<= 0;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 1;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 3;
			memReadWidth	<= 0;
		end
		'b001100:
		begin	//ANDI
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 0;
			MemWrite		<= 0;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 1;
			LoadImm			<= 0;
			ZeroEx			<= 1;
			aluControlCU	<= 5;
			memReadWidth	<= 0;
		end
		'b001101:
		begin	//ORI
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 0;
			MemWrite		<= 0;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 1;
			LoadImm			<= 0;
			ZeroEx			<= 1;
			aluControlCU	<= 6;
			memReadWidth	<= 0;
		end
		'b001110:
		begin	//XORI
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 0;
			MemWrite		<= 0;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 1;
			LoadImm			<= 0;
			ZeroEx			<= 1;
			aluControlCU	<= 7;
			memReadWidth	<= 0;
		end
		'b001010:
		begin	//SLTI
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 0;
			MemWrite		<= 0;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 1;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 9;
			memReadWidth	<= 0;
		end	
	   'b001111:
		begin	//LUI
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 0;
			MemWrite		<= 0;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 1;
			LoadImm			<= 1;
			ZeroEx			<= 0;
			aluControlCU	<= 0;
			memReadWidth	<= 0;
		end	
		'b000100:
		begin //BEQ
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 1;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 0;
			MemWrite		<= 0;
			ALUSrc			<= 0;
			ALUShiftImm		<= 0;
			RegWrite		<= 0;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 4;
			memReadWidth	<= 0;
		end
		'b000101:
		begin //BNE
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 1;
			BranchType		<= 1;
			Jump        	<= 0;
			MemToReg		<= 0;
			MemWrite		<= 0;
			ALUSrc			<= 0;
			ALUShiftImm		<= 0;
			RegWrite		<= 0;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 4;
			memReadWidth	<= 0;
		end
		'b000010:
		begin //J
			EOP				<= 0;
			RegDst			<= 0;
			Branch			<= 1; //No importa
			BranchType		<= 1; //No importa
			Jump        	<= 1;
			MemToReg		<= 0;
			MemWrite		<= 0;
			ALUSrc			<= 0;
			ALUShiftImm		<= 0;
			RegWrite		<= 0;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			aluControlCU	<= 4;
			memReadWidth	<= 0;
		end
		'b111111:
		begin // End of Program
			EOP				<= 1;
			RegDst			<= 0;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 0;
			MemWrite		<= 0;
			ALUSrc			<= 1;
			ALUShiftImm		<= 0;
			RegWrite		<= 0;
			LoadImm			<= 0;
			ZeroEx			<= 1;
			aluControlCU	<= 6;
			memReadWidth	<= 0;
		end
		default:
		begin //Tipo R
			EOP				<= 0;
			RegDst			<= 1;
			Branch			<= 0;
			BranchType		<= 0;
			Jump        	<= 0;
			MemToReg		<= 0;
			MemWrite		<= 0;
			ALUSrc			<= 0;
			ALUShiftImm 	<=((InstrFunc==0) ||(InstrFunc==2)||(InstrFunc==3));
			RegWrite		<= 1;
			LoadImm			<= 0;
			ZeroEx			<= 0;
			memReadWidth	<= 0;
			case(InstrFunc)
				6'b000000: aluControlCU <= 0; //SLL
				6'b000010: aluControlCU <= 1; //SRL
				6'b000011: aluControlCU <= 2; //SRA
				6'b000110: aluControlCU <= 1; //SRLV
				6'b000111: aluControlCU <= 2; //SRAV
				6'b000100: aluControlCU <= 0; //SLLV
				6'b100000: aluControlCU <= 3; //ADD
				6'b100010: aluControlCU <= 4; //SUB
				6'b100100: aluControlCU <= 5; //AND
				6'b100101: aluControlCU <= 6; //OR
				6'b100110: aluControlCU <= 7; //XOR
				6'b100111: aluControlCU <= 8; //NOR
				6'b101010: aluControlCU <= 9; //SLT
				default: aluControlCU	<= 'hF;
			endcase
		end		
	endcase
end

endmodule

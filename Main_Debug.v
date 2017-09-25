`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:16:33 12/03/2016 
// Design Name: 
// Module Name:    Main_Debug 
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
module Main_Debug(
//-------------------------------------------Entradas-----------------------------------------//
		input 				clock,
		input 				reset,
		input 				endOfProgram,
		input		[7:0]		uartFifoDataIn,
		input 		  		uartDataAvailable,
		input 				uartDataSent,
		input 	[7:0]		FE_pc,	
		input 	[31:0] 	IF_ID_instr,
		input 	[7:0] 	IF_ID_pcNext,		
		input 	[3:0] 	ID_EX_aluControl,
		input 	[31:0] 	ID_EX_signImm,
		input 	[31:0] 	ID_EX_readData1,
		input 	[31:0] 	ID_EX_readData2,
		input 				ID_EX_aluSrc,
		input 				ID_EX_aluShiftImm,
		input 	[3:0] 	ID_EX_memWrite,
		input 				ID_EX_memToReg,
		input		[1:0] 	ID_EX_memReadWidth,
		input 	[4:0] 	ID_EX_rs,
		input 	[4:0] 	ID_EX_rt,
		input 	[4:0] 	ID_EX_rd,
		input 	[4:0] 	ID_EX_sa,
		input 				ID_EX_regDst,
		input 				ID_EX_loadImm,
		input 				ID_EX_regWrite,
		input 	[4:0] 	EX_MEM_writeReg,
		input 	[31:0] 	EX_MEM_writeData,
		input 	[31:0] 	EX_MEM_aluOut,
		input 				EX_MEM_regWrite,
		input 				EX_MEM_memToReg,
		input 	[3:0]		EX_MEM_memWrite,
		input 	[1:0] 	EX_MEM_memReadWidth,
		input 	[4:0] 	MEM_WB_writeReg,
		input 	[31:0] 	MEM_WB_aluOut,
		input 	[31:0] 	MEM_WB_readData,
		input 				MEM_WB_regWrite,
		input 				MEM_WB_memToReg,
		input 	[31:0]	reg0,
		input 	[31:0]	reg1,
		input 	[31:0]	reg2,
		input 	[31:0]	reg3,
		input 	[31:0]	reg4,
		input 	[31:0]	reg5,
		input 	[31:0]	reg6,
		input 	[31:0]	reg7,
		input 	[31:0]	reg8,
		input 	[31:0]	reg9,
		input 	[31:0]	reg10,
		input 	[31:0]	reg11,
		input 	[31:0]	reg12,
		input 	[31:0]	reg13,
		input 	[31:0]	reg14,
		input 	[31:0]	reg15,
		input 	[31:0]	reg16,
		input 	[31:0]	reg17,
		input 	[31:0]	reg18,
		input 	[31:0]	reg19,
		input 	[31:0]	reg20,
		input 	[31:0]	reg21,
		input 	[31:0]	reg22,
		input 	[31:0]	reg23,
		input 	[31:0]	reg24,
		input 	[31:0]	reg25,
		input 	[31:0]	reg26,
		input 	[31:0]	reg27,
		input 	[31:0]	reg28,
		input 	[31:0]	reg29,
		input 	[31:0]	reg30,
		input 	[31:0]	reg31,		
		input 	[31:0] 	memoryRamData,
//--------------------------------------------Salidas-----------------------------------------//
		output 	[7:0] 	dataToSend,			// Lo que se envia por UART a la pc. Se envia de a 8 bits
		output 	reg		nextFifoValue,		// Para que la FIFO me entregue el siguiente valor
		output 	reg		writeFifoFlag,		// flag para que la FIFO de salida escriba un dato
		output 	reg 		datapathOn,			// Activa el pipe
		output 	reg 		datapathReset,		// flag para vaciar el pipe
		output 				debugRamSrc,		// flag para activar la dirección alternativa en la RAM
		output 	[7:0]		debugMemAddr,	// dirección para leer la memoria desde el debug
		output 	reg 		ledIdle,			// led del estado IDLE
		output 	reg 		notStartUartTrans,	// flag para evitar que la UART envíe
		output 	reg[7:0]	sendCounter,	// cantidad de datos enviados
		output 	reg 		flagDone			// cuando esta en uno termino de enviar
    );//POR DEFAULT LOS OUTPUT SON WIRES
//---------------------------------------------Wires------------------------------------------//
	// array de datos a enviar para debug
	wire [7:0] data [246:0];
//-------------------------------------------Registros----------------------------------------//
	reg [2:0] current_state;
	reg [2:0] next_state;
	reg restartCounter;
	
	localparam [2:0]	INIT = 0,
							IDLE = 1,
							CONTINUOUS = 2,
							STEP = 3,
							SEND = 4;
	 
	//cantidad total de datos a enviar
	localparam [7:0]cantDatos=8'd247;
//-----------------------------------------Inicializacion-------------------------------------//
	initial
		begin
			nextFifoValue = 0;
			writeFifoFlag = 0;
			datapathOn = 0;
			datapathReset = 0;
			ledIdle = 0;
			notStartUartTrans = 1;
			sendCounter = 0;
			flagDone	= 0;
			
			current_state = 0;
			next_state = 0;
			restartCounter = 0;
		end
//--------------------------------------Declaracion de Bloques--------------------------------//
//--------------------------------------------Logica------------------------------------------//
	assign data[0] = 	  FE_pc;
	assign data[1] =    IF_ID_instr   		 [31:24];
	assign data[2] =    IF_ID_instr   		 [23:16];
	assign data[3] =    IF_ID_instr   		 [15:8];
	assign data[4] =    IF_ID_instr   		 [7:0];
	assign data[5] =    IF_ID_pcNext;
	assign data[6] =  	{4'b0,ID_EX_aluControl};
	assign data[7] =    ID_EX_signImm        [31:24];
	assign data[8] =    ID_EX_signImm        [23:16];
	assign data[9] =    ID_EX_signImm        [15:8];
	assign data[10] =   ID_EX_signImm        [7:0];
	assign data[11] =   ID_EX_readData1      [31:24];
	assign data[12] =   ID_EX_readData1      [23:16];
	assign data[13] =   ID_EX_readData1      [15:8];
	assign data[14] =   ID_EX_readData1      [7:0];
	assign data[15] =   ID_EX_readData2      [31:24];
	assign data[16] =   ID_EX_readData2      [23:16];
	assign data[17] =   ID_EX_readData2      [15:8];
	assign data[18] =   ID_EX_readData2      [7:0];
	assign data[19] =   {7'b0,ID_EX_aluSrc};
	assign data[20] =   {7'b0,ID_EX_aluShiftImm};
	assign data[21] =   {4'b0,ID_EX_memWrite};
	assign data[22] =   {7'b0,ID_EX_memToReg};
	assign data[23] =   {6'b0,ID_EX_memReadWidth};
	assign data[24] =   {3'b0,ID_EX_rs};
	assign data[25] =   {3'b0,ID_EX_rt};
	assign data[26] =   {3'b0,ID_EX_rd};
	assign data[27] =   {3'b0,ID_EX_sa};
	assign data[28] =   {7'b0,ID_EX_regDst};
	assign data[29] =   {7'b0,ID_EX_loadImm};
	assign data[30] =   {7'b0,ID_EX_regWrite};
	assign data[31] =   {3'b0,EX_MEM_writeReg};
	assign data[32] =   EX_MEM_writeData     [31:24];
	assign data[33] =   EX_MEM_writeData     [23:16];
	assign data[34] =   EX_MEM_writeData     [15:8];
	assign data[35] =   EX_MEM_writeData     [7:0];
	assign data[36] =   EX_MEM_aluOut        [31:24];
	assign data[37] =   EX_MEM_aluOut        [23:16];
	assign data[38] =   EX_MEM_aluOut        [15:8];
	assign data[39] =   EX_MEM_aluOut        [7:0];
	assign data[40] =   {7'b0,EX_MEM_regWrite};
	assign data[42] =   {4'b0,EX_MEM_memWrite};
	assign data[43] =   {6'b0,EX_MEM_memReadWidth};
	assign data[44] =   {3'b0,MEM_WB_writeReg};
	assign data[45] =   MEM_WB_aluOut        [31:24];
	assign data[46] =   MEM_WB_aluOut        [23:16];
	assign data[47] =   MEM_WB_aluOut        [15:8];
	assign data[48] =   MEM_WB_aluOut        [7:0];
	assign data[49] =   MEM_WB_readData      [31:24];
	assign data[50] =   MEM_WB_readData      [23:16];
	assign data[51] =   MEM_WB_readData      [15:8];
	assign data[52] =   MEM_WB_readData      [7:0];
	assign data[53] =   {7'b0,MEM_WB_regWrite};
	assign data[54] =   {7'b0,MEM_WB_memToReg};
	assign data[55] =    reg0				 [31:24];
	assign data[56] =    reg0    			 [23:16];
	assign data[57] =    reg0				 [15:8];
	assign data[58] =    reg0				 [7:0];
	assign data[59] =    reg1				 [31:24];
	assign data[60] =    reg1				 [23:16];
	assign data[61] =    reg1				 [15:8];
	assign data[62] =    reg1				 [7:0];
	assign data[63] =    reg2				 [31:24];
	assign data[64] =    reg2				 [23:16];
	assign data[65] =    reg2				 [15:8];
	assign data[66] =    reg2				 [7:0];
	assign data[67] =    reg3				 [31:24];
	assign data[68] =    reg3		 		 [23:16];
	assign data[69] =    reg3		     	 [15:8];  
	assign data[70] =    reg3				 [7:0]; 
	assign data[71] =	 	reg4		 		 [31:24];   
	assign data[72] =    reg4				 [23:16];
	assign data[73] =    reg4				 [15:8];
	assign data[74] =    reg4				 [7:0];
	assign data[75] =    reg5				 [31:24];
	assign data[76] =    reg5       		 [23:16];
	assign data[77] =    reg5				 [15:8];
	assign data[78] =    reg5				 [7:0];
	assign data[79] =    reg6				 [31:24];
	assign data[80] =    reg6				 [23:16];
	assign data[81] =    reg6				 [15:8];
	assign data[82] =    reg6				 [7:0];
	assign data[83] =    reg7				 [31:24];
	assign data[84] =    reg7				 [23:16];
	assign data[85] =    reg7				 [15:8];
	assign data[86] =    reg7				 [7:0];
	assign data[87] =    reg8				 [31:24];
	assign data[88] =    reg8				 [23:16];
	assign data[89] =    reg8				 [15:8];  
	assign data[90] =    reg8				 [7:0]; 
	assign data[91] =	 	reg9				 [31:24];   
	assign data[92] =    reg9				 [23:16];
	assign data[93] =    reg9				 [15:8];
	assign data[94] =    reg9		 		 [7:0];
	assign data[95] =    reg10				 [31:24];
   assign data[96] =    reg10    		 [23:16];
   assign data[97] =    reg10				 [15:8];
   assign data[98] =    reg10				 [7:0];
   assign data[99] =    reg11				 [31:24];
   assign data[100] =   reg11				 [23:16];
   assign data[101] =   reg11				 [15:8];
   assign data[102] =   reg11				 [7:0];
   assign data[103] =   reg12				 [31:24];
   assign data[104] =   reg12				 [23:16];
   assign data[105] =   reg12				 [15:8];
   assign data[106] =   reg12				 [7:0];
   assign data[107] =   reg13				 [31:24];
   assign data[108] =   reg13		 		 [23:16];
   assign data[109] =   reg13		     	 [15:8];  
   assign data[110] =   reg13				 [7:0]; 
   assign data[111] =	reg14		 		 [31:24];   
   assign data[112] =   reg14				 [23:16];
   assign data[113] =   reg14				 [15:8];
   assign data[114] =   reg14				 [7:0];
   assign data[115] =   reg15				 [31:24];
   assign data[116] =   reg15       	 [23:16];
   assign data[117] =   reg15				 [15:8];
   assign data[118] =   reg15				 [7:0];
   assign data[119] =   reg16				 [31:24];
   assign data[120] =   reg16				 [23:16];
   assign data[121] =   reg16				 [15:8];
   assign data[122] =   reg16				 [7:0];
   assign data[123] =   reg17				 [31:24];
   assign data[124] =   reg17				 [23:16];
   assign data[125] =   reg17				 [15:8];
   assign data[126] =   reg17				 [7:0];
   assign data[127] =   reg18				 [31:24];
   assign data[128] =   reg18				 [23:16];
   assign data[129] =   reg18				 [15:8];  
   assign data[130] =   reg18				 [7:0]; 
   assign data[131] =	reg19				 [31:24];   
   assign data[132] =   reg19				 [23:16];
   assign data[133] =   reg19				 [15:8];
   assign data[134] =   reg19		 		 [7:0];	
	assign data[135] =   reg20				 [31:24];
   assign data[136] =   reg20    		 [23:16];
   assign data[137] =   reg20				 [15:8];
   assign data[138] =   reg20				 [7:0];
   assign data[139] =   reg21				 [31:24];
   assign data[140] =   reg21				 [23:16];
   assign data[141] =   reg21				 [15:8];
   assign data[142] =   reg21				 [7:0];
   assign data[143] =   reg22				 [31:24];
   assign data[144] =   reg22				 [23:16];
   assign data[145] =   reg22				 [15:8];
   assign data[146] =   reg22				 [7:0];
   assign data[147] =   reg23				 [31:24];
   assign data[148] =   reg23		 		 [23:16];
   assign data[149] =   reg23		     	 [15:8];  
   assign data[150] =   reg23				 [7:0]; 
   assign data[151] =	reg24		 		 [31:24];   
   assign data[152] =   reg24				 [23:16];
   assign data[153] =   reg24				 [15:8];
   assign data[154] =   reg24				 [7:0];
   assign data[155] =   reg25				 [31:24];
   assign data[156] =   reg25       	 [23:16];
   assign data[157] =   reg25				 [15:8];
   assign data[158] =   reg25				 [7:0];
   assign data[159] =   reg26				 [31:24];
   assign data[160] =   reg26				 [23:16];
   assign data[161] =   reg26				 [15:8];
   assign data[162] =   reg26				 [7:0];
   assign data[163] =   reg27				 [31:24];
   assign data[164] =   reg27				 [23:16];
   assign data[165] =   reg27				 [15:8];
   assign data[166] =   reg27				 [7:0];
   assign data[167] =   reg28				 [31:24];
   assign data[168] =   reg28				 [23:16];
   assign data[169] =   reg28				 [15:8];  
   assign data[170] =   reg28				 [7:0]; 
   assign data[171] =	reg29				 [31:24];   
   assign data[172] =   reg29				 [23:16];
   assign data[173] =   reg29				 [15:8];
   assign data[174] =   reg29		 		 [7:0];
	assign data[175] =   reg30				 [31:24];
   assign data[176] =   reg30				 [23:16];
   assign data[177] =   reg30				 [15:8];  
   assign data[178] =   reg30				 [7:0]; 
   assign data[179] =	reg31				 [31:24];   
   assign data[180] =   reg31				 [23:16];
   assign data[181] =   reg31				 [15:8];
   assign data[182] =   reg31		 		 [7:0];		
   assign data[183] =   memoryRamData		 [31:24];
   assign data[184] =   memoryRamData		 [23:16];
   assign data[185] =   memoryRamData		 [15:8];
   assign data[186] =   memoryRamData		 [7:0];
   assign data[187] =   memoryRamData		 [31:24];
   assign data[188] =   memoryRamData		 [23:16];
   assign data[189] =   memoryRamData		 [15:8];
   assign data[190] =   memoryRamData		 [7:0];
   assign data[191] =   memoryRamData		 [31:24];
   assign data[192] =   memoryRamData		 [23:16];
   assign data[193] =   memoryRamData		 [15:8];
   assign data[194] =   memoryRamData		 [7:0];
   assign data[195] =   memoryRamData		 [31:24];
   assign data[196] =   memoryRamData		 [23:16];
   assign data[197] =   memoryRamData		 [15:8];
   assign data[198] =   memoryRamData		 [7:0];
   assign data[199] =   memoryRamData		 [31:24];
   assign data[200] =   memoryRamData		 [23:16];
   assign data[201] =   memoryRamData		 [15:8];
   assign data[202] =   memoryRamData		 [7:0];
	assign data[203] =   memoryRamData		 [31:24];
   assign data[204] =   memoryRamData		 [23:16];
   assign data[205] =   memoryRamData		 [15:8];
   assign data[206] =   memoryRamData		 [7:0];
   assign data[207] =   memoryRamData		 [31:24];
   assign data[208] =   memoryRamData		 [23:16];
   assign data[209] =   memoryRamData		 [15:8];
   assign data[210] =   memoryRamData		 [7:0];
   assign data[211] =   memoryRamData		 [31:24];
   assign data[212] =   memoryRamData		 [23:16];
   assign data[213] =   memoryRamData		 [15:8];
   assign data[214] =   memoryRamData		 [7:0];
   assign data[215] =   memoryRamData		 [31:24];
   assign data[216] =   memoryRamData		 [23:16];
   assign data[217] =   memoryRamData		 [15:8];
   assign data[218] =   memoryRamData		 [7:0];
   assign data[219] =   memoryRamData		 [31:24];
   assign data[220] =   memoryRamData		 [23:16];
   assign data[221] =   memoryRamData		 [15:8];
   assign data[222] =   memoryRamData		 [7:0];
	assign data[223] =   memoryRamData		 [31:24];
   assign data[224] =   memoryRamData		 [23:16];
   assign data[225] =   memoryRamData		 [15:8];
   assign data[226] =   memoryRamData		 [7:0];
   assign data[227] =   memoryRamData		 [31:24];
   assign data[228] =   memoryRamData		 [23:16];
   assign data[229] =   memoryRamData		 [15:8];
   assign data[230] =   memoryRamData		 [7:0];
   assign data[231] =   memoryRamData		 [31:24];
   assign data[232] =   memoryRamData		 [23:16];
   assign data[233] =   memoryRamData		 [15:8];
   assign data[234] =   memoryRamData		 [7:0];
   assign data[235] =   memoryRamData		 [31:24];
   assign data[236] =   memoryRamData		 [23:16];
   assign data[237] =   memoryRamData		 [15:8];
   assign data[238] =   memoryRamData		 [7:0];
   assign data[239] =   memoryRamData		 [31:24];
   assign data[240] =   memoryRamData		 [23:16];
   assign data[241] =   memoryRamData		 [15:8];
   assign data[242] =   memoryRamData		 [7:0];
	assign data[243] =   memoryRamData		 [31:24];
   assign data[244] =   memoryRamData		 [23:16];
   assign data[245] =   memoryRamData		 [15:8];
   assign data[246] =   memoryRamData		 [7:0];

	assign dataToSend = data[sendCounter];
	assign debugRamSrc = (current_state==SEND); //En estado SEND, la memoria usa la direccion del debug
	assign debugMemAddr = (sendCounter>=183 && sendCounter<=186)? 0 :
								  (sendCounter>=187 && sendCounter<=190)? 1 :
								  (sendCounter>=191 && sendCounter<=194)? 2 :
								  (sendCounter>=195 && sendCounter<=198)? 3 :
								  (sendCounter>=199 && sendCounter<=202)? 4 :
								  (sendCounter>=203 && sendCounter<=206)? 5 :
								  (sendCounter>=207 && sendCounter<=210)? 6 :
								  (sendCounter>=211 && sendCounter<=214)? 7 :
								  (sendCounter>=215 && sendCounter<=218)? 8 :
								  (sendCounter>=219 && sendCounter<=222)? 9 :
								  (sendCounter>=223 && sendCounter<=226)? 10:
								  (sendCounter>=227 && sendCounter<=230)? 11:
								  (sendCounter>=231 && sendCounter<=234)? 12:
								  (sendCounter>=235 && sendCounter<=238)? 13:
								  (sendCounter>=239 && sendCounter<=242)? 14:
								  (sendCounter>=243 && sendCounter<=246)? 15: 0;
								  
								  
	always @(posedge clock) begin
		if(reset)begin
			current_state = INIT ;
			sendCounter = 0;
		end
		else begin
			current_state = next_state;
			if(current_state==SEND && (uartDataSent || sendCounter==cantDatos))begin
				sendCounter = sendCounter+1;
			end
			if(current_state!=SEND) begin
				sendCounter = 0;
			end

		end
	end

	always @(*) begin
		case(current_state)
			INIT:begin
				writeFifoFlag=0;
				nextFifoValue=0;
				ledIdle=0;
				datapathReset=1;
				datapathOn=0;
				restartCounter=0;
				notStartUartTrans=1;
				next_state=IDLE;
			end
			IDLE:begin
				ledIdle=1;
				datapathReset=1;
				datapathOn=0;
				flagDone=0;
				notStartUartTrans=1;
				if(uartDataAvailable)begin
					if(uartFifoDataIn=="c")begin
						next_state=CONTINUOUS;
						datapathReset=0;
					end
					else if (uartFifoDataIn=="s")begin
						next_state=STEP;
						datapathReset=0;
					end
					else begin
						next_state=IDLE;
					end
					nextFifoValue=1;
			   end
				else begin
					nextFifoValue=0;
				end
			end
			CONTINUOUS: begin
				ledIdle=0;
				datapathReset=0;
				nextFifoValue=0;
				flagDone=0;
				datapathOn=1;
				if(endOfProgram)
					next_state=SEND;
				else
					next_state=CONTINUOUS;
			end
			STEP: begin
				ledIdle=0;
				datapathReset=0;
				restartCounter=0;
				notStartUartTrans=1;
				flagDone=0;
				if(uartDataAvailable)begin
					if(uartFifoDataIn=="n")begin
						next_state=SEND;
						datapathOn=1;
					end
					else begin
						next_state=STEP;
						datapathOn=0;
					end
					nextFifoValue=1;
				end
				else begin
					next_state=STEP;
					nextFifoValue=0;
					datapathOn=0;
				end
			end
			SEND: begin
				ledIdle=0;
				datapathReset=0;
				nextFifoValue=0;
				datapathOn=0;
				if(flagDone && !endOfProgram)begin
					// se mandó el dato pero el programa no terminó
					next_state=STEP;
				end
				else if(flagDone && endOfProgram)begin
					// si terminó el programa y se envió el último dato
					next_state=IDLE;
				end
				else begin
					// si no terminó de mandar datos hay que volver a SEND
				   next_state=SEND;
					writeFifoFlag=1;
					if(sendCounter>=cantDatos)begin
						// si ya alcanzó la cantidad máxima de datos
						// levanta la bandera de que terminó de enviar
						// y bloquea la UART
						flagDone=1;
						notStartUartTrans=1;
					end
					else begin
						flagDone=0;
						notStartUartTrans=0; //Se le dice a la uart que envie
					end
				end
			end
			default:begin
				next_state=INIT;
			end
		endcase
	end

endmodule

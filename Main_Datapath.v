`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:15:03 12/03/2016 
// Design Name: 
// Module Name:    Main_Datapath 
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
module Main_Datapath(clk, reset, uartRx, 
							uartTx, ALUzero, ALUOverflow, ledIdle, sentFlag, notStartUartTx, ledDataAvailable, sendCounter);
//-------------------------------------------Entradas-----------------------------------------//
	input clk;    // clock principal
	input reset;  // reset general
	input uartRx;
//--------------------------------------------Salidas-----------------------------------------//
	output uartTx;
	output ALUzero;
	output ALUOverflow;
	output ledIdle;
	output sentFlag;			// bit de dato enviado en la unidad de debug
	output notStartUartTx;		// bit de frenado de la UART desde la unidad de debug	
	output ledDataAvailable;	// bit de dato disponible para lectura en la unidad de debug
	output [7:0] sendCounter;	// contador de la unidad de debug
//---------------------------------------------Wires------------------------------------------//
	wire [31:0]instruction;
	wire [31:0]instructionID;
	
	wire regWrite;
	wire regWriteEX;
	wire regWriteMEM;
	wire regWriteWB;
	 
	wire memToReg;
	wire memToRegEX;
	wire memToRegMEM;
	wire memToRegWB;
	 
	wire [3:0]memWrite;
	wire [3:0]memWriteEX;
	wire [3:0]memWriteMEM;
	 
	wire [3:0]aluControl;
	wire [3:0]aluControlEX;
	 
	wire aluSrc;
	wire aluSrcEX;
	 
	wire aluShiftImm;
	wire aluShiftImmEX;
	 
	wire regDst;
	wire regDstEX;
	 
	wire loadImm;
	wire loadImmEX;
	 
	wire branch;
	wire branchType;
	wire jump;
	 
	wire endOfProgramFlag;
	wire endOfProgramFlagEX;
	wire endOfProgramFlagMEM;
	wire endOfProgramFlagWB;
		 
	wire [1:0] memReadWidth;
	wire [1:0] memReadWidthEX;
	wire [1:0] memReadWidthMEM;

	wire [31:0]sigExtOut;
	wire [31:0]sigExtEX;
	 
	wire zeroExtendFlag;

	wire [31:0]aluOut;
	wire [31:0]aluOutMEM;
	wire [31:0]aluOutWB;
	 
	wire aluZero;
	wire aluOverflow;

	wire [31:0]readData1;
	wire [31:0]readData1EX;
	wire [31:0]readData2;
	wire [31:0]readData2EX;
	 
	wire [31:0]readDataMemory;
	wire [31:0]readDataMemoryMasked;
	 
	wire [31:0]memoryOutWB;
	 
	wire [7:0] PC;
	wire [7:0] pcFE;
	 
	wire [7:0] pcNext;
	wire [7:0] pcNextID;
	 
	wire [4:0]rsEX;
	wire [4:0]rtEX;
	wire [4:0]rdEX;
	wire [4:0]shamtEX;
		
	wire [4:0]writeRegisterMEM;
	wire [4:0]writeRegisterWB;
	 
	wire [7:0]pcBranchAddr;
	 
	wire [31:0] writeDataEX; 
	wire [31:0] writeDataMEM;
	 
	//Salidas Hazard Unit
	wire stallFE;
	wire stallID;
	wire forwardAID;
	wire forwardBID;
	wire flushEX;
	wire [1:0] forwardAEX;
	wire [1:0] forwardBEX;
	 
	 
	wire uartReadFlag;
	wire [7:0]uartFifoDataIn;
	wire uartDataAvailable;
	wire [7:0]dataToUartOutFifo;
	wire debugEnable;
	wire debugReset;

	wire [4:0]writeRegister;
	wire [31:0]aluOperand1;
	wire [31:0]aluOperand2;
	wire [31:0] resultWB;
	wire pcSrc; 
	wire branchTaken;
	
	wire debugRamSrc;
	wire [7:0] debugMemAddr;
	wire [7:0] ramDataAddr;
	wire [3:0] WEA;
	
	wire [31:0]srcAEX;
	wire [31:0]srcBEX;
	wire [31:0]branchSrcA;
	wire [31:0]branchSrcB;
	
	wire uartDataSent;
	wire notStartUartTrans;
	wire [31:0]regDebug0;
	wire [31:0]regDebug1;
	wire [31:0]regDebug2;
	wire [31:0]regDebug3;
	wire [31:0]regDebug4;
	wire [31:0]regDebug5;
	wire [31:0]regDebug6;
	wire [31:0]regDebug7;
	wire [31:0]regDebug8;
	wire [31:0]regDebug9;
	wire [31:0]regDebug10;
	wire [31:0]regDebug11;
	wire [31:0]regDebug12;
	wire [31:0]regDebug13;
	wire [31:0]regDebug14;
	wire [31:0]regDebug15;
	wire [31:0]regDebug16;
	wire [31:0]regDebug17;
	wire [31:0]regDebug18;
	wire [31:0]regDebug19;
	wire [31:0]regDebug20;
	wire [31:0]regDebug21;
	wire [31:0]regDebug22;
	wire [31:0]regDebug23;
	wire [31:0]regDebug24;
	wire [31:0]regDebug25;
	wire [31:0]regDebug26;
	wire [31:0]regDebug27;
	wire [31:0]regDebug28;
	wire [31:0]regDebug29;
	wire [31:0]regDebug30;
	wire [31:0]regDebug31;
	
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
//--------------------------------------Declaracion de Bloques--------------------------------//
	Main_Control unit_control(
		//Entradas
	 	.InstrOP(instructionID[31:26]),
		.InstrFunc(instructionID[5:0]),
		
		//Salidas
		.RegDst(regDst),
		.Branch(branch),
		.BranchType(branchType),
		.Jump(jump),
		.MemToReg(memToReg),
		.MemWrite(memWrite),
		.ALUSrc(aluSrc),
		.ALUShiftImm(aluShiftImm),
		.RegWrite(regWrite),
		.LoadImm(loadImm),
		.ZeroEx(zeroExtendFlag),
		.EOP(endOfProgramFlag),
		.memReadWidth(memReadWidth), // 0:Palabra completa 1:Media palabra 2:Byte
	   .aluControlCU(aluControl)
	 );
	 
	DataMemory ram(
	  .clka(clk),
	  .wea(WEA), 
	  .addra(ramDataAddr),
	  .dina(writeDataMEM),
	  .douta(readDataMemory)
	);
	
	InstructionMemory rom (
	  .clka(clk), 
	  .addra(pcFE),
	  .douta(instruction)
	);

	 Register_File reg_bank(
		//Entradas
		.clk(clk),
		.wr_enable3(regWriteWB),
		.read_addr1(instructionID[25:21]),
		.read_addr2(instructionID[20:16]),
		.write_addr3(writeRegisterWB),
		.reset(reset),
		.write_data3(resultWB),
		
		//Salidas
		.read_data1(readData1),
		.read_data2(readData2),
		.read_data_to_debug_0(regDebug0),
		.read_data_to_debug_1(regDebug1),
		.read_data_to_debug_2(regDebug2),
		.read_data_to_debug_3(regDebug3),
		.read_data_to_debug_4(regDebug4),
		.read_data_to_debug_5(regDebug5),
		.read_data_to_debug_6(regDebug6),
		.read_data_to_debug_7(regDebug7),
		.read_data_to_debug_8(regDebug8),
		.read_data_to_debug_9(regDebug9),
		.read_data_to_debug_10(regDebug10),
		.read_data_to_debug_11(regDebug11),
		.read_data_to_debug_12(regDebug12),
		.read_data_to_debug_13(regDebug13),
		.read_data_to_debug_14(regDebug14),
		.read_data_to_debug_15(regDebug15),
		.read_data_to_debug_16(regDebug16),
		.read_data_to_debug_17(regDebug17),
		.read_data_to_debug_18(regDebug18),
		.read_data_to_debug_19(regDebug19),
		.read_data_to_debug_20(regDebug20),
		.read_data_to_debug_21(regDebug21),
		.read_data_to_debug_22(regDebug22),
		.read_data_to_debug_23(regDebug23),
		.read_data_to_debug_24(regDebug24),
		.read_data_to_debug_25(regDebug25),
		.read_data_to_debug_26(regDebug26),
		.read_data_to_debug_27(regDebug27),
		.read_data_to_debug_28(regDebug28),
		.read_data_to_debug_29(regDebug29),
		.read_data_to_debug_30(regDebug30),
		.read_data_to_debug_31(regDebug31)
	 );
	 
	 ALU alu(
		//Entradas
		.busA(aluOperand1),
		.busB(aluOperand2),
		.opCode(aluControlEX),
		
		//Salidas
		.result(aluOut),
		.zero(aluZero),
		.overflow(aluOverflow)
	 );
	 
	 Sign_Extend signExt(
		//Entradas
		.a(instructionID[15:0]),
		.zeroEx(zeroExtendFlag),
		
		//Salidas
		.y(sigExtOut)
	 );
	 
	 Sumador branchPCAdd(
		//Entradas
		.a(pcNextID),
		.b(sigExtOut[7:0]),
		
		//Salidas
		.result(pcBranchAddr)
	 );
	 
	 //sumador del contador de programa
	 Sumador PCAdd(
		//Entradas
		.a(pcFE),
		.b(8'b1),		// suma 1 y no 4 porque la memoria direcciones palabras de 32 bits, no bytes
		
		//Salidas
		.result(pcNext)	// genera el próximo contador de programa
	 );

	IF_ID if_id(
		//Entradas
		.clk(clk),
		.reset(reset),
		.enableDebug(debugEnable),
		.resetDebug(debugReset),
		.stall_ID(stallID),
		.clear(pcSrc),
		.instruction_in(instruction),
		.programCounter_in(pcNext),
		
		//Salidas
		.instruction_out(instructionID),
		.programCounter_out(pcNextID)	
	);

	ID_EX id_ex(
		//Entradas
		.clk(clk),
		.reset(reset),
		.enableDebug(debugEnable),
		.resetDebug(debugReset),
		.syncClr(flushEX),
		.rs_in(instructionID[25:21]),
		.rt_in(instructionID[20:16]),
		.rd_in(instructionID[15:11]),
		.sa_in(instructionID[10:6]),
		.aluControl_in(aluControl),
		.signImm_in(sigExtOut),
		.readData1_in(readData1),
		.readData2_in(readData2),
		.aluSrc_in(aluSrc),
		.aluShiftImm_in(aluShiftImm),
		.regDst_in(regDst),
		.loadImm_in(loadImm),
		.memWrite_in(memWrite),
		.memToReg_in(memToReg),
		.memReadWidth_in(memReadWidth),
		.regWrite_in(regWrite),
		.eop_in(endOfProgramFlag),

		//Salidas
		.aluControl_out(aluControlEX),
		.signImm_out(sigExtEX),
		.readData1_out(readData1EX),
		.readData2_out(readData2EX),
		.aluSrc_out(aluSrcEX),
		.aluShiftImm_out(aluShiftImmEX),
		.memWrite_out(memWriteEX),
		.memToReg_out(memToRegEX),
		.memReadWidth_out(memReadWidthEX),
		.rs_out(rsEX),
		.rt_out(rtEX),
		.rd_out(rdEX),
		.sa_out(shamtEX),
		.regDst_out(regDstEX),
		.loadImm_out(loadImmEX),
		.regWrite_out(regWriteEX),
		.eop_out(endOfProgramFlagEX)			
    );	
			
	EX_MEM ex_mem(
		//Entradas
		.clk(clk),
		.reset(reset),
		.enableDebug(debugEnable),
		.resetDebug(debugReset),
		.writeReg_in(writeRegister),
		.writeData_in(writeDataEX),
		.aluOut_in(aluOut),
		.regWrite_in(regWriteEX),
		.memToReg_in(memToRegEX),
		.memWrite_in(memWriteEX),
		.memReadWidth_in(memReadWidthEX),
		.eop_in(endOfProgramFlagEX),
		
		//Salidas
		.writeReg_out(writeRegisterMEM),
		.writeData_out(writeDataMEM),
		.aluOut_out(aluOutMEM),
		.regWrite_out(regWriteMEM),
		.memToReg_out(memToRegMEM),
		.memWrite_out(memWriteMEM),
		.memReadWidth_out(memReadWidthMEM),
		.eop_out(endOfProgramFlagMEM)
	);			
	 
	 MemoryLoadMask mask (
		//Entradas
		.dataIn(readDataMemory),
		.maskLength(memReadWidthMEM),
		
		//Salidas
		.dataOut(readDataMemoryMasked)
	 );
	 
	 MEM_WB mem_wb(
		//Entradas
		.clk(clk),
		.reset(reset),
		.enableDebug(debugEnable),
		.resetDebug(debugReset),
		.writeReg_in(writeRegisterMEM),
		.aluOut_in(aluOutMEM),
		.readData_in(readDataMemoryMasked),
		.regWrite_in(regWriteMEM),
		.memToReg_in(memToRegMEM),
		.eop_in(endOfProgramFlagMEM),
		
		//Salidas
		.writeReg_out(writeRegisterWB),
		.aluOut_out(aluOutWB),
		.readData_out(memoryOutWB),
		.regWrite_out(regWriteWB),
		.memToReg_out(memToRegWB),
		.eop_out(endOfProgramFlagWB)
    );
	 
	 
	 Program_Counter programCounter(
		//Entradas
		.clk(clk),
		.reset(reset),
		.enableDebug(debugEnable),
		.resetDebug(debugReset),
		.notEnable(stallFE),
		.addr_in(PC),
		
		//Salidas
		.addr_out(pcFE)
	 );
	 
	 Main_Hazard hazards (
		//Entradas
	 	.branchID(branch),
		.rsID(instructionID[25:21]),
		.rtID(instructionID[20:16]),
		.rsEX(rsEX),
		.rtEX(rtEX),
		.writeRegEX(writeRegister),
		.writeRegMEM(writeRegisterMEM),
		.writeRegWB(writeRegisterWB),
		.memToRegEX(memToRegEX),
		.memToRegMEM(memToRegMEM),
		.regWriteEX(regWriteEX),
		.regWriteMEM(regWriteMEM),
		.regWriteWB(regWriteWB),
		
		//Salidas
		.stallFE(stallFE),
		.stallID(stallID),
		.forwardAID(forwardAID),
		.forwardBID(forwardBID),
		.flushEX(flushEX),
		.forwardAEX(forwardAEX),
		.forwardBEX(forwardBEX)
	 );
	 
	 Main_Debug debugUnit(
		//Entradas
		.clock(clk),
		.reset(reset),
		.endOfProgram(endOfProgramFlagWB),
		.uartFifoDataIn(uartFifoDataIn),
		.uartDataAvailable(uartDataAvailable),
		.uartDataSent(uartDataSent),
		.FE_pc(pcFE),	
		.IF_ID_instr(instructionID),
		.IF_ID_pcNext(pcNextID),		
		.ID_EX_aluControl(aluControlEX),
		.ID_EX_signImm(sigExtEX),
		.ID_EX_readData1(readData1EX),
		.ID_EX_readData2(readData2EX),
		.ID_EX_aluSrc(aluSrcEX),
		.ID_EX_aluShiftImm(aluShiftImmEX),
		.ID_EX_memWrite(memWriteEX),
		.ID_EX_memToReg(memToRegEX),
		.ID_EX_memReadWidth(memReadWidthEX),
		.ID_EX_rs(rsEX),
		.ID_EX_rt(rtEX),
		.ID_EX_rd(rdEX),
		.ID_EX_sa(shamtEX),
		.ID_EX_regDst(regDstEX),
		.ID_EX_loadImm(loadImmEX),
		.ID_EX_regWrite(regWriteEX),
		.EX_MEM_writeReg(writeRegisterMEM),
		.EX_MEM_writeData(writeDataMEM),
		.EX_MEM_aluOut(aluOutMEM),
		.EX_MEM_regWrite(regWriteMEM),
		.EX_MEM_memToReg(memToRegMEM),
		.EX_MEM_memWrite(memWriteMEM),
		.EX_MEM_memReadWidth(memReadWidthMEM),
		.MEM_WB_writeReg(writeRegisterWB),
		.MEM_WB_aluOut(aluOutWB),
		.MEM_WB_readData(memoryOutWB),
		.MEM_WB_regWrite(regWriteWB),
		.MEM_WB_memToReg(memToRegWB),
		.reg0(regDebug0),
		.reg1(regDebug1),
		.reg2(regDebug2),
		.reg3(regDebug3),
		.reg4(regDebug4),
		.reg5(regDebug5),
		.reg6(regDebug6),
		.reg7(regDebug7),
		.reg8(regDebug8),
		.reg9(regDebug9),
		.reg10(regDebug10),
		.reg11(regDebug11),
		.reg12(regDebug12),
		.reg13(regDebug13),
		.reg14(regDebug14),
		.reg15(regDebug15),
		.reg16(regDebug16),
		.reg17(regDebug17),
		.reg18(regDebug18),
		.reg19(regDebug19),
		.reg20(regDebug20),
		.reg21(regDebug21),
		.reg22(regDebug22),
		.reg23(regDebug23),
		.reg24(regDebug24),
		.reg25(regDebug25),
		.reg26(regDebug26),
		.reg27(regDebug27),
		.reg28(regDebug28),
		.reg29(regDebug29),
		.reg30(regDebug30),
		.reg31(regDebug31),
		.memoryRamData(readDataMemory),
		
		//Salidas
		.dataToSend(dataToUartOutFifo),
		.nextFifoValue(uartReadFlag),
		.datapathOn(debugEnable),
		.datapathReset (debugReset),
		.debugRamSrc(debugRamSrc),
		.debugMemAddr(debugMemAddr),
		.ledIdle(ledIdle),
		.notStartUartTrans(notStartUartTrans),
		.sendCounter(sendCounter),
		.flagDone(sentFlag)
	 );
	 
	Main_Uart uartMod(
		//Entradas
		.clk(clk),
		.rx(uartRx),
		.uart_reset(reset),
		.readFlag(uartReadFlag),
		.dataToSend(dataToUartOutFifo),
		.uart_tx_start(~notStartUartTrans),
		
		//Salidas
		.receivedData(uartFifoDataIn),
		.dataAvailable(uartDataAvailable),
		.tx(uartTx),
		.uart_tx_done(uartDataSent)
	);
	
	Mux_2in_1out #(5) registerWriteMux(
		.DatoA(rtEX),
		.DatoB(rdEX),
		.Sel(regDstEX),
		.Salida(writeRegister)
	);
	
	Mux_3in_1out regOrImmSelectorMux(
		.DatoA(srcAEX),
		.DatoB(shamtEX),
		.DatoC('d16),
		.Sel((loadImmEX)? 'd2 : aluShiftImmEX),
		.Salida(aluOperand1)
	);
	
	Mux_2in_1out aluSourceSelectorMux(
		.DatoA(srcBEX),
		.DatoB(sigExtEX),
		.Sel(aluSrcEX),
		.Salida(aluOperand2)
	);
	
	Mux_2in_1out #(1) programCounterMux(
		.DatoA(branch & branchTaken),
		.DatoB(1),
		.Sel(jump),
		.Salida(pcSrc)
	);
	
	Mux_2in_1out #(1) branchTakenMux(
		.DatoA(branchSrcA == branchSrcB),
		.DatoB(branchSrcA != branchSrcB),
		.Sel(branchType),
		.Salida(branchTaken)
	);
	
	Mux_2in_1out memToRegMux(
		.DatoA(aluOutWB),
		.DatoB(memoryOutWB),
		.Sel(memToRegWB),
		.Salida(resultWB)
	);
	
	Mux_3in_1out #(8) programCounterAddressMux(
		.DatoA(pcNext),
		.DatoB(pcBranchAddr),
		.DatoC(pcBranchAddr),
		.Sel((jump) ? 'd2 : pcSrc),
		.Salida(PC)
	);
	
	Mux_2in_1out #(4) writeInRamSelectorMux(
		.DatoA(memWriteMEM),
		.DatoB(4'b0),
		.Sel(debugRamSrc),
		.Salida(WEA)
	);
	
	Mux_2in_1out #(8) ramDataAddressMux(
		.DatoA(aluOutMEM[7:0]),
		.DatoB(debugMemAddr),
		.Sel(debugRamSrc),
		.Salida(ramDataAddr)
	);
	
	Mux_3in_1out srcASelectorMux(
		.DatoA(readData1EX),
		.DatoB(resultWB),
		.DatoC(aluOutMEM),
		.Sel(forwardAEX),
		.Salida(srcAEX)
	);
	
	Mux_3in_1out srcBSelectorMux(
		.DatoA(readData2EX),
		.DatoB(resultWB),
		.DatoC(aluOutMEM),
		.Sel(forwardBEX),
		.Salida(srcBEX)
	);
	
	Mux_2in_1out branchSrcASelectorMux(
		.DatoA(readData1),
		.DatoB(aluOutMEM),
		.Sel(forwardAID),
		.Salida(branchSrcA)
	);
	
	Mux_2in_1out branchSrcBSelectorMux(
		.DatoA(readData2),
		.DatoB(aluOutMEM),
		.Sel(forwardBID),
		.Salida(branchSrcB)
	);
//--------------------------------------------Logica------------------------------------------//
	assign ALUzero=aluZero;
	assign ALUOverflow=aluOverflow;
	assign ledDataAvailable=uartDataAvailable;
	assign notStartUartTx = notStartUartTrans;		
	assign writeDataEX = srcBEX;

	//reg uno = 1;
	//assign uartDataAvailable = uno;
	//assign uartFifoDataIn = "c";

endmodule

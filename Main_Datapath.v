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
module Main_Datapath(clk, clk_70, reset, uartRxPin, 
							uartTxPin, ALUzero, ALUOverflow, ledIdle, sentFlag, notStartUartTx, ledDataAvailable, sendCounter);
//-------------------------------------------Entradas-----------------------------------------//
	input clk;    // clock principal
	input clk_70; // clock desfasado 70 grados respecto del principal
	input reset;  // reset general
	input uartRxPin;
//--------------------------------------------Salidas-----------------------------------------//
	output uartTxPin;
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
	 
	wire eopFlag;
	wire eopFlagEX;
	wire eopFlagMEM;
	wire eopFlagWB;
		 
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
	wire [4:0]saEX;
		
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
	 
	 
	wire uartWriteFlag;
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
	wire [31:0]readDataFromRegsToDebug0;
	wire [31:0]readDataFromRegsToDebug1;
	wire [31:0]readDataFromRegsToDebug2;
	wire [31:0]readDataFromRegsToDebug3;
	wire [31:0]readDataFromRegsToDebug4;
	wire [31:0]readDataFromRegsToDebug5;
	wire [31:0]readDataFromRegsToDebug6;
	wire [31:0]readDataFromRegsToDebug7;
	wire [31:0]readDataFromRegsToDebug8;
	wire [31:0]readDataFromRegsToDebug9;
	wire [31:0]readDataFromRegsToDebug10;
	wire [31:0]readDataFromRegsToDebug11;
	wire [31:0]readDataFromRegsToDebug12;
	wire [31:0]readDataFromRegsToDebug13;
	wire [31:0]readDataFromRegsToDebug14;
	wire [31:0]readDataFromRegsToDebug15;
	wire [31:0]readDataFromRegsToDebug16;
	wire [31:0]readDataFromRegsToDebug17;
	wire [31:0]readDataFromRegsToDebug18;
	wire [31:0]readDataFromRegsToDebug19;
	wire [31:0]readDataFromRegsToDebug20;
	wire [31:0]readDataFromRegsToDebug21;
	wire [31:0]readDataFromRegsToDebug22;
	wire [31:0]readDataFromRegsToDebug23;
	wire [31:0]readDataFromRegsToDebug24;
	wire [31:0]readDataFromRegsToDebug25;
	wire [31:0]readDataFromRegsToDebug26;
	wire [31:0]readDataFromRegsToDebug27;
	wire [31:0]readDataFromRegsToDebug28;
	wire [31:0]readDataFromRegsToDebug29;
	wire [31:0]readDataFromRegsToDebug30;
	wire [31:0]readDataFromRegsToDebug31;
	
//-------------------------------------------Registros----------------------------------------//
//-----------------------------------------Inicializacion-------------------------------------//
	/* NO SE PUEDEN INICIALIZAR PORQUE NO SON REG
	initial begin
		uartTxPin = 0;
		ALUzero = 0;
		ALUOverflow = 0;
		ledIdle = 0;
		sentFlag = 0;			// bit de dato enviado en la unidad de debug
		notStartUartTx = 0;		// bit de frenado de la UART desde la unidad de debug	
		ledDataAvailable = 0;	// bit de dato disponible para lectura en la unidad de debug
		sendCounter = b7'0000000;	// contador de la unidad de debug
	end
	*/
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
		.EOP(eopFlag),
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

	 Register_File bank(
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
		.read_data_to_debug_0(readDataFromRegsToDebug0),
		.read_data_to_debug_1(readDataFromRegsToDebug1),
		.read_data_to_debug_2(readDataFromRegsToDebug2),
		.read_data_to_debug_3(readDataFromRegsToDebug3),
		.read_data_to_debug_4(readDataFromRegsToDebug4),
		.read_data_to_debug_5(readDataFromRegsToDebug5),
		.read_data_to_debug_6(readDataFromRegsToDebug6),
		.read_data_to_debug_7(readDataFromRegsToDebug7),
		.read_data_to_debug_8(readDataFromRegsToDebug8),
		.read_data_to_debug_9(readDataFromRegsToDebug9),
		.read_data_to_debug_10(readDataFromRegsToDebug10),
		.read_data_to_debug_11(readDataFromRegsToDebug11),
		.read_data_to_debug_12(readDataFromRegsToDebug12),
		.read_data_to_debug_13(readDataFromRegsToDebug13),
		.read_data_to_debug_14(readDataFromRegsToDebug14),
		.read_data_to_debug_15(readDataFromRegsToDebug15),
		.read_data_to_debug_16(readDataFromRegsToDebug16),
		.read_data_to_debug_17(readDataFromRegsToDebug17),
		.read_data_to_debug_18(readDataFromRegsToDebug18),
		.read_data_to_debug_19(readDataFromRegsToDebug19),
		.read_data_to_debug_20(readDataFromRegsToDebug20),
		.read_data_to_debug_21(readDataFromRegsToDebug21),
		.read_data_to_debug_22(readDataFromRegsToDebug22),
		.read_data_to_debug_23(readDataFromRegsToDebug23),
		.read_data_to_debug_24(readDataFromRegsToDebug24),
		.read_data_to_debug_25(readDataFromRegsToDebug25),
		.read_data_to_debug_26(readDataFromRegsToDebug26),
		.read_data_to_debug_27(readDataFromRegsToDebug27),
		.read_data_to_debug_28(readDataFromRegsToDebug28),
		.read_data_to_debug_29(readDataFromRegsToDebug29),
		.read_data_to_debug_30(readDataFromRegsToDebug30),
		.read_data_to_debug_31(readDataFromRegsToDebug31)
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
		.eop_in(eopFlag),

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
		.sa_out(saEX),
		.regDst_out(regDstEX),
		.loadImm_out(loadImmEX),
		.regWrite_out(regWriteEX),
		.eop_out(eopFlagEX)			
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
		.eop_in(eopFlagEX),
		
		//Salidas
		.writeReg_out(writeRegisterMEM),
		.writeData_out(writeDataMEM),
		.aluOut_out(aluOutMEM),
		.regWrite_out(regWriteMEM),
		.memToReg_out(memToRegMEM),
		.memWrite_out(memWriteMEM),
		.memReadWidth_out(memReadWidthMEM),
		.eop_out(eopFlagMEM)
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
		.eop_in(eopFlagMEM),
		
		//Salidas
		.writeReg_out(writeRegisterWB),
		.aluOut_out(aluOutWB),
		.readData_out(memoryOutWB),
		.regWrite_out(regWriteWB),
		.memToReg_out(memToRegWB),
		.eop_out(eopFlagWB)
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
	 
	 
	 /*
	 Hazard_Unit hazards (
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
	 */
	 
	 /*
	 DebugUnit debugUnit(
		//Entradas
		.clock(clock70),
		.reset(resetGral),
		.endOfProgram(eopFlagWB),
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
		.ID_EX_sa(saEX),
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
		.reg0(readDataFromRegsToDebug0),
		.reg1(readDataFromRegsToDebug1),
		.reg2(readDataFromRegsToDebug2),
		.reg3(readDataFromRegsToDebug3),
		.reg4(readDataFromRegsToDebug4),
		.reg5(readDataFromRegsToDebug5),
		.reg6(readDataFromRegsToDebug6),
		.reg7(readDataFromRegsToDebug7),
		.reg8(readDataFromRegsToDebug8),
		.reg9(readDataFromRegsToDebug9),
		.reg10(readDataFromRegsToDebug10),
		.reg11(readDataFromRegsToDebug11),
		.reg12(readDataFromRegsToDebug12),
		.reg13(readDataFromRegsToDebug13),
		.reg14(readDataFromRegsToDebug14),
		.reg15(readDataFromRegsToDebug15),
		.reg16(readDataFromRegsToDebug16),
		.reg17(readDataFromRegsToDebug17),
		.reg18(readDataFromRegsToDebug18),
		.reg19(readDataFromRegsToDebug19),
		.reg20(readDataFromRegsToDebug20),
		.reg21(readDataFromRegsToDebug21),
		.reg22(readDataFromRegsToDebug22),
		.reg23(readDataFromRegsToDebug23),
		.reg24(readDataFromRegsToDebug24),
		.reg25(readDataFromRegsToDebug25),
		.reg26(readDataFromRegsToDebug26),
		.reg27(readDataFromRegsToDebug27),
		.reg28(readDataFromRegsToDebug28),
		.reg29(readDataFromRegsToDebug29),
		.reg30(readDataFromRegsToDebug30),
		.reg31(readDataFromRegsToDebug31),
		.memoryRamData(readDataMemory),
		
		//Salidas
		.dataToSend(dataToUartOutFifo),
		.nextFifoValue(uartReadFlag),
		.writeFifoFlag(uartWriteFlag),
		.datapathOn(debugEnable),
		.datapathReset (debugReset),
		.debugRamSrc(debugRamSrc),
		.debugMemAddr(debugMemAddr),
		.ledIdle(ledIdle),
		.notStartUartTrans(notStartUartTrans),
		.sendCounter(sendCounter),
		.flagDone(sentFlag)
	 );
	 */
	 
	/*
	UART uartMod(
		//Entradas
		.clock(clock70),
		.uart_rx(uartRxPin),
		.uart_reset(resetGral),
		.readFlag(uartReadFlag),
		.writeFlag(uartWriteFlag),
		.dataToSend(dataToUartOutFifo),
		.uart_tx_start(notStartUartTrans),
		
		//Salidas
		.receivedData(uartFifoDataIn),
		.dataAvailable(uartDataAvailable),
		.uart_tx(uartTxPin),
		.uart_tx_done(uartDataSent)
	);
	*/
	
	Mux_2in_1out mux(
		.DatoA(rtEX),
		.DatoB(rdEX),
		.Sel(regDstEX),
		.Salida(writeRegister)
	);
	
	Mux_3in_1out mux2(
		.DatoA(srcAEX),
		.DatoB(saEX),
		.DatoC('d16),
		.Sel((loadImmEX << 1) + aluShiftImmEX),
		.Salida(aluOperand1)
	);
	
	Mux_2in_1out mux3(
		.DatoA(srcBEX),
		.DatoB(sigExtEX),
		.Sel(aluSrcEX),
		.Salida(aluOperand2)
	);
	
	Mux_2in_1out mux4(
		.DatoA(branch & branchTaken),
		.DatoB(1),
		.Sel(jump),
		.Salida(pcSrc)
	);
	
	Mux_2in_1out mux5(
		.DatoA(branchSrcA == branchSrcB),
		.DatoB(branchSrcA != branchSrcB),
		.Sel(branchType),
		.Salida(branchTaken)
	);
	
	Mux_2in_1out mux6(
		.DatoA(aluOutWB),
		.DatoB(memoryOutWB),
		.Sel(memToRegWB),
		.Salida(resultWB)
	);
	
	Mux_3in_1out mux7(
		.DatoA(pcNext),
		.DatoB(pcBranchAddr),
		.DatoC(pcBranchAddr),
		.Sel((jump << 1) + pcSrc),
		.Salida(PC)
	);
	
	Mux_2in_1out mux8(
		.DatoA(memWriteMEM),
		.DatoB(4'b0),
		.Sel(debugRamSrc),
		.Salida(WEA)
	);
	
	Mux_2in_1out mux9(
		.DatoA(aluOutMEM[7:0]),
		.DatoB(debugMemAddr),
		.Sel(debugRamSrc),
		.Salida(ramDataAddr)
	);
	
	Mux_3in_1out mux10(
		.DatoA(readData1EX),
		.DatoB(resultWB),
		.DatoC(aluOutMEM),
		.Sel(forwardAEX),
		.Salida(srcAEX)
	);
	
	Mux_3in_1out mux11(
		.DatoA(readData2EX),
		.DatoB(resultWB),
		.DatoC(aluOutMEM),
		.Sel(forwardBEX),
		.Salida(srcBEX)
	);
	
	Mux_2in_1out mux12(
		.DatoA(readData1),
		.DatoB(aluOutMEM),
		.Sel(forwardAID),
		.Salida(branchSrcA)
	);
	
	Mux_2in_1out mux13(
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
	//mux  -> assign writeRegister = (regDstEX)? rdEX : rtEX;
	//mux2 -> assign aluOperand1 = (loadImmEX)? 'd16 : ((aluShiftImmEX)? saEX: srcAEX);
	//mux3 -> assign aluOperand2 = (aluSrcEX)? sigExtEX: srcBEX;
	//mux4 -> assign pcSrc = (jump) ? 1 : (branch & branchTaken);
	//mux5 -> assign branchTaken = (branchType)? (branchSrcA!=branchSrcB) : (branchSrcA==branchSrcB); //branchType(flag from control) 1: check if branch NE 0: check if branch EQ
	//mux6 -> assign resultWB = (memToRegWB)? memoryOutWB : aluOutWB;
	//mux7 -> assign PC = (jump) ? pcBranchAddr : (pcSrc) ? pcBranchAddr : pcNext;
	
	// si se activa el debug de la RAM se activan todos los bytes
	//mux8 -> assign WEA = (debugRamSrc)? 4'b0: memWriteMEM;
	// si se activa el debug de la RAM se utiliza la dirección alternativa
	//mux9 -> assign ramDataAddr = (debugRamSrc)? debugMemAddr: aluOutMEM[7:0];
	
	//mux10 -> assign srcAEX= (forwardAEX==0)? readData1EX : ((forwardAEX==1)? resultWB : aluOutMEM);
	//mux11 -> assign srcBEX= (forwardBEX==0)? readData2EX : ((forwardBEX==1)? resultWB : aluOutMEM);
	assign writeDataEX = srcBEX;
	//mux12 -> assign branchSrcA= (forwardAID)? aluOutMEM: readData1;
	//mux13 -> assign branchSrcB= (forwardBID)? aluOutMEM: readData2;
	
endmodule

import os

def concat(fro, size, decimal):
	salida = ""
	for i in range(fro, fro+size):
		try:
			salida += binarios[i]
		except Exception, e:
			pass
		
	
	if decimal:
		try:
			return int(salida, 2)
		except Exception, e:
			return salida
	else:
		return salida

archivo = open("binarios.txt", "r")
contenido = archivo.read()

binarios = []
binarios = contenido.split(' ')

decimal = True

#---------------------------------------------------------
print "FE_pc: " + str(concat(0,1,decimal))
print "IF_ID_instr: " + str(concat(1,4,decimal))
print "IF_ID_pcNext: " + str(concat(5,1,decimal))
print "ID_EX_aluControl: " + str(concat(6,1,decimal))
print "ID_EX_signImm: " + str(concat(7,4,decimal))
print "ID_EX_readData1: " + str(concat(11,4,decimal))
print "ID_EX_readData2: " + str(concat(15,4,decimal))
print "ID_EX_aluSrc: " + str(concat(19,1,decimal))
print "ID_EX_aluShiftImm: " + str(concat(20,1,decimal))
print "ID_EX_memWrite: " + str(concat(21,1,decimal))
print "ID_EX_memToReg: " + str(concat(22,1,decimal))
print "ID_EX_memReadWidth: " + str(concat(23,1,decimal))
print "ID_EX_rs: " + str(concat(24,1,decimal))
print "ID_EX_rt: " + str(concat(25,1,decimal))
print "ID_EX_rd: " + str(concat(26,1,decimal))
print "ID_EX_sa: " + str(concat(27,1,decimal))
print "ID_EX_regDst: " + str(concat(28,1,decimal))
print "ID_EX_loadImm: " + str(concat(29,1,decimal))
print "ID_EX_regWrite: " + str(concat(30,1,decimal))
print "EX_MEM_writeReg: " + str(concat(31,1,decimal))
print "EX_MEM_writeData: " + str(concat(32,4,decimal))
print "EX_MEM_aluOut: " + str(concat(36,4,decimal))
print "EX_MEM_regWrite: " + str(concat(40,1,decimal))
print "41 AL PEDO: " + str(concat(41,1,decimal))
print "EX_MEM_memWrite: " + str(concat(42,1,decimal))
print "EX_MEM_memReadWidth: " + str(concat(43,1,decimal))
print "MEM_WB_writeReg: " + str(concat(44,1,decimal))
print "MEM_WB_aluOut: " + str(concat(45,4,decimal))
print "MEM_WB_readData: " + str(concat(49,4,decimal))
print "MEM_WB_regWrite: " + str(concat(53,1,decimal))
print "MEM_WB_memToReg: " + str(concat(54,1,decimal))
print "reg0: " + str(concat(55,4,decimal))
print "reg1: " + str(concat(59,4,decimal))
print "reg2: " + str(concat(63,4,decimal))
print "reg3: " + str(concat(67,4,decimal))
print "reg4: " + str(concat(71,4,decimal))
print "reg5: " + str(concat(75,4,decimal))
print "reg6: " + str(concat(79,4,decimal))
print "reg7: " + str(concat(83,4,decimal))
print "reg8: " + str(concat(87,4,decimal))
print "reg9: " + str(concat(91,4,decimal))
print "reg10: " + str(concat(95,4,decimal))
print "reg11: " + str(concat(99,4,decimal))
print "reg12: " + str(concat(103,4,decimal))
print "reg13: " + str(concat(107,4,decimal))
print "reg14: " + str(concat(111,4,decimal))
print "reg15: " + str(concat(115,4,decimal))
print "reg16: " + str(concat(119,4,decimal))
print "reg17: " + str(concat(123,4,decimal))
print "reg18: " + str(concat(127,4,decimal))
print "reg19: " + str(concat(131,4,decimal))
print "reg20: " + str(concat(135,4,decimal))
print "reg21: " + str(concat(139,4,decimal))
print "reg22: " + str(concat(143,4,decimal))
print "reg23: " + str(concat(147,4,decimal))
print "reg24: " + str(concat(151,4,decimal))
print "reg25: " + str(concat(155,4,decimal))
print "reg26: " + str(concat(159,4,decimal))
print "reg27: " + str(concat(163,4,decimal))
print "reg28: " + str(concat(167,4,decimal))
print "reg29: " + str(concat(171,4,decimal))
print "reg30: " + str(concat(175,4,decimal))
print "reg31: " + str(concat(179,4,decimal))
print "memoryRamData[0]: " + str(concat(183,4,decimal))
print "memoryRamData[1]: " + str(concat(187,4,decimal))
print "memoryRamData[2]: " + str(concat(191,4,decimal))
print "memoryRamData[3]: " + str(concat(195,4,decimal))
print "memoryRamData[4]: " + str(concat(199,4,decimal))
print "memoryRamData[5]: " + str(concat(203,4,decimal))
print "memoryRamData[6]: " + str(concat(207,4,decimal))
print "memoryRamData[7]: " + str(concat(211,4,decimal))
print "memoryRamData[8]: " + str(concat(215,4,decimal))
print "memoryRamData[9]: " + str(concat(219,4,decimal))
print "memoryRamData[10]: " + str(concat(223,4,decimal))
print "memoryRamData[11]: " + str(concat(227,4,decimal))
print "memoryRamData[12]: " + str(concat(231,4,decimal))
print "memoryRamData[13]: " + str(concat(235,4,decimal))
print "memoryRamData[14]: " + str(concat(239,4,decimal))
print "memoryRamData[15]: " + str(concat(243,4,decimal))
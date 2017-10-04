import os

def concat(fro, size, decimal):
	salida = ""
	for i in range(fro, fro+size):
		salida += binarios[i]
	
	if decimal:
		return int(salida, 2)
	else:
		return salida

archivo = open("binarios.txt", "r")
contenido = archivo.read()

binarios = []
binarios = contenido.split(' ')

decimal = True

print(len(binarios))

#---------------------------------------------------------
print("FE_pc: " + str(concat(0,1,decimal)))
print("IF_ID_instr: " + str(concat(1,4,decimal)))
print("IF_ID_pcNext: " + str(concat(5,1,decimal)))
print("ID_EX_aluControl: " + str(concat(6,1,decimal)))
print("ID_EX_signImm: " + str(concat(7,4,decimal)))
print("ID_EX_readData1: " + str(concat(11,4,decimal)))
print("ID_EX_readData2: " + str(concat(15,4,decimal)))
print("ID_EX_aluSrc: " + str(concat(19,1,decimal)))
print("ID_EX_aluShiftImm: " + str(concat(20,1,decimal)))
print("ID_EX_memWrite: " + str(concat(21,1,decimal)))
print("ID_EX_memToReg: " + str(concat(22,1,decimal)))
print("ID_EX_memReadWidth: " + str(concat(23,1,decimal)))
print("ID_EX_rs: " + str(concat(24,1,decimal)))
print("ID_EX_rt: " + str(concat(25,1,decimal)))
print("ID_EX_rd: " + str(concat(26,1,decimal)))
print("ID_EX_sa: " + str(concat(27,1,decimal)))
print("ID_EX_regDst: " + str(concat(28,1,decimal)))
print("ID_EX_loadImm: " + str(concat(29,1,decimal)))
print("ID_EX_regWrite: " + str(concat(30,1,decimal)))
print("EX_MEM_writeReg: " + str(concat(31,1,decimal)))
print("EX_MEM_writeData: " + str(concat(32,4,decimal)))
print("EX_MEM_aluOut: " + str(concat(36,4,decimal)))
print("EX_MEM_regWrite: " + str(concat(40,1,decimal)))
print("41 AL PEDO: " + str(concat(41,1,decimal)))
print("EX_MEM_memWrite: " + str(concat(41,1,decimal)))
print("EX_MEM_memReadWidth: " + str(concat(42,1,decimal)))
print("MEM_WB_writeReg: " + str(concat(43,1,decimal)))
print("MEM_WB_aluOut: " + str(concat(44,4,decimal)))
print("MEM_WB_readData: " + str(concat(48,4,decimal)))
print("MEM_WB_regWrite: " + str(concat(52,1,decimal)))
print("MEM_WB_memToReg: " + str(concat(53,1,decimal)))
print("reg0: " + str(concat(54,4,decimal)))
print("reg1: " + str(concat(58,4,decimal)))
print("reg2: " + str(concat(62,4,decimal)))
print("reg3: " + str(concat(66,4,decimal)))
print("reg4: " + str(concat(70,4,decimal)))
print("reg5: " + str(concat(74,4,decimal)))
print("reg6: " + str(concat(78,4,decimal)))
print("reg7: " + str(concat(82,4,decimal)))
print("reg8: " + str(concat(86,4,decimal)))
print("reg9: " + str(concat(90,4,decimal)))
print("reg10: " + str(concat(94,4,decimal)))
print("reg11: " + str(concat(98,4,decimal)))
print("reg12: " + str(concat(102,4,decimal)))
print("reg13: " + str(concat(106,4,decimal)))
print("reg14: " + str(concat(110,4,decimal)))
print("reg15: " + str(concat(114,4,decimal)))
print("reg16: " + str(concat(118,4,decimal)))
print("reg17: " + str(concat(122,4,decimal)))
print("reg18: " + str(concat(126,4,decimal)))
print("reg19: " + str(concat(130,4,decimal)))
print("reg20: " + str(concat(134,4,decimal)))
print("reg21: " + str(concat(138,4,decimal)))
print("reg22: " + str(concat(142,4,decimal)))
print("reg23: " + str(concat(146,4,decimal)))
print("reg24: " + str(concat(150,4,decimal)))
print("reg25: " + str(concat(154,4,decimal)))
print("reg26: " + str(concat(158,4,decimal)))
print("reg27: " + str(concat(162,4,decimal)))
print("reg28: " + str(concat(166,4,decimal)))
print("reg29: " + str(concat(170,4,decimal)))
print("reg30: " + str(concat(174,4,decimal)))
print("reg31: " + str(concat(178,4,decimal)))
print("memoryRamData[0]: " + str(concat(182,4,decimal)))
print("memoryRamData[1]: " + str(concat(186,4,decimal)))
print("memoryRamData[2]: " + str(concat(190,4,decimal)))
print("memoryRamData[3]: " + str(concat(194,4,decimal)))
print("memoryRamData[4]: " + str(concat(198,4,decimal)))
print("memoryRamData[5]: " + str(concat(202,4,decimal)))
print("memoryRamData[6]: " + str(concat(206,4,decimal)))
print("memoryRamData[7]: " + str(concat(210,4,decimal)))
print("memoryRamData[8]: " + str(concat(214,4,decimal)))
print("memoryRamData[9]: " + str(concat(218,4,decimal)))
print("memoryRamData[10]: " + str(concat(222,4,decimal)))
print("memoryRamData[11]: " + str(concat(226,4,decimal)))
print("memoryRamData[12]: " + str(concat(230,4,decimal)))
print("memoryRamData[13]: " + str(concat(234,4,decimal)))
print("memoryRamData[14]: " + str(concat(238,4,decimal)))
print("memoryRamData[15]: " + str(concat(242,4,decimal)))

#---------------------------------------------------------

#archivo2 = open("salida.txt", "w")

#for ele in binarios:
#	archivo2.write(ele)

os.system("pause")
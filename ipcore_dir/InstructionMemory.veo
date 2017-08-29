/*******************************************************************************
*     (c) Copyright 1995 - 2010 Xilinx, Inc. All rights reserved.              *
*                                                                              *
*     This file contains confidential and proprietary information              *
*     of Xilinx, Inc. and is protected under U.S. and                          *
*     international copyright and other intellectual property                  *
*     laws.                                                                    *
*                                                                              *
*     DISCLAIMER                                                               *
*     This disclaimer is not a license and does not grant any                  *
*     rights to the materials distributed herewith. Except as                  *
*     otherwise provided in a valid license issued to you by                   *
*     Xilinx, and to the maximum extent permitted by applicable                *
*     law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND                  *
*     WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES              *
*     AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING                *
*     BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-                   *
*     INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and                 *
*     (2) Xilinx shall not be liable (whether in contract or tort,             *
*     including negligence, or under any other theory of                       *
*     liability) for any loss or damage of any kind or nature                  *
*     related to, arising under or in connection with these                    *
*     materials, including for any direct, or any indirect,                    *
*     special, incidental, or consequential loss or damage                     *
*     (including loss of data, profits, goodwill, or any type of               *
*     loss or damage suffered as a result of any action brought                *
*     by a third party) even if such damage or loss was                        *
*     reasonably foreseeable or Xilinx had been advised of the                 *
*     possibility of the same.                                                 *
*                                                                              *
*     CRITICAL APPLICATIONS                                                    *
*     Xilinx products are not designed or intended to be fail-                 *
*     safe, or for use in any application requiring fail-safe                  *
*     performance, such as life-support or safety devices or                   *
*     systems, Class III medical devices, nuclear facilities,                  *
*     applications related to the deployment of airbags, or any                *
*     other applications that could lead to death, personal                    *
*     injury, or severe property or environmental damage                       *
*     (individually and collectively, "Critical                                *
*     Applications"). Customer assumes the sole risk and                       *
*     liability of any use of Xilinx products in Critical                      *
*     Applications, subject only to applicable laws and                        *
*     regulations governing limitations on product liability.                  *
*                                                                              *
*     THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS                 *
*     PART OF THIS FILE AT ALL TIMES.                                          *
*******************************************************************************/

//  Generated from component ID: xilinx.com:ip:pci32_spng:4.14


// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
InstructionMemory YourInstanceName (
	.ado(ado), // output [31 : 0] ado
	.adi(adi), // input [31 : 0] adi
	.add(add), // input [31 : 0] add
	.adt(adt), // output [31 : 0] adt
	.cbo(cbo), // output [3 : 0] cbo
	.cbi(cbi), // input [3 : 0] cbi
	.cbd(cbd), // input [3 : 0] cbd
	.cbt(cbt), // output [3 : 0] cbt
	.paro(paro), // output paro
	.pari(pari), // input pari
	.pard(pard), // input pard
	.part(part), // output part
	.frameo(frameo), // output frameo
	.framei(framei), // input framei
	.framed(framed), // input framed
	.framet(framet), // output framet
	.trdyo(trdyo), // output trdyo
	.trdyi(trdyi), // input trdyi
	.trdyd(trdyd), // input trdyd
	.trdyt(trdyt), // output trdyt
	.irdyo(irdyo), // output irdyo
	.irdyi(irdyi), // input irdyi
	.irdyd(irdyd), // input irdyd
	.irdyt(irdyt), // output irdyt
	.stopo(stopo), // output stopo
	.stopi(stopi), // input stopi
	.stopd(stopd), // input stopd
	.stopt(stopt), // output stopt
	.devselo(devselo), // output devselo
	.devseli(devseli), // input devseli
	.devseld(devseld), // input devseld
	.devselt(devselt), // output devselt
	.perro(perro), // output perro
	.perri(perri), // input perri
	.perrd(perrd), // input perrd
	.perrt(perrt), // output perrt
	.serro(serro), // output serro
	.serri(serri), // input serri
	.serrd(serrd), // input serrd
	.serrt(serrt), // output serrt
	.into(into), // output into
	.intt(intt), // output intt
	.pmeo(pmeo), // output pmeo
	.pmet(pmet), // output pmet
	.reqo(reqo), // output reqo
	.reqt(reqt), // output reqt
	.gnti(gnti), // input gnti
	.gntd(gntd), // input gntd
	.idseli(idseli), // input idseli
	.idseld(idseld), // input idseld
	.frameq_n(frameq_n), // output frameq_n
	.trdyq_n(trdyq_n), // output trdyq_n
	.irdyq_n(irdyq_n), // output irdyq_n
	.stopq_n(stopq_n), // output stopq_n
	.devselq_n(devselq_n), // output devselq_n
	.addr(addr), // output [31 : 0] addr
	.adio_in(adio_in), // input [31 : 0] adio_in
	.adio_out(adio_out), // output [31 : 0] adio_out
	.cfg_vld(cfg_vld), // output cfg_vld
	.cfg_hit(cfg_hit), // output cfg_hit
	.c_term(c_term), // input c_term
	.c_ready(c_ready), // input c_ready
	.addr_vld(addr_vld), // output addr_vld
	.base_hit(base_hit), // output [7 : 0] base_hit
	.s_term(s_term), // input s_term
	.s_ready(s_ready), // input s_ready
	.s_abort(s_abort), // input s_abort
	.s_wrdn(s_wrdn), // output s_wrdn
	.s_src_en(s_src_en), // output s_src_en
	.s_data_vld(s_data_vld), // output s_data_vld
	.s_cbe(s_cbe), // output [3 : 0] s_cbe
	.pci_cmd(pci_cmd), // output [15 : 0] pci_cmd
	.request(request), // input request
	.requesthold(requesthold), // input requesthold
	.complete(complete), // input complete
	.m_wrdn(m_wrdn), // input m_wrdn
	.m_ready(m_ready), // input m_ready
	.m_src_en(m_src_en), // output m_src_en
	.m_data_vld(m_data_vld), // output m_data_vld
	.m_cbe(m_cbe), // input [3 : 0] m_cbe
	.time_out(time_out), // output time_out
	.cfg_self(cfg_self), // input cfg_self
	.m_data(m_data), // output m_data
	.dr_bus(dr_bus), // output dr_bus
	.i_idle(i_idle), // output i_idle
	.m_addr_n(m_addr_n), // output m_addr_n
	.idle(idle), // output idle
	.b_busy(b_busy), // output b_busy
	.s_data(s_data), // output s_data
	.backoff(backoff), // output backoff
	.int_n(int_n), // input int_n
	.pme_n(pme_n), // input pme_n
	.perrq_n(perrq_n), // output perrq_n
	.serrq_n(serrq_n), // output serrq_n
	.keepout(keepout), // input keepout
	.csr(csr), // output [39 : 0] csr
	.pciw_en(pciw_en), // output pciw_en
	.bw_detect_dis(bw_detect_dis), // input bw_detect_dis
	.bw_manual_32b(bw_manual_32b), // input bw_manual_32b
	.pcix_en(pcix_en), // output pcix_en
	.bm_detect_dis(bm_detect_dis), // input bm_detect_dis
	.bm_manual_pci(bm_manual_pci), // input bm_manual_pci
	.rtr(rtr), // output rtr
	.rst(rst), // input rst
	.cfg(cfg), // output [511 : 0] cfg
	.clk(clk)); // input clk

// INST_TAG_END ------ End INSTANTIATION Template ---------

// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Sat May 24 02:10:17 2025
// Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode funcsim
//               /home/kien_k66/Documents/DATN/code/Router_datn/arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ip/input_0_arbiter_encap_packet_top_0_0/input_0_arbiter_encap_packet_top_0_0_sim_netlist.v
// Design      : input_0_arbiter_encap_packet_top_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu250-figd2104-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "input_0_arbiter_encap_packet_top_0_0,encap_packet_top,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "encap_packet_top,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module input_0_arbiter_encap_packet_top_0_0
   (clk,
    rst_n,
    data_arbiter_send,
    router_dst_addr_send,
    header_pkt_send,
    start_encap_pkt,
    data_send,
    data_encap_valid,
    encap_done);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN input_0_arbiter_clk, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  input [1023:0]data_arbiter_send;
  input [9:0]router_dst_addr_send;
  input [8:0]header_pkt_send;
  input start_encap_pkt;
  output [63:0]data_send;
  output data_encap_valid;
  output encap_done;

  wire \<const0> ;

  assign data_encap_valid = \<const0> ;
  assign data_send[63] = \<const0> ;
  assign data_send[62] = \<const0> ;
  assign data_send[61] = \<const0> ;
  assign data_send[60] = \<const0> ;
  assign data_send[59] = \<const0> ;
  assign data_send[58] = \<const0> ;
  assign data_send[57] = \<const0> ;
  assign data_send[56] = \<const0> ;
  assign data_send[55] = \<const0> ;
  assign data_send[54] = \<const0> ;
  assign data_send[53] = \<const0> ;
  assign data_send[52] = \<const0> ;
  assign data_send[51] = \<const0> ;
  assign data_send[50] = \<const0> ;
  assign data_send[49] = \<const0> ;
  assign data_send[48] = \<const0> ;
  assign data_send[47] = \<const0> ;
  assign data_send[46] = \<const0> ;
  assign data_send[45] = \<const0> ;
  assign data_send[44] = \<const0> ;
  assign data_send[43] = \<const0> ;
  assign data_send[42] = \<const0> ;
  assign data_send[41] = \<const0> ;
  assign data_send[40] = \<const0> ;
  assign data_send[39] = \<const0> ;
  assign data_send[38] = \<const0> ;
  assign data_send[37] = \<const0> ;
  assign data_send[36] = \<const0> ;
  assign data_send[35] = \<const0> ;
  assign data_send[34] = \<const0> ;
  assign data_send[33] = \<const0> ;
  assign data_send[32] = \<const0> ;
  assign data_send[31] = \<const0> ;
  assign data_send[30] = \<const0> ;
  assign data_send[29] = \<const0> ;
  assign data_send[28] = \<const0> ;
  assign data_send[27] = \<const0> ;
  assign data_send[26] = \<const0> ;
  assign data_send[25] = \<const0> ;
  assign data_send[24] = \<const0> ;
  assign data_send[23] = \<const0> ;
  assign data_send[22] = \<const0> ;
  assign data_send[21] = \<const0> ;
  assign data_send[20] = \<const0> ;
  assign data_send[19] = \<const0> ;
  assign data_send[18] = \<const0> ;
  assign data_send[17] = \<const0> ;
  assign data_send[16] = \<const0> ;
  assign data_send[15] = \<const0> ;
  assign data_send[14] = \<const0> ;
  assign data_send[13] = \<const0> ;
  assign data_send[12] = \<const0> ;
  assign data_send[11] = \<const0> ;
  assign data_send[10] = \<const0> ;
  assign data_send[9] = \<const0> ;
  assign data_send[8] = \<const0> ;
  assign data_send[7] = \<const0> ;
  assign data_send[6] = \<const0> ;
  assign data_send[5] = \<const0> ;
  assign data_send[4] = \<const0> ;
  assign data_send[3] = \<const0> ;
  assign data_send[2] = \<const0> ;
  assign data_send[1] = \<const0> ;
  assign data_send[0] = \<const0> ;
  assign encap_done = \<const0> ;
  GND GND
       (.G(\<const0> ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Sat May 24 02:10:16 2025
// Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode funcsim
//               /home/kien_k66/Documents/DATN/code/Router_datn/arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ip/input_0_arbiter_router_controller_0_0/input_0_arbiter_router_controller_0_0_sim_netlist.v
// Design      : input_0_arbiter_router_controller_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu250-figd2104-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "input_0_arbiter_router_controller_0_0,router_controller,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "router_controller,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module input_0_arbiter_router_controller_0_0
   (clk,
    rst_n,
    router_start_req,
    router_scr_addr,
    router_dst_addr,
    router_done,
    arbiter_read_gnt,
    arbiter_write_gnt,
    arbiter_read_req,
    arbiter_write_req,
    arbiter_src_addr,
    arbiter_dst_addr,
    data_port1_before,
    data_port1_after,
    control_crossbar,
    empty_input_port_0,
    encap_done,
    start_encap_pkt,
    router_dst_addr_send,
    header_pkt_send,
    rd_input_port_0,
    empty_input_port_1,
    rd_input_port_1,
    empty_output_port_0,
    decap_done,
    empty_arbiter_fifo,
    dst_addr_arbiter_recv,
    start_decap_pkt,
    rd_output_port_0,
    we_output_port_0,
    read_arbiter_fifo,
    we_output_port_1);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN input_0_arbiter_clk, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  input router_start_req;
  input [9:0]router_scr_addr;
  input [9:0]router_dst_addr;
  output router_done;
  input arbiter_read_gnt;
  input arbiter_write_gnt;
  output arbiter_read_req;
  output arbiter_write_req;
  output [9:0]arbiter_src_addr;
  output [9:0]arbiter_dst_addr;
  input [63:0]data_port1_before;
  output [63:0]data_port1_after;
  output [1:0]control_crossbar;
  input empty_input_port_0;
  input encap_done;
  output start_encap_pkt;
  output [9:0]router_dst_addr_send;
  output [8:0]header_pkt_send;
  output rd_input_port_0;
  input empty_input_port_1;
  output rd_input_port_1;
  input empty_output_port_0;
  input decap_done;
  input empty_arbiter_fifo;
  input [9:0]dst_addr_arbiter_recv;
  output start_decap_pkt;
  output rd_output_port_0;
  output we_output_port_0;
  output read_arbiter_fifo;
  output we_output_port_1;

  wire \<const0> ;
  wire \<const1> ;

  assign arbiter_dst_addr[9] = \<const0> ;
  assign arbiter_dst_addr[8] = \<const0> ;
  assign arbiter_dst_addr[7] = \<const0> ;
  assign arbiter_dst_addr[6] = \<const0> ;
  assign arbiter_dst_addr[5] = \<const0> ;
  assign arbiter_dst_addr[4] = \<const0> ;
  assign arbiter_dst_addr[3] = \<const0> ;
  assign arbiter_dst_addr[2] = \<const0> ;
  assign arbiter_dst_addr[1] = \<const0> ;
  assign arbiter_dst_addr[0] = \<const0> ;
  assign arbiter_read_req = \<const0> ;
  assign arbiter_src_addr[9] = \<const0> ;
  assign arbiter_src_addr[8] = \<const0> ;
  assign arbiter_src_addr[7] = \<const0> ;
  assign arbiter_src_addr[6] = \<const0> ;
  assign arbiter_src_addr[5] = \<const0> ;
  assign arbiter_src_addr[4] = \<const0> ;
  assign arbiter_src_addr[3] = \<const0> ;
  assign arbiter_src_addr[2] = \<const0> ;
  assign arbiter_src_addr[1] = \<const0> ;
  assign arbiter_src_addr[0] = \<const0> ;
  assign arbiter_write_req = \<const0> ;
  assign control_crossbar[1] = \<const0> ;
  assign control_crossbar[0] = \<const0> ;
  assign data_port1_after[63] = \<const0> ;
  assign data_port1_after[62] = \<const0> ;
  assign data_port1_after[61] = \<const0> ;
  assign data_port1_after[60] = \<const0> ;
  assign data_port1_after[59] = \<const0> ;
  assign data_port1_after[58] = \<const0> ;
  assign data_port1_after[57] = \<const0> ;
  assign data_port1_after[56] = \<const0> ;
  assign data_port1_after[55] = \<const0> ;
  assign data_port1_after[54] = \<const0> ;
  assign data_port1_after[53] = \<const0> ;
  assign data_port1_after[52] = \<const0> ;
  assign data_port1_after[51] = \<const0> ;
  assign data_port1_after[50] = \<const0> ;
  assign data_port1_after[49] = \<const0> ;
  assign data_port1_after[48] = \<const0> ;
  assign data_port1_after[47] = \<const0> ;
  assign data_port1_after[46] = \<const0> ;
  assign data_port1_after[45] = \<const0> ;
  assign data_port1_after[44] = \<const0> ;
  assign data_port1_after[43] = \<const0> ;
  assign data_port1_after[42] = \<const0> ;
  assign data_port1_after[41] = \<const0> ;
  assign data_port1_after[40] = \<const0> ;
  assign data_port1_after[39] = \<const0> ;
  assign data_port1_after[38] = \<const0> ;
  assign data_port1_after[37] = \<const0> ;
  assign data_port1_after[36] = \<const0> ;
  assign data_port1_after[35] = \<const0> ;
  assign data_port1_after[34] = \<const0> ;
  assign data_port1_after[33] = \<const0> ;
  assign data_port1_after[32] = \<const0> ;
  assign data_port1_after[31] = \<const0> ;
  assign data_port1_after[30] = \<const0> ;
  assign data_port1_after[29] = \<const0> ;
  assign data_port1_after[28] = \<const0> ;
  assign data_port1_after[27] = \<const0> ;
  assign data_port1_after[26] = \<const0> ;
  assign data_port1_after[25] = \<const0> ;
  assign data_port1_after[24] = \<const0> ;
  assign data_port1_after[23] = \<const0> ;
  assign data_port1_after[22] = \<const0> ;
  assign data_port1_after[21] = \<const0> ;
  assign data_port1_after[20] = \<const0> ;
  assign data_port1_after[19] = \<const0> ;
  assign data_port1_after[18] = \<const0> ;
  assign data_port1_after[17] = \<const0> ;
  assign data_port1_after[16] = \<const0> ;
  assign data_port1_after[15] = \<const0> ;
  assign data_port1_after[14] = \<const0> ;
  assign data_port1_after[13] = \<const0> ;
  assign data_port1_after[12] = \<const0> ;
  assign data_port1_after[11] = \<const0> ;
  assign data_port1_after[10] = \<const0> ;
  assign data_port1_after[9] = \<const0> ;
  assign data_port1_after[8] = \<const0> ;
  assign data_port1_after[7] = \<const0> ;
  assign data_port1_after[6] = \<const0> ;
  assign data_port1_after[5] = \<const0> ;
  assign data_port1_after[4] = \<const0> ;
  assign data_port1_after[3] = \<const0> ;
  assign data_port1_after[2] = \<const0> ;
  assign data_port1_after[1] = \<const0> ;
  assign data_port1_after[0] = \<const0> ;
  assign header_pkt_send[8] = \<const0> ;
  assign header_pkt_send[7] = \<const0> ;
  assign header_pkt_send[6] = \<const0> ;
  assign header_pkt_send[5] = \<const0> ;
  assign header_pkt_send[4] = \<const0> ;
  assign header_pkt_send[3] = \<const0> ;
  assign header_pkt_send[2] = \<const0> ;
  assign header_pkt_send[1] = \<const0> ;
  assign header_pkt_send[0] = \<const0> ;
  assign rd_input_port_0 = \<const0> ;
  assign rd_input_port_1 = \<const0> ;
  assign rd_output_port_0 = \<const0> ;
  assign read_arbiter_fifo = \<const0> ;
  assign router_done = \<const1> ;
  assign router_dst_addr_send[9] = \<const0> ;
  assign router_dst_addr_send[8] = \<const0> ;
  assign router_dst_addr_send[7] = \<const0> ;
  assign router_dst_addr_send[6] = \<const0> ;
  assign router_dst_addr_send[5] = \<const0> ;
  assign router_dst_addr_send[4] = \<const0> ;
  assign router_dst_addr_send[3] = \<const0> ;
  assign router_dst_addr_send[2] = \<const0> ;
  assign router_dst_addr_send[1] = \<const0> ;
  assign router_dst_addr_send[0] = \<const0> ;
  assign start_decap_pkt = \<const0> ;
  assign start_encap_pkt = \<const0> ;
  assign we_output_port_0 = \<const0> ;
  assign we_output_port_1 = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
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

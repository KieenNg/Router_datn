//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Sat May 24 02:30:47 2025
//Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
//Command     : generate_target input_0_arbiter.bd
//Design      : input_0_arbiter
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "input_0_arbiter,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=input_0_arbiter,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=13,numReposBlks=13,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=6,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "input_0_arbiter.hwdef" *) 
module input_0_arbiter
   (clk,
    router_done,
    router_dst_addr,
    router_scr_addr,
    router_start_req,
    rst_n);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst_n, CLK_DOMAIN input_0_arbiter_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;
  output router_done;
  input [9:0]router_dst_addr;
  input [9:0]router_scr_addr;
  input router_start_req;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input rst_n;

  wire [1023:0]arbiter_bram_0_data_arbiter_send;
  wire arbiter_bram_0_read_gnt;
  wire arbiter_bram_0_write_gnt;
  wire axis_data_fifo_0_s_axis_tready;
  wire clk_0_1;
  wire [63:0]crossbar_0_data_out_port_0;
  wire [63:0]crossbar_0_data_out_port_1;
  wire [63:0]crossbar_0_data_port_1_before;
  wire [1033:0]decap_packet_0_data_dfx_recv;
  wire decap_packet_0_decap_done;
  wire encap_packet_top_0_data_encap_valid;
  wire [63:0]encap_packet_top_0_data_send;
  wire encap_packet_top_0_encap_done;
  wire fifo_generator_0_empty;
  wire [63:0]fifo_in_port_0_dout;
  wire [63:0]fifo_in_port_1_dout;
  wire fifo_in_port_1_empty;
  wire [63:0]fifo_out_port_0_dout;
  wire fifo_out_port_0_empty;
  wire [63:0]fifo_out_port_1_dout;
  wire fifo_out_port_1_empty;
  wire [9:0]router_controller_0_arbiter_dst_addr;
  wire router_controller_0_arbiter_read_req;
  wire [9:0]router_controller_0_arbiter_src_addr;
  wire router_controller_0_arbiter_write_req;
  wire [1:0]router_controller_0_control_crossbar;
  wire [63:0]router_controller_0_data_port1_after;
  wire [8:0]router_controller_0_header_pkt_send;
  wire router_controller_0_rd_input_port_0;
  wire router_controller_0_rd_input_port_1;
  wire router_controller_0_rd_output_port_0;
  wire router_controller_0_router_done;
  wire [9:0]router_controller_0_router_dst_addr_send;
  wire router_controller_0_start_decap_pkt;
  wire router_controller_0_start_encap_pkt;
  wire router_controller_0_we_output_port_0;
  wire router_controller_0_we_output_port_1;
  wire [9:0]router_dst_addr_0_1;
  wire [9:0]router_scr_addr_0_1;
  wire router_start_req_0_1;
  wire rst_n_0_1;
  wire [0:0]util_vector_logic_0_Res;
  wire [0:0]util_vector_logic_1_Res;

  assign clk_0_1 = clk;
  assign router_done = router_controller_0_router_done;
  assign router_dst_addr_0_1 = router_dst_addr[9:0];
  assign router_scr_addr_0_1 = router_scr_addr[9:0];
  assign router_start_req_0_1 = router_start_req;
  assign rst_n_0_1 = rst_n;
  input_0_arbiter_arbiter_bram_0_0 arbiter_bram_0
       (.clk(clk_0_1),
        .data_arbiter_recv({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .data_arbiter_send(arbiter_bram_0_data_arbiter_send),
        .dst_addr(router_controller_0_arbiter_dst_addr),
        .read_gnt(arbiter_bram_0_read_gnt),
        .read_req(router_controller_0_arbiter_read_req),
        .rst_n(rst_n_0_1),
        .src_addr(router_controller_0_arbiter_src_addr),
        .write_gnt(arbiter_bram_0_write_gnt),
        .write_req(router_controller_0_arbiter_write_req));
  input_0_arbiter_axis_data_fifo_0_0 aurora_tx
       (.m_axis_tready(1'b1),
        .s_axis_aclk(clk_0_1),
        .s_axis_aresetn(rst_n_0_1),
        .s_axis_tdata(fifo_out_port_1_dout),
        .s_axis_tready(axis_data_fifo_0_s_axis_tready),
        .s_axis_tvalid(util_vector_logic_1_Res));
  input_0_arbiter_crossbar_0_0 crossbar_0
       (.control_crossbar(router_controller_0_control_crossbar),
        .data_in_port_0(fifo_in_port_0_dout),
        .data_in_port_1(fifo_in_port_1_dout),
        .data_out_port_0(crossbar_0_data_out_port_0),
        .data_out_port_1(crossbar_0_data_out_port_1),
        .data_port_1_after(router_controller_0_data_port1_after),
        .data_port_1_before(crossbar_0_data_port_1_before));
  input_0_arbiter_decap_packet_0_0 decap_packet_0
       (.clk(clk_0_1),
        .data_dfx_recv(decap_packet_0_data_dfx_recv),
        .data_recv(fifo_out_port_0_dout),
        .decap_done(decap_packet_0_decap_done),
        .rst_n(rst_n_0_1),
        .start_decap_pkt(router_controller_0_start_decap_pkt));
  input_0_arbiter_encap_packet_top_0_0 encap_packet_top_0
       (.clk(clk_0_1),
        .data_arbiter_send(arbiter_bram_0_data_arbiter_send),
        .data_encap_valid(encap_packet_top_0_data_encap_valid),
        .data_send(encap_packet_top_0_data_send),
        .encap_done(encap_packet_top_0_encap_done),
        .header_pkt_send(router_controller_0_header_pkt_send),
        .router_dst_addr_send(router_controller_0_router_dst_addr_send),
        .rst_n(rst_n_0_1),
        .start_encap_pkt(router_controller_0_start_encap_pkt));
  input_0_arbiter_fifo_generator_0_0 fifo_in_port_0
       (.clk(clk_0_1),
        .din(encap_packet_top_0_data_send),
        .dout(fifo_in_port_0_dout),
        .empty(fifo_generator_0_empty),
        .rd_en(router_controller_0_rd_input_port_0),
        .srst(util_vector_logic_0_Res),
        .wr_en(encap_packet_top_0_data_encap_valid));
  input_0_arbiter_fifo_in_port_0_1 fifo_in_port_1
       (.clk(clk_0_1),
        .din(encap_packet_top_0_data_send),
        .dout(fifo_in_port_1_dout),
        .empty(fifo_in_port_1_empty),
        .rd_en(router_controller_0_rd_input_port_1),
        .srst(util_vector_logic_0_Res),
        .wr_en(encap_packet_top_0_data_encap_valid));
  input_0_arbiter_fifo_out_port_1_0 fifo_out_port_0
       (.clk(clk_0_1),
        .din(crossbar_0_data_out_port_0),
        .dout(fifo_out_port_0_dout),
        .empty(fifo_out_port_0_empty),
        .rd_en(router_controller_0_rd_output_port_0),
        .srst(util_vector_logic_0_Res),
        .wr_en(router_controller_0_we_output_port_0));
  input_0_arbiter_fifo_in_port_0_0 fifo_out_port_1
       (.clk(clk_0_1),
        .din(crossbar_0_data_out_port_1),
        .dout(fifo_out_port_1_dout),
        .empty(fifo_out_port_1_empty),
        .rd_en(axis_data_fifo_0_s_axis_tready),
        .srst(util_vector_logic_0_Res),
        .wr_en(router_controller_0_we_output_port_1));
  input_0_arbiter_router_controller_0_0 router_controller_0
       (.arbiter_dst_addr(router_controller_0_arbiter_dst_addr),
        .arbiter_read_gnt(arbiter_bram_0_read_gnt),
        .arbiter_read_req(router_controller_0_arbiter_read_req),
        .arbiter_src_addr(router_controller_0_arbiter_src_addr),
        .arbiter_write_gnt(arbiter_bram_0_write_gnt),
        .arbiter_write_req(router_controller_0_arbiter_write_req),
        .clk(clk_0_1),
        .control_crossbar(router_controller_0_control_crossbar),
        .data_port1_after(router_controller_0_data_port1_after),
        .data_port1_before(crossbar_0_data_port_1_before),
        .decap_done(decap_packet_0_decap_done),
        .dst_addr_arbiter_recv({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .empty_arbiter_fifo(1'b0),
        .empty_input_port_0(fifo_generator_0_empty),
        .empty_input_port_1(fifo_in_port_1_empty),
        .empty_output_port_0(fifo_out_port_0_empty),
        .encap_done(encap_packet_top_0_encap_done),
        .header_pkt_send(router_controller_0_header_pkt_send),
        .rd_input_port_0(router_controller_0_rd_input_port_0),
        .rd_input_port_1(router_controller_0_rd_input_port_1),
        .rd_output_port_0(router_controller_0_rd_output_port_0),
        .router_done(router_controller_0_router_done),
        .router_dst_addr(router_dst_addr_0_1),
        .router_dst_addr_send(router_controller_0_router_dst_addr_send),
        .router_scr_addr(router_scr_addr_0_1),
        .router_start_req(router_start_req_0_1),
        .rst_n(rst_n_0_1),
        .start_decap_pkt(router_controller_0_start_decap_pkt),
        .start_encap_pkt(router_controller_0_start_encap_pkt),
        .we_output_port_0(router_controller_0_we_output_port_0),
        .we_output_port_1(router_controller_0_we_output_port_1));
  input_0_arbiter_separate_addr_data_0_0 separate_addr_data_0
       (.data_dfx_recv(decap_packet_0_data_dfx_recv));
  input_0_arbiter_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(rst_n_0_1),
        .Res(util_vector_logic_0_Res));
  input_0_arbiter_util_vector_logic_1_0 util_vector_logic_1
       (.Op1(fifo_out_port_1_empty),
        .Res(util_vector_logic_1_Res));
endmodule

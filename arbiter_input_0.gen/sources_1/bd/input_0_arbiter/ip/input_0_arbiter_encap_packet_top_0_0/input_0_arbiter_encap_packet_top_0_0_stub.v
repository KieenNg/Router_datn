// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Sat May 24 02:10:17 2025
// Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/kien_k66/Documents/DATN/code/Router_datn/arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ip/input_0_arbiter_encap_packet_top_0_0/input_0_arbiter_encap_packet_top_0_0_stub.v
// Design      : input_0_arbiter_encap_packet_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu250-figd2104-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "encap_packet_top,Vivado 2024.1" *)
module input_0_arbiter_encap_packet_top_0_0(clk, rst_n, data_arbiter_send, 
  router_dst_addr_send, header_pkt_send, start_encap_pkt, data_send, data_encap_valid, 
  encap_done)
/* synthesis syn_black_box black_box_pad_pin="clk,rst_n,data_arbiter_send[1023:0],router_dst_addr_send[9:0],header_pkt_send[8:0],start_encap_pkt,data_send[63:0],data_encap_valid,encap_done" */;
  input clk;
  input rst_n;
  input [1023:0]data_arbiter_send;
  input [9:0]router_dst_addr_send;
  input [8:0]header_pkt_send;
  input start_encap_pkt;
  output [63:0]data_send;
  output data_encap_valid;
  output encap_done;
endmodule

// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Sat May 24 02:10:16 2025
// Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/kien_k66/Documents/DATN/code/Router_datn/arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ip/input_0_arbiter_router_controller_0_0/input_0_arbiter_router_controller_0_0_stub.v
// Design      : input_0_arbiter_router_controller_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu250-figd2104-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "router_controller,Vivado 2024.1" *)
module input_0_arbiter_router_controller_0_0(clk, rst_n, router_start_req, router_scr_addr, 
  router_dst_addr, router_done, arbiter_read_gnt, arbiter_write_gnt, arbiter_read_req, 
  arbiter_write_req, arbiter_src_addr, arbiter_dst_addr, data_port1_before, 
  data_port1_after, control_crossbar, empty_input_port_0, encap_done, start_encap_pkt, 
  router_dst_addr_send, header_pkt_send, rd_input_port_0, empty_input_port_1, 
  rd_input_port_1, empty_output_port_0, decap_done, empty_arbiter_fifo, 
  dst_addr_arbiter_recv, start_decap_pkt, rd_output_port_0, we_output_port_0, 
  read_arbiter_fifo, we_output_port_1)
/* synthesis syn_black_box black_box_pad_pin="clk,rst_n,router_start_req,router_scr_addr[9:0],router_dst_addr[9:0],router_done,arbiter_read_gnt,arbiter_write_gnt,arbiter_read_req,arbiter_write_req,arbiter_src_addr[9:0],arbiter_dst_addr[9:0],data_port1_before[63:0],data_port1_after[63:0],control_crossbar[1:0],empty_input_port_0,encap_done,start_encap_pkt,router_dst_addr_send[9:0],header_pkt_send[8:0],rd_input_port_0,empty_input_port_1,rd_input_port_1,empty_output_port_0,decap_done,empty_arbiter_fifo,dst_addr_arbiter_recv[9:0],start_decap_pkt,rd_output_port_0,we_output_port_0,read_arbiter_fifo,we_output_port_1" */;
  input clk;
  input rst_n;
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
endmodule

// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Sat May 24 02:10:41 2025
// Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/kien_k66/Documents/DATN/code/Router_datn/arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ip/input_0_arbiter_arbiter_bram_0_0/input_0_arbiter_arbiter_bram_0_0_stub.v
// Design      : input_0_arbiter_arbiter_bram_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu250-figd2104-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "arbiter_bram,Vivado 2024.1" *)
module input_0_arbiter_arbiter_bram_0_0(clk, rst_n, src_addr, data_arbiter_send, 
  read_req, read_gnt, dst_addr, data_arbiter_recv, write_req, write_gnt)
/* synthesis syn_black_box black_box_pad_pin="rst_n,src_addr[9:0],data_arbiter_send[1023:0],read_req,read_gnt,dst_addr[9:0],data_arbiter_recv[1023:0],write_req,write_gnt" */
/* synthesis syn_force_seq_prim="clk" */;
  input clk /* synthesis syn_isclock = 1 */;
  input rst_n;
  input [9:0]src_addr;
  output [1023:0]data_arbiter_send;
  input read_req;
  output read_gnt;
  input [9:0]dst_addr;
  input [1023:0]data_arbiter_recv;
  input write_req;
  output write_gnt;
endmodule

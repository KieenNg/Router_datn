// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Sat May 24 02:10:17 2025
// Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/kien_k66/Documents/DATN/code/Router_datn/arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ip/input_0_arbiter_crossbar_0_0/input_0_arbiter_crossbar_0_0_stub.v
// Design      : input_0_arbiter_crossbar_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu250-figd2104-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "crossbar,Vivado 2024.1" *)
module input_0_arbiter_crossbar_0_0(control_crossbar, data_in_port_0, 
  data_in_port_1, data_port_1_after, data_port_1_before, data_out_port_0, data_out_port_1)
/* synthesis syn_black_box black_box_pad_pin="control_crossbar[1:0],data_in_port_0[63:0],data_in_port_1[63:0],data_port_1_after[63:0],data_port_1_before[63:0],data_out_port_0[63:0],data_out_port_1[63:0]" */;
  input [1:0]control_crossbar;
  input [63:0]data_in_port_0;
  input [63:0]data_in_port_1;
  input [63:0]data_port_1_after;
  output [63:0]data_port_1_before;
  output [63:0]data_out_port_0;
  output [63:0]data_out_port_1;
endmodule

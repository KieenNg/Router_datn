//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Sat May 24 02:30:48 2025
//Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
//Command     : generate_target input_0_arbiter_wrapper.bd
//Design      : input_0_arbiter_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module input_0_arbiter_wrapper
   (clk,
    router_done,
    router_dst_addr,
    router_scr_addr,
    router_start_req,
    rst_n);
  input clk;
  output router_done;
  input [9:0]router_dst_addr;
  input [9:0]router_scr_addr;
  input router_start_req;
  input rst_n;

  wire clk;
  wire router_done;
  wire [9:0]router_dst_addr;
  wire [9:0]router_scr_addr;
  wire router_start_req;
  wire rst_n;

  input_0_arbiter input_0_arbiter_i
       (.clk(clk),
        .router_done(router_done),
        .router_dst_addr(router_dst_addr),
        .router_scr_addr(router_scr_addr),
        .router_start_req(router_start_req),
        .rst_n(rst_n));
endmodule

//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Fri May 23 01:56:47 2025
//Host        : socone-kien running 64-bit Ubuntu 22.04.5 LTS
//Command     : generate_target input_0_arbiter_wrapper.bd
//Design      : input_0_arbiter_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module input_0_arbiter_wrapper
   (aurora_rx_tdata,
    aurora_rx_tvalid,
    clk,
    router_dst_addr,
    router_scr_addr,
    router_start_req,
    rst_n);
  input [63:0]aurora_rx_tdata;
  input aurora_rx_tvalid;
  input clk;
  input [9:0]router_dst_addr;
  input [9:0]router_scr_addr;
  input router_start_req;
  input rst_n;

  wire [63:0]aurora_rx_tdata;
  wire aurora_rx_tvalid;
  wire clk;
  wire [9:0]router_dst_addr;
  wire [9:0]router_scr_addr;
  wire router_start_req;
  wire rst_n;

  input_0_arbiter input_0_arbiter_i
       (.aurora_rx_tdata(aurora_rx_tdata),
        .aurora_rx_tvalid(aurora_rx_tvalid),
        .clk(clk),
        .router_dst_addr(router_dst_addr),
        .router_scr_addr(router_scr_addr),
        .router_start_req(router_start_req),
        .rst_n(rst_n));
endmodule

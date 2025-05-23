// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:router_controller:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module input_0_arbiter_router_controller_0_0 (
  clk,
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
  dst_addr_arbiter_recv,
  header_pkt_recv,
  start_decap_pkt,
  rd_output_port_0,
  we_output_port_0,
  we_output_port_1
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN input_0_arbiter_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
input wire rst_n;
input wire router_start_req;
input wire [9 : 0] router_scr_addr;
input wire [9 : 0] router_dst_addr;
output wire router_done;
input wire arbiter_read_gnt;
input wire arbiter_write_gnt;
output wire arbiter_read_req;
output wire arbiter_write_req;
output wire [9 : 0] arbiter_src_addr;
output wire [9 : 0] arbiter_dst_addr;
input wire [63 : 0] data_port1_before;
output wire [63 : 0] data_port1_after;
output wire [1 : 0] control_crossbar;
input wire empty_input_port_0;
input wire encap_done;
output wire start_encap_pkt;
output wire [9 : 0] router_dst_addr_send;
output wire [8 : 0] header_pkt_send;
output wire rd_input_port_0;
input wire empty_input_port_1;
output wire rd_input_port_1;
input wire empty_output_port_0;
input wire decap_done;
input wire [9 : 0] dst_addr_arbiter_recv;
input wire [8 : 0] header_pkt_recv;
output wire start_decap_pkt;
output wire rd_output_port_0;
output wire we_output_port_0;
output wire we_output_port_1;

  router_controller #(
    .AURORA_DATA_WIDTH(64),
    .ADDR_WIDTH(10),
    .NUMBER_PACKET(19),
    .RECOGNIZE_ROUTER_WIDTH(2)
  ) inst (
    .clk(clk),
    .rst_n(rst_n),
    .router_start_req(router_start_req),
    .router_scr_addr(router_scr_addr),
    .router_dst_addr(router_dst_addr),
    .router_done(router_done),
    .arbiter_read_gnt(arbiter_read_gnt),
    .arbiter_write_gnt(arbiter_write_gnt),
    .arbiter_read_req(arbiter_read_req),
    .arbiter_write_req(arbiter_write_req),
    .arbiter_src_addr(arbiter_src_addr),
    .arbiter_dst_addr(arbiter_dst_addr),
    .data_port1_before(data_port1_before),
    .data_port1_after(data_port1_after),
    .control_crossbar(control_crossbar),
    .empty_input_port_0(empty_input_port_0),
    .encap_done(encap_done),
    .start_encap_pkt(start_encap_pkt),
    .router_dst_addr_send(router_dst_addr_send),
    .header_pkt_send(header_pkt_send),
    .rd_input_port_0(rd_input_port_0),
    .empty_input_port_1(empty_input_port_1),
    .rd_input_port_1(rd_input_port_1),
    .empty_output_port_0(empty_output_port_0),
    .decap_done(decap_done),
    .dst_addr_arbiter_recv(dst_addr_arbiter_recv),
    .header_pkt_recv(header_pkt_recv),
    .start_decap_pkt(start_decap_pkt),
    .rd_output_port_0(rd_output_port_0),
    .we_output_port_0(we_output_port_0),
    .we_output_port_1(we_output_port_1)
  );
endmodule

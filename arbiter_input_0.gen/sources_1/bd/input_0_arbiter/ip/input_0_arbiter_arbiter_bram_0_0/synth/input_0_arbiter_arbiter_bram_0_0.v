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


// IP VLNV: xilinx.com:module_ref:arbiter_bram:1.0
// IP Revision: 1

(* X_CORE_INFO = "arbiter_bram,Vivado 2024.1" *)
(* CHECK_LICENSE_TYPE = "input_0_arbiter_arbiter_bram_0_0,arbiter_bram,{}" *)
(* CORE_GENERATION_INFO = "input_0_arbiter_arbiter_bram_0_0,arbiter_bram,{x_ipProduct=Vivado 2024.1,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=arbiter_bram,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,VRF_ADDR_WIDTH=10,VRF_DATA_WIDTH=1024}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module input_0_arbiter_arbiter_bram_0_0 (
  clk,
  rst_n,
  src_addr,
  data_arbiter_send,
  read_req,
  read_gnt,
  dst_addr,
  data_arbiter_recv,
  write_req,
  write_gnt
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN input_0_arbiter_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
input wire rst_n;
input wire [9 : 0] src_addr;
output wire [1023 : 0] data_arbiter_send;
input wire read_req;
output wire read_gnt;
input wire [9 : 0] dst_addr;
input wire [1023 : 0] data_arbiter_recv;
input wire write_req;
output wire write_gnt;

  arbiter_bram #(
    .VRF_ADDR_WIDTH(10),
    .VRF_DATA_WIDTH(1024)
  ) inst (
    .clk(clk),
    .rst_n(rst_n),
    .src_addr(src_addr),
    .data_arbiter_send(data_arbiter_send),
    .read_req(read_req),
    .read_gnt(read_gnt),
    .dst_addr(dst_addr),
    .data_arbiter_recv(data_arbiter_recv),
    .write_req(write_req),
    .write_gnt(write_gnt)
  );
endmodule

// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Sat May 24 02:10:17 2025
// Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode funcsim
//               /home/kien_k66/Documents/DATN/code/Router_datn/arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ip/input_0_arbiter_crossbar_0_0/input_0_arbiter_crossbar_0_0_sim_netlist.v
// Design      : input_0_arbiter_crossbar_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu250-figd2104-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "input_0_arbiter_crossbar_0_0,crossbar,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "crossbar,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module input_0_arbiter_crossbar_0_0
   (control_crossbar,
    data_in_port_0,
    data_in_port_1,
    data_port_1_after,
    data_port_1_before,
    data_out_port_0,
    data_out_port_1);
  input [1:0]control_crossbar;
  input [63:0]data_in_port_0;
  input [63:0]data_in_port_1;
  input [63:0]data_port_1_after;
  output [63:0]data_port_1_before;
  output [63:0]data_out_port_0;
  output [63:0]data_out_port_1;

  wire [1:0]control_crossbar;
  wire [63:0]data_in_port_0;
  wire [63:0]data_in_port_1;
  wire [63:0]data_out_port_0;
  wire [63:0]data_out_port_1;
  wire [63:0]data_port_1_after;

  assign data_port_1_before[63:0] = data_in_port_1;
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[0]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[0]),
        .O(data_out_port_0[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[10]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[10]),
        .O(data_out_port_0[10]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[11]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[11]),
        .O(data_out_port_0[11]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[12]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[12]),
        .O(data_out_port_0[12]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[13]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[13]),
        .O(data_out_port_0[13]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[14]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[14]),
        .O(data_out_port_0[14]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[15]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[15]),
        .O(data_out_port_0[15]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[16]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[16]),
        .O(data_out_port_0[16]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[17]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[17]),
        .O(data_out_port_0[17]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[18]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[18]),
        .O(data_out_port_0[18]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[19]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[19]),
        .O(data_out_port_0[19]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[1]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[1]),
        .O(data_out_port_0[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[20]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[20]),
        .O(data_out_port_0[20]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[21]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[21]),
        .O(data_out_port_0[21]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[22]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[22]),
        .O(data_out_port_0[22]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[23]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[23]),
        .O(data_out_port_0[23]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[24]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[24]),
        .O(data_out_port_0[24]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[25]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[25]),
        .O(data_out_port_0[25]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[26]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[26]),
        .O(data_out_port_0[26]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[27]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[27]),
        .O(data_out_port_0[27]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[28]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[28]),
        .O(data_out_port_0[28]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[29]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[29]),
        .O(data_out_port_0[29]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[2]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[2]),
        .O(data_out_port_0[2]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[30]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[30]),
        .O(data_out_port_0[30]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[31]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[31]),
        .O(data_out_port_0[31]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[32]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[32]),
        .O(data_out_port_0[32]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[33]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[33]),
        .O(data_out_port_0[33]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[34]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[34]),
        .O(data_out_port_0[34]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[35]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[35]),
        .O(data_out_port_0[35]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[36]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[36]),
        .O(data_out_port_0[36]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[37]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[37]),
        .O(data_out_port_0[37]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[38]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[38]),
        .O(data_out_port_0[38]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[39]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[39]),
        .O(data_out_port_0[39]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[3]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[3]),
        .O(data_out_port_0[3]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[40]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[40]),
        .O(data_out_port_0[40]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[41]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[41]),
        .O(data_out_port_0[41]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[42]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[42]),
        .O(data_out_port_0[42]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[43]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[43]),
        .O(data_out_port_0[43]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[44]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[44]),
        .O(data_out_port_0[44]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[45]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[45]),
        .O(data_out_port_0[45]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[46]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[46]),
        .O(data_out_port_0[46]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[47]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[47]),
        .O(data_out_port_0[47]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[48]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[48]),
        .O(data_out_port_0[48]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[49]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[49]),
        .O(data_out_port_0[49]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[4]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[4]),
        .O(data_out_port_0[4]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[50]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[50]),
        .O(data_out_port_0[50]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[51]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[51]),
        .O(data_out_port_0[51]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[52]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[52]),
        .O(data_out_port_0[52]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[53]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[53]),
        .O(data_out_port_0[53]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[54]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[54]),
        .O(data_out_port_0[54]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[55]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[55]),
        .O(data_out_port_0[55]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[56]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[56]),
        .O(data_out_port_0[56]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[57]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[57]),
        .O(data_out_port_0[57]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[58]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[58]),
        .O(data_out_port_0[58]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[59]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[59]),
        .O(data_out_port_0[59]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[5]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[5]),
        .O(data_out_port_0[5]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[60]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[60]),
        .O(data_out_port_0[60]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[61]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[61]),
        .O(data_out_port_0[61]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[62]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[62]),
        .O(data_out_port_0[62]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[63]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[63]),
        .O(data_out_port_0[63]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[6]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[6]),
        .O(data_out_port_0[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[7]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[7]),
        .O(data_out_port_0[7]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[8]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[8]),
        .O(data_out_port_0[8]));
  LUT2 #(
    .INIT(4'h8)) 
    \data_out_port_0[9]_INST_0 
       (.I0(control_crossbar[1]),
        .I1(data_port_1_after[9]),
        .O(data_out_port_0[9]));
  input_0_arbiter_crossbar_0_0_crossbar inst
       (.control_crossbar(control_crossbar),
        .data_in_port_0(data_in_port_0),
        .data_out_port_1(data_out_port_1),
        .data_port_1_after(data_port_1_after));
endmodule

(* ORIG_REF_NAME = "crossbar" *) 
module input_0_arbiter_crossbar_0_0_crossbar
   (data_out_port_1,
    control_crossbar,
    data_in_port_0,
    data_port_1_after);
  output [63:0]data_out_port_1;
  input [1:0]control_crossbar;
  input [63:0]data_in_port_0;
  input [63:0]data_port_1_after;

  wire [1:0]control_crossbar;
  wire [63:0]data_in_port_0;
  wire [63:0]data_out_port_1;
  wire [63:0]data_port_1_after;

  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[0]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[0]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[0]),
        .O(data_out_port_1[0]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[10]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[10]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[10]),
        .O(data_out_port_1[10]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[11]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[11]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[11]),
        .O(data_out_port_1[11]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[12]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[12]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[12]),
        .O(data_out_port_1[12]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[13]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[13]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[13]),
        .O(data_out_port_1[13]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[14]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[14]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[14]),
        .O(data_out_port_1[14]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[15]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[15]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[15]),
        .O(data_out_port_1[15]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[16]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[16]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[16]),
        .O(data_out_port_1[16]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[17]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[17]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[17]),
        .O(data_out_port_1[17]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[18]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[18]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[18]),
        .O(data_out_port_1[18]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[19]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[19]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[19]),
        .O(data_out_port_1[19]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[1]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[1]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[1]),
        .O(data_out_port_1[1]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[20]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[20]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[20]),
        .O(data_out_port_1[20]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[21]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[21]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[21]),
        .O(data_out_port_1[21]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[22]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[22]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[22]),
        .O(data_out_port_1[22]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[23]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[23]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[23]),
        .O(data_out_port_1[23]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[24]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[24]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[24]),
        .O(data_out_port_1[24]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[25]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[25]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[25]),
        .O(data_out_port_1[25]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[26]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[26]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[26]),
        .O(data_out_port_1[26]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[27]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[27]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[27]),
        .O(data_out_port_1[27]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[28]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[28]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[28]),
        .O(data_out_port_1[28]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[29]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[29]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[29]),
        .O(data_out_port_1[29]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[2]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[2]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[2]),
        .O(data_out_port_1[2]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[30]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[30]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[30]),
        .O(data_out_port_1[30]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[31]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[31]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[31]),
        .O(data_out_port_1[31]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[32]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[32]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[32]),
        .O(data_out_port_1[32]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[33]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[33]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[33]),
        .O(data_out_port_1[33]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[34]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[34]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[34]),
        .O(data_out_port_1[34]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[35]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[35]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[35]),
        .O(data_out_port_1[35]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[36]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[36]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[36]),
        .O(data_out_port_1[36]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[37]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[37]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[37]),
        .O(data_out_port_1[37]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[38]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[38]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[38]),
        .O(data_out_port_1[38]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[39]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[39]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[39]),
        .O(data_out_port_1[39]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[3]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[3]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[3]),
        .O(data_out_port_1[3]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[40]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[40]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[40]),
        .O(data_out_port_1[40]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[41]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[41]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[41]),
        .O(data_out_port_1[41]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[42]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[42]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[42]),
        .O(data_out_port_1[42]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[43]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[43]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[43]),
        .O(data_out_port_1[43]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[44]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[44]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[44]),
        .O(data_out_port_1[44]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[45]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[45]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[45]),
        .O(data_out_port_1[45]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[46]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[46]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[46]),
        .O(data_out_port_1[46]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[47]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[47]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[47]),
        .O(data_out_port_1[47]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[48]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[48]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[48]),
        .O(data_out_port_1[48]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[49]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[49]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[49]),
        .O(data_out_port_1[49]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[4]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[4]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[4]),
        .O(data_out_port_1[4]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[50]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[50]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[50]),
        .O(data_out_port_1[50]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[51]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[51]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[51]),
        .O(data_out_port_1[51]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[52]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[52]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[52]),
        .O(data_out_port_1[52]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[53]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[53]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[53]),
        .O(data_out_port_1[53]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[54]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[54]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[54]),
        .O(data_out_port_1[54]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[55]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[55]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[55]),
        .O(data_out_port_1[55]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[56]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[56]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[56]),
        .O(data_out_port_1[56]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[57]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[57]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[57]),
        .O(data_out_port_1[57]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[58]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[58]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[58]),
        .O(data_out_port_1[58]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[59]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[59]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[59]),
        .O(data_out_port_1[59]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[5]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[5]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[5]),
        .O(data_out_port_1[5]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[60]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[60]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[60]),
        .O(data_out_port_1[60]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[61]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[61]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[61]),
        .O(data_out_port_1[61]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[62]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[62]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[62]),
        .O(data_out_port_1[62]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[63]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[63]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[63]),
        .O(data_out_port_1[63]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[6]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[6]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[6]),
        .O(data_out_port_1[6]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[7]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[7]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[7]),
        .O(data_out_port_1[7]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[8]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[8]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[8]),
        .O(data_out_port_1[8]));
  LUT4 #(
    .INIT(16'hA808)) 
    \data_out_port_1[9]_INST_0 
       (.I0(control_crossbar[0]),
        .I1(data_in_port_0[9]),
        .I2(control_crossbar[1]),
        .I3(data_port_1_after[9]),
        .O(data_out_port_1[9]));
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

-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Sat May 24 02:10:16 2025
-- Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode funcsim
--               /home/kien_k66/Documents/DATN/code/Router_datn/arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ip/input_0_arbiter_router_controller_0_0/input_0_arbiter_router_controller_0_0_sim_netlist.vhdl
-- Design      : input_0_arbiter_router_controller_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcu250-figd2104-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity input_0_arbiter_router_controller_0_0 is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    router_start_req : in STD_LOGIC;
    router_scr_addr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    router_dst_addr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    router_done : out STD_LOGIC;
    arbiter_read_gnt : in STD_LOGIC;
    arbiter_write_gnt : in STD_LOGIC;
    arbiter_read_req : out STD_LOGIC;
    arbiter_write_req : out STD_LOGIC;
    arbiter_src_addr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    arbiter_dst_addr : out STD_LOGIC_VECTOR ( 9 downto 0 );
    data_port1_before : in STD_LOGIC_VECTOR ( 63 downto 0 );
    data_port1_after : out STD_LOGIC_VECTOR ( 63 downto 0 );
    control_crossbar : out STD_LOGIC_VECTOR ( 1 downto 0 );
    empty_input_port_0 : in STD_LOGIC;
    encap_done : in STD_LOGIC;
    start_encap_pkt : out STD_LOGIC;
    router_dst_addr_send : out STD_LOGIC_VECTOR ( 9 downto 0 );
    header_pkt_send : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rd_input_port_0 : out STD_LOGIC;
    empty_input_port_1 : in STD_LOGIC;
    rd_input_port_1 : out STD_LOGIC;
    empty_output_port_0 : in STD_LOGIC;
    decap_done : in STD_LOGIC;
    empty_arbiter_fifo : in STD_LOGIC;
    dst_addr_arbiter_recv : in STD_LOGIC_VECTOR ( 9 downto 0 );
    start_decap_pkt : out STD_LOGIC;
    rd_output_port_0 : out STD_LOGIC;
    we_output_port_0 : out STD_LOGIC;
    read_arbiter_fifo : out STD_LOGIC;
    we_output_port_1 : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of input_0_arbiter_router_controller_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of input_0_arbiter_router_controller_0_0 : entity is "input_0_arbiter_router_controller_0_0,router_controller,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of input_0_arbiter_router_controller_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of input_0_arbiter_router_controller_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of input_0_arbiter_router_controller_0_0 : entity is "router_controller,Vivado 2024.1";
end input_0_arbiter_router_controller_0_0;

architecture STRUCTURE of input_0_arbiter_router_controller_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN input_0_arbiter_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  arbiter_dst_addr(9) <= \<const0>\;
  arbiter_dst_addr(8) <= \<const0>\;
  arbiter_dst_addr(7) <= \<const0>\;
  arbiter_dst_addr(6) <= \<const0>\;
  arbiter_dst_addr(5) <= \<const0>\;
  arbiter_dst_addr(4) <= \<const0>\;
  arbiter_dst_addr(3) <= \<const0>\;
  arbiter_dst_addr(2) <= \<const0>\;
  arbiter_dst_addr(1) <= \<const0>\;
  arbiter_dst_addr(0) <= \<const0>\;
  arbiter_read_req <= \<const0>\;
  arbiter_src_addr(9) <= \<const0>\;
  arbiter_src_addr(8) <= \<const0>\;
  arbiter_src_addr(7) <= \<const0>\;
  arbiter_src_addr(6) <= \<const0>\;
  arbiter_src_addr(5) <= \<const0>\;
  arbiter_src_addr(4) <= \<const0>\;
  arbiter_src_addr(3) <= \<const0>\;
  arbiter_src_addr(2) <= \<const0>\;
  arbiter_src_addr(1) <= \<const0>\;
  arbiter_src_addr(0) <= \<const0>\;
  arbiter_write_req <= \<const0>\;
  control_crossbar(1) <= \<const0>\;
  control_crossbar(0) <= \<const0>\;
  data_port1_after(63) <= \<const0>\;
  data_port1_after(62) <= \<const0>\;
  data_port1_after(61) <= \<const0>\;
  data_port1_after(60) <= \<const0>\;
  data_port1_after(59) <= \<const0>\;
  data_port1_after(58) <= \<const0>\;
  data_port1_after(57) <= \<const0>\;
  data_port1_after(56) <= \<const0>\;
  data_port1_after(55) <= \<const0>\;
  data_port1_after(54) <= \<const0>\;
  data_port1_after(53) <= \<const0>\;
  data_port1_after(52) <= \<const0>\;
  data_port1_after(51) <= \<const0>\;
  data_port1_after(50) <= \<const0>\;
  data_port1_after(49) <= \<const0>\;
  data_port1_after(48) <= \<const0>\;
  data_port1_after(47) <= \<const0>\;
  data_port1_after(46) <= \<const0>\;
  data_port1_after(45) <= \<const0>\;
  data_port1_after(44) <= \<const0>\;
  data_port1_after(43) <= \<const0>\;
  data_port1_after(42) <= \<const0>\;
  data_port1_after(41) <= \<const0>\;
  data_port1_after(40) <= \<const0>\;
  data_port1_after(39) <= \<const0>\;
  data_port1_after(38) <= \<const0>\;
  data_port1_after(37) <= \<const0>\;
  data_port1_after(36) <= \<const0>\;
  data_port1_after(35) <= \<const0>\;
  data_port1_after(34) <= \<const0>\;
  data_port1_after(33) <= \<const0>\;
  data_port1_after(32) <= \<const0>\;
  data_port1_after(31) <= \<const0>\;
  data_port1_after(30) <= \<const0>\;
  data_port1_after(29) <= \<const0>\;
  data_port1_after(28) <= \<const0>\;
  data_port1_after(27) <= \<const0>\;
  data_port1_after(26) <= \<const0>\;
  data_port1_after(25) <= \<const0>\;
  data_port1_after(24) <= \<const0>\;
  data_port1_after(23) <= \<const0>\;
  data_port1_after(22) <= \<const0>\;
  data_port1_after(21) <= \<const0>\;
  data_port1_after(20) <= \<const0>\;
  data_port1_after(19) <= \<const0>\;
  data_port1_after(18) <= \<const0>\;
  data_port1_after(17) <= \<const0>\;
  data_port1_after(16) <= \<const0>\;
  data_port1_after(15) <= \<const0>\;
  data_port1_after(14) <= \<const0>\;
  data_port1_after(13) <= \<const0>\;
  data_port1_after(12) <= \<const0>\;
  data_port1_after(11) <= \<const0>\;
  data_port1_after(10) <= \<const0>\;
  data_port1_after(9) <= \<const0>\;
  data_port1_after(8) <= \<const0>\;
  data_port1_after(7) <= \<const0>\;
  data_port1_after(6) <= \<const0>\;
  data_port1_after(5) <= \<const0>\;
  data_port1_after(4) <= \<const0>\;
  data_port1_after(3) <= \<const0>\;
  data_port1_after(2) <= \<const0>\;
  data_port1_after(1) <= \<const0>\;
  data_port1_after(0) <= \<const0>\;
  header_pkt_send(8) <= \<const0>\;
  header_pkt_send(7) <= \<const0>\;
  header_pkt_send(6) <= \<const0>\;
  header_pkt_send(5) <= \<const0>\;
  header_pkt_send(4) <= \<const0>\;
  header_pkt_send(3) <= \<const0>\;
  header_pkt_send(2) <= \<const0>\;
  header_pkt_send(1) <= \<const0>\;
  header_pkt_send(0) <= \<const0>\;
  rd_input_port_0 <= \<const0>\;
  rd_input_port_1 <= \<const0>\;
  rd_output_port_0 <= \<const0>\;
  read_arbiter_fifo <= \<const0>\;
  router_done <= \<const1>\;
  router_dst_addr_send(9) <= \<const0>\;
  router_dst_addr_send(8) <= \<const0>\;
  router_dst_addr_send(7) <= \<const0>\;
  router_dst_addr_send(6) <= \<const0>\;
  router_dst_addr_send(5) <= \<const0>\;
  router_dst_addr_send(4) <= \<const0>\;
  router_dst_addr_send(3) <= \<const0>\;
  router_dst_addr_send(2) <= \<const0>\;
  router_dst_addr_send(1) <= \<const0>\;
  router_dst_addr_send(0) <= \<const0>\;
  start_decap_pkt <= \<const0>\;
  start_encap_pkt <= \<const0>\;
  we_output_port_0 <= \<const0>\;
  we_output_port_1 <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;

-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Sat May 24 02:10:17 2025
-- Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode funcsim
--               /home/kien_k66/Documents/DATN/code/Router_datn/arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ip/input_0_arbiter_encap_packet_top_0_0/input_0_arbiter_encap_packet_top_0_0_sim_netlist.vhdl
-- Design      : input_0_arbiter_encap_packet_top_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcu250-figd2104-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity input_0_arbiter_encap_packet_top_0_0 is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    data_arbiter_send : in STD_LOGIC_VECTOR ( 1023 downto 0 );
    router_dst_addr_send : in STD_LOGIC_VECTOR ( 9 downto 0 );
    header_pkt_send : in STD_LOGIC_VECTOR ( 8 downto 0 );
    start_encap_pkt : in STD_LOGIC;
    data_send : out STD_LOGIC_VECTOR ( 63 downto 0 );
    data_encap_valid : out STD_LOGIC;
    encap_done : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of input_0_arbiter_encap_packet_top_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of input_0_arbiter_encap_packet_top_0_0 : entity is "input_0_arbiter_encap_packet_top_0_0,encap_packet_top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of input_0_arbiter_encap_packet_top_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of input_0_arbiter_encap_packet_top_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of input_0_arbiter_encap_packet_top_0_0 : entity is "encap_packet_top,Vivado 2024.1";
end input_0_arbiter_encap_packet_top_0_0;

architecture STRUCTURE of input_0_arbiter_encap_packet_top_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN input_0_arbiter_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  data_encap_valid <= \<const0>\;
  data_send(63) <= \<const0>\;
  data_send(62) <= \<const0>\;
  data_send(61) <= \<const0>\;
  data_send(60) <= \<const0>\;
  data_send(59) <= \<const0>\;
  data_send(58) <= \<const0>\;
  data_send(57) <= \<const0>\;
  data_send(56) <= \<const0>\;
  data_send(55) <= \<const0>\;
  data_send(54) <= \<const0>\;
  data_send(53) <= \<const0>\;
  data_send(52) <= \<const0>\;
  data_send(51) <= \<const0>\;
  data_send(50) <= \<const0>\;
  data_send(49) <= \<const0>\;
  data_send(48) <= \<const0>\;
  data_send(47) <= \<const0>\;
  data_send(46) <= \<const0>\;
  data_send(45) <= \<const0>\;
  data_send(44) <= \<const0>\;
  data_send(43) <= \<const0>\;
  data_send(42) <= \<const0>\;
  data_send(41) <= \<const0>\;
  data_send(40) <= \<const0>\;
  data_send(39) <= \<const0>\;
  data_send(38) <= \<const0>\;
  data_send(37) <= \<const0>\;
  data_send(36) <= \<const0>\;
  data_send(35) <= \<const0>\;
  data_send(34) <= \<const0>\;
  data_send(33) <= \<const0>\;
  data_send(32) <= \<const0>\;
  data_send(31) <= \<const0>\;
  data_send(30) <= \<const0>\;
  data_send(29) <= \<const0>\;
  data_send(28) <= \<const0>\;
  data_send(27) <= \<const0>\;
  data_send(26) <= \<const0>\;
  data_send(25) <= \<const0>\;
  data_send(24) <= \<const0>\;
  data_send(23) <= \<const0>\;
  data_send(22) <= \<const0>\;
  data_send(21) <= \<const0>\;
  data_send(20) <= \<const0>\;
  data_send(19) <= \<const0>\;
  data_send(18) <= \<const0>\;
  data_send(17) <= \<const0>\;
  data_send(16) <= \<const0>\;
  data_send(15) <= \<const0>\;
  data_send(14) <= \<const0>\;
  data_send(13) <= \<const0>\;
  data_send(12) <= \<const0>\;
  data_send(11) <= \<const0>\;
  data_send(10) <= \<const0>\;
  data_send(9) <= \<const0>\;
  data_send(8) <= \<const0>\;
  data_send(7) <= \<const0>\;
  data_send(6) <= \<const0>\;
  data_send(5) <= \<const0>\;
  data_send(4) <= \<const0>\;
  data_send(3) <= \<const0>\;
  data_send(2) <= \<const0>\;
  data_send(1) <= \<const0>\;
  data_send(0) <= \<const0>\;
  encap_done <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
end STRUCTURE;

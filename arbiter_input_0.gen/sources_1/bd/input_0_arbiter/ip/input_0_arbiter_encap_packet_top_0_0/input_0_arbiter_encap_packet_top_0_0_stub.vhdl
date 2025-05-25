-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Sat May 24 02:10:17 2025
-- Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/kien_k66/Documents/DATN/code/Router_datn/arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ip/input_0_arbiter_encap_packet_top_0_0/input_0_arbiter_encap_packet_top_0_0_stub.vhdl
-- Design      : input_0_arbiter_encap_packet_top_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcu250-figd2104-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity input_0_arbiter_encap_packet_top_0_0 is
  Port ( 
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

end input_0_arbiter_encap_packet_top_0_0;

architecture stub of input_0_arbiter_encap_packet_top_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_n,data_arbiter_send[1023:0],router_dst_addr_send[9:0],header_pkt_send[8:0],start_encap_pkt,data_send[63:0],data_encap_valid,encap_done";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "encap_packet_top,Vivado 2024.1";
begin
end;

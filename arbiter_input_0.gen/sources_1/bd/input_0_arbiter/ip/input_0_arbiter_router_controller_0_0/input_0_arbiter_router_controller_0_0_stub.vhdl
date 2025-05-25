-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Sat May 24 02:10:16 2025
-- Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/kien_k66/Documents/DATN/code/Router_datn/arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ip/input_0_arbiter_router_controller_0_0/input_0_arbiter_router_controller_0_0_stub.vhdl
-- Design      : input_0_arbiter_router_controller_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcu250-figd2104-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity input_0_arbiter_router_controller_0_0 is
  Port ( 
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

end input_0_arbiter_router_controller_0_0;

architecture stub of input_0_arbiter_router_controller_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_n,router_start_req,router_scr_addr[9:0],router_dst_addr[9:0],router_done,arbiter_read_gnt,arbiter_write_gnt,arbiter_read_req,arbiter_write_req,arbiter_src_addr[9:0],arbiter_dst_addr[9:0],data_port1_before[63:0],data_port1_after[63:0],control_crossbar[1:0],empty_input_port_0,encap_done,start_encap_pkt,router_dst_addr_send[9:0],header_pkt_send[8:0],rd_input_port_0,empty_input_port_1,rd_input_port_1,empty_output_port_0,decap_done,empty_arbiter_fifo,dst_addr_arbiter_recv[9:0],start_decap_pkt,rd_output_port_0,we_output_port_0,read_arbiter_fifo,we_output_port_1";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "router_controller,Vivado 2024.1";
begin
end;

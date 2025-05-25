-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Sat May 24 02:10:41 2025
-- Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/kien_k66/Documents/DATN/code/Router_datn/arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ip/input_0_arbiter_arbiter_bram_0_0/input_0_arbiter_arbiter_bram_0_0_stub.vhdl
-- Design      : input_0_arbiter_arbiter_bram_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcu250-figd2104-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity input_0_arbiter_arbiter_bram_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    src_addr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    data_arbiter_send : out STD_LOGIC_VECTOR ( 1023 downto 0 );
    read_req : in STD_LOGIC;
    read_gnt : out STD_LOGIC;
    dst_addr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    data_arbiter_recv : in STD_LOGIC_VECTOR ( 1023 downto 0 );
    write_req : in STD_LOGIC;
    write_gnt : out STD_LOGIC
  );

end input_0_arbiter_arbiter_bram_0_0;

architecture stub of input_0_arbiter_arbiter_bram_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst_n,src_addr[9:0],data_arbiter_send[1023:0],read_req,read_gnt,dst_addr[9:0],data_arbiter_recv[1023:0],write_req,write_gnt";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "arbiter_bram,Vivado 2024.1";
begin
end;

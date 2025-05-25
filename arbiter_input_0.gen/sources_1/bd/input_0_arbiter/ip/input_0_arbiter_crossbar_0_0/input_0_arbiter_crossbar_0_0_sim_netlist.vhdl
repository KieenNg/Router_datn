-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Sat May 24 02:10:17 2025
-- Host        : edabk running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode funcsim
--               /home/kien_k66/Documents/DATN/code/Router_datn/arbiter_input_0.gen/sources_1/bd/input_0_arbiter/ip/input_0_arbiter_crossbar_0_0/input_0_arbiter_crossbar_0_0_sim_netlist.vhdl
-- Design      : input_0_arbiter_crossbar_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcu250-figd2104-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity input_0_arbiter_crossbar_0_0_crossbar is
  port (
    data_out_port_1 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    control_crossbar : in STD_LOGIC_VECTOR ( 1 downto 0 );
    data_in_port_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    data_port_1_after : in STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of input_0_arbiter_crossbar_0_0_crossbar : entity is "crossbar";
end input_0_arbiter_crossbar_0_0_crossbar;

architecture STRUCTURE of input_0_arbiter_crossbar_0_0_crossbar is
begin
\data_out_port_1[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(0),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(0),
      O => data_out_port_1(0)
    );
\data_out_port_1[10]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(10),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(10),
      O => data_out_port_1(10)
    );
\data_out_port_1[11]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(11),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(11),
      O => data_out_port_1(11)
    );
\data_out_port_1[12]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(12),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(12),
      O => data_out_port_1(12)
    );
\data_out_port_1[13]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(13),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(13),
      O => data_out_port_1(13)
    );
\data_out_port_1[14]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(14),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(14),
      O => data_out_port_1(14)
    );
\data_out_port_1[15]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(15),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(15),
      O => data_out_port_1(15)
    );
\data_out_port_1[16]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(16),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(16),
      O => data_out_port_1(16)
    );
\data_out_port_1[17]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(17),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(17),
      O => data_out_port_1(17)
    );
\data_out_port_1[18]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(18),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(18),
      O => data_out_port_1(18)
    );
\data_out_port_1[19]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(19),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(19),
      O => data_out_port_1(19)
    );
\data_out_port_1[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(1),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(1),
      O => data_out_port_1(1)
    );
\data_out_port_1[20]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(20),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(20),
      O => data_out_port_1(20)
    );
\data_out_port_1[21]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(21),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(21),
      O => data_out_port_1(21)
    );
\data_out_port_1[22]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(22),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(22),
      O => data_out_port_1(22)
    );
\data_out_port_1[23]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(23),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(23),
      O => data_out_port_1(23)
    );
\data_out_port_1[24]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(24),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(24),
      O => data_out_port_1(24)
    );
\data_out_port_1[25]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(25),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(25),
      O => data_out_port_1(25)
    );
\data_out_port_1[26]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(26),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(26),
      O => data_out_port_1(26)
    );
\data_out_port_1[27]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(27),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(27),
      O => data_out_port_1(27)
    );
\data_out_port_1[28]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(28),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(28),
      O => data_out_port_1(28)
    );
\data_out_port_1[29]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(29),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(29),
      O => data_out_port_1(29)
    );
\data_out_port_1[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(2),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(2),
      O => data_out_port_1(2)
    );
\data_out_port_1[30]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(30),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(30),
      O => data_out_port_1(30)
    );
\data_out_port_1[31]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(31),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(31),
      O => data_out_port_1(31)
    );
\data_out_port_1[32]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(32),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(32),
      O => data_out_port_1(32)
    );
\data_out_port_1[33]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(33),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(33),
      O => data_out_port_1(33)
    );
\data_out_port_1[34]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(34),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(34),
      O => data_out_port_1(34)
    );
\data_out_port_1[35]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(35),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(35),
      O => data_out_port_1(35)
    );
\data_out_port_1[36]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(36),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(36),
      O => data_out_port_1(36)
    );
\data_out_port_1[37]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(37),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(37),
      O => data_out_port_1(37)
    );
\data_out_port_1[38]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(38),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(38),
      O => data_out_port_1(38)
    );
\data_out_port_1[39]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(39),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(39),
      O => data_out_port_1(39)
    );
\data_out_port_1[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(3),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(3),
      O => data_out_port_1(3)
    );
\data_out_port_1[40]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(40),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(40),
      O => data_out_port_1(40)
    );
\data_out_port_1[41]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(41),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(41),
      O => data_out_port_1(41)
    );
\data_out_port_1[42]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(42),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(42),
      O => data_out_port_1(42)
    );
\data_out_port_1[43]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(43),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(43),
      O => data_out_port_1(43)
    );
\data_out_port_1[44]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(44),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(44),
      O => data_out_port_1(44)
    );
\data_out_port_1[45]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(45),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(45),
      O => data_out_port_1(45)
    );
\data_out_port_1[46]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(46),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(46),
      O => data_out_port_1(46)
    );
\data_out_port_1[47]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(47),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(47),
      O => data_out_port_1(47)
    );
\data_out_port_1[48]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(48),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(48),
      O => data_out_port_1(48)
    );
\data_out_port_1[49]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(49),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(49),
      O => data_out_port_1(49)
    );
\data_out_port_1[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(4),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(4),
      O => data_out_port_1(4)
    );
\data_out_port_1[50]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(50),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(50),
      O => data_out_port_1(50)
    );
\data_out_port_1[51]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(51),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(51),
      O => data_out_port_1(51)
    );
\data_out_port_1[52]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(52),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(52),
      O => data_out_port_1(52)
    );
\data_out_port_1[53]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(53),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(53),
      O => data_out_port_1(53)
    );
\data_out_port_1[54]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(54),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(54),
      O => data_out_port_1(54)
    );
\data_out_port_1[55]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(55),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(55),
      O => data_out_port_1(55)
    );
\data_out_port_1[56]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(56),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(56),
      O => data_out_port_1(56)
    );
\data_out_port_1[57]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(57),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(57),
      O => data_out_port_1(57)
    );
\data_out_port_1[58]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(58),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(58),
      O => data_out_port_1(58)
    );
\data_out_port_1[59]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(59),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(59),
      O => data_out_port_1(59)
    );
\data_out_port_1[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(5),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(5),
      O => data_out_port_1(5)
    );
\data_out_port_1[60]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(60),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(60),
      O => data_out_port_1(60)
    );
\data_out_port_1[61]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(61),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(61),
      O => data_out_port_1(61)
    );
\data_out_port_1[62]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(62),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(62),
      O => data_out_port_1(62)
    );
\data_out_port_1[63]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(63),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(63),
      O => data_out_port_1(63)
    );
\data_out_port_1[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(6),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(6),
      O => data_out_port_1(6)
    );
\data_out_port_1[7]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(7),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(7),
      O => data_out_port_1(7)
    );
\data_out_port_1[8]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(8),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(8),
      O => data_out_port_1(8)
    );
\data_out_port_1[9]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => control_crossbar(0),
      I1 => data_in_port_0(9),
      I2 => control_crossbar(1),
      I3 => data_port_1_after(9),
      O => data_out_port_1(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity input_0_arbiter_crossbar_0_0 is
  port (
    control_crossbar : in STD_LOGIC_VECTOR ( 1 downto 0 );
    data_in_port_0 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    data_in_port_1 : in STD_LOGIC_VECTOR ( 63 downto 0 );
    data_port_1_after : in STD_LOGIC_VECTOR ( 63 downto 0 );
    data_port_1_before : out STD_LOGIC_VECTOR ( 63 downto 0 );
    data_out_port_0 : out STD_LOGIC_VECTOR ( 63 downto 0 );
    data_out_port_1 : out STD_LOGIC_VECTOR ( 63 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of input_0_arbiter_crossbar_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of input_0_arbiter_crossbar_0_0 : entity is "input_0_arbiter_crossbar_0_0,crossbar,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of input_0_arbiter_crossbar_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of input_0_arbiter_crossbar_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of input_0_arbiter_crossbar_0_0 : entity is "crossbar,Vivado 2024.1";
end input_0_arbiter_crossbar_0_0;

architecture STRUCTURE of input_0_arbiter_crossbar_0_0 is
  signal \^data_in_port_1\ : STD_LOGIC_VECTOR ( 63 downto 0 );
begin
  \^data_in_port_1\(63 downto 0) <= data_in_port_1(63 downto 0);
  data_port_1_before(63 downto 0) <= \^data_in_port_1\(63 downto 0);
\data_out_port_0[0]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(0),
      O => data_out_port_0(0)
    );
\data_out_port_0[10]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(10),
      O => data_out_port_0(10)
    );
\data_out_port_0[11]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(11),
      O => data_out_port_0(11)
    );
\data_out_port_0[12]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(12),
      O => data_out_port_0(12)
    );
\data_out_port_0[13]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(13),
      O => data_out_port_0(13)
    );
\data_out_port_0[14]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(14),
      O => data_out_port_0(14)
    );
\data_out_port_0[15]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(15),
      O => data_out_port_0(15)
    );
\data_out_port_0[16]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(16),
      O => data_out_port_0(16)
    );
\data_out_port_0[17]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(17),
      O => data_out_port_0(17)
    );
\data_out_port_0[18]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(18),
      O => data_out_port_0(18)
    );
\data_out_port_0[19]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(19),
      O => data_out_port_0(19)
    );
\data_out_port_0[1]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(1),
      O => data_out_port_0(1)
    );
\data_out_port_0[20]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(20),
      O => data_out_port_0(20)
    );
\data_out_port_0[21]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(21),
      O => data_out_port_0(21)
    );
\data_out_port_0[22]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(22),
      O => data_out_port_0(22)
    );
\data_out_port_0[23]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(23),
      O => data_out_port_0(23)
    );
\data_out_port_0[24]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(24),
      O => data_out_port_0(24)
    );
\data_out_port_0[25]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(25),
      O => data_out_port_0(25)
    );
\data_out_port_0[26]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(26),
      O => data_out_port_0(26)
    );
\data_out_port_0[27]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(27),
      O => data_out_port_0(27)
    );
\data_out_port_0[28]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(28),
      O => data_out_port_0(28)
    );
\data_out_port_0[29]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(29),
      O => data_out_port_0(29)
    );
\data_out_port_0[2]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(2),
      O => data_out_port_0(2)
    );
\data_out_port_0[30]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(30),
      O => data_out_port_0(30)
    );
\data_out_port_0[31]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(31),
      O => data_out_port_0(31)
    );
\data_out_port_0[32]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(32),
      O => data_out_port_0(32)
    );
\data_out_port_0[33]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(33),
      O => data_out_port_0(33)
    );
\data_out_port_0[34]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(34),
      O => data_out_port_0(34)
    );
\data_out_port_0[35]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(35),
      O => data_out_port_0(35)
    );
\data_out_port_0[36]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(36),
      O => data_out_port_0(36)
    );
\data_out_port_0[37]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(37),
      O => data_out_port_0(37)
    );
\data_out_port_0[38]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(38),
      O => data_out_port_0(38)
    );
\data_out_port_0[39]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(39),
      O => data_out_port_0(39)
    );
\data_out_port_0[3]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(3),
      O => data_out_port_0(3)
    );
\data_out_port_0[40]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(40),
      O => data_out_port_0(40)
    );
\data_out_port_0[41]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(41),
      O => data_out_port_0(41)
    );
\data_out_port_0[42]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(42),
      O => data_out_port_0(42)
    );
\data_out_port_0[43]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(43),
      O => data_out_port_0(43)
    );
\data_out_port_0[44]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(44),
      O => data_out_port_0(44)
    );
\data_out_port_0[45]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(45),
      O => data_out_port_0(45)
    );
\data_out_port_0[46]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(46),
      O => data_out_port_0(46)
    );
\data_out_port_0[47]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(47),
      O => data_out_port_0(47)
    );
\data_out_port_0[48]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(48),
      O => data_out_port_0(48)
    );
\data_out_port_0[49]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(49),
      O => data_out_port_0(49)
    );
\data_out_port_0[4]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(4),
      O => data_out_port_0(4)
    );
\data_out_port_0[50]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(50),
      O => data_out_port_0(50)
    );
\data_out_port_0[51]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(51),
      O => data_out_port_0(51)
    );
\data_out_port_0[52]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(52),
      O => data_out_port_0(52)
    );
\data_out_port_0[53]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(53),
      O => data_out_port_0(53)
    );
\data_out_port_0[54]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(54),
      O => data_out_port_0(54)
    );
\data_out_port_0[55]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(55),
      O => data_out_port_0(55)
    );
\data_out_port_0[56]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(56),
      O => data_out_port_0(56)
    );
\data_out_port_0[57]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(57),
      O => data_out_port_0(57)
    );
\data_out_port_0[58]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(58),
      O => data_out_port_0(58)
    );
\data_out_port_0[59]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(59),
      O => data_out_port_0(59)
    );
\data_out_port_0[5]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(5),
      O => data_out_port_0(5)
    );
\data_out_port_0[60]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(60),
      O => data_out_port_0(60)
    );
\data_out_port_0[61]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(61),
      O => data_out_port_0(61)
    );
\data_out_port_0[62]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(62),
      O => data_out_port_0(62)
    );
\data_out_port_0[63]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(63),
      O => data_out_port_0(63)
    );
\data_out_port_0[6]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(6),
      O => data_out_port_0(6)
    );
\data_out_port_0[7]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(7),
      O => data_out_port_0(7)
    );
\data_out_port_0[8]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(8),
      O => data_out_port_0(8)
    );
\data_out_port_0[9]_INST_0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => control_crossbar(1),
      I1 => data_port_1_after(9),
      O => data_out_port_0(9)
    );
inst: entity work.input_0_arbiter_crossbar_0_0_crossbar
     port map (
      control_crossbar(1 downto 0) => control_crossbar(1 downto 0),
      data_in_port_0(63 downto 0) => data_in_port_0(63 downto 0),
      data_out_port_1(63 downto 0) => data_out_port_1(63 downto 0),
      data_port_1_after(63 downto 0) => data_port_1_after(63 downto 0)
    );
end STRUCTURE;

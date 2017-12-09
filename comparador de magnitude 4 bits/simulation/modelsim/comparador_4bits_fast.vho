-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "11/11/2017 00:15:04"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	comparador_4bits IS
    PORT (
	a : IN std_logic_vector(3 DOWNTO 0);
	b : IN std_logic_vector(3 DOWNTO 0);
	in_gt : IN std_logic;
	in_eq : IN std_logic;
	in_it : IN std_logic;
	out_gt : OUT std_logic;
	out_eq : OUT std_logic;
	out_it : OUT std_logic
	);
END comparador_4bits;

-- Design Ports Information
-- out_gt	=>  Location: PIN_K23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- out_eq	=>  Location: PIN_J25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- out_it	=>  Location: PIN_K26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- a[2]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_eq	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- a[3]	=>  Location: PIN_P9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- b[3]	=>  Location: PIN_R20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- b[2]	=>  Location: PIN_L23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_gt	=>  Location: PIN_K19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- a[1]	=>  Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- a[0]	=>  Location: PIN_R19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- b[0]	=>  Location: PIN_M22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- b[1]	=>  Location: PIN_L20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- in_it	=>  Location: PIN_K24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF comparador_4bits IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_in_gt : std_logic;
SIGNAL ww_in_eq : std_logic;
SIGNAL ww_in_it : std_logic;
SIGNAL ww_out_gt : std_logic;
SIGNAL ww_out_eq : std_logic;
SIGNAL ww_out_it : std_logic;
SIGNAL \comp_3|out_gt~1_combout\ : std_logic;
SIGNAL \in_eq~combout\ : std_logic;
SIGNAL \in_gt~combout\ : std_logic;
SIGNAL \comp_3|out_gt~0_combout\ : std_logic;
SIGNAL \comp_3|out_eq~0_combout\ : std_logic;
SIGNAL \comp_1|out_gt~0_combout\ : std_logic;
SIGNAL \comp_3|out_gt~2_combout\ : std_logic;
SIGNAL \comp_1|out_it~0_combout\ : std_logic;
SIGNAL \comp_3|out_eq~1_combout\ : std_logic;
SIGNAL \comp_3|out_eq~2_combout\ : std_logic;
SIGNAL \comp_3|out_it~1_combout\ : std_logic;
SIGNAL \in_it~combout\ : std_logic;
SIGNAL \comp_3|out_it~0_combout\ : std_logic;
SIGNAL \comp_1|out_it~1_combout\ : std_logic;
SIGNAL \comp_3|out_it~2_combout\ : std_logic;
SIGNAL \b~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \a~combout\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_a <= a;
ww_b <= b;
ww_in_gt <= in_gt;
ww_in_eq <= in_eq;
ww_in_it <= in_it;
out_gt <= ww_out_gt;
out_eq <= ww_out_eq;
out_it <= ww_out_it;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_M22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_b(0),
	combout => \b~combout\(0));

-- Location: PIN_R19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_a(0),
	combout => \a~combout\(0));

-- Location: PIN_B12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_a(1),
	combout => \a~combout\(1));

-- Location: PIN_L20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_b(1),
	combout => \b~combout\(1));

-- Location: LCCOMB_X55_Y25_N14
\comp_3|out_gt~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \comp_3|out_gt~1_combout\ = (\a~combout\(1) & (((!\b~combout\(0) & \a~combout\(0))) # (!\b~combout\(1)))) # (!\a~combout\(1) & (!\b~combout\(0) & (\a~combout\(0) & !\b~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\(0),
	datab => \a~combout\(0),
	datac => \a~combout\(1),
	datad => \b~combout\(1),
	combout => \comp_3|out_gt~1_combout\);

-- Location: PIN_R20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_b(3),
	combout => \b~combout\(3));

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_eq~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_eq,
	combout => \in_eq~combout\);

-- Location: PIN_K19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_gt~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_gt,
	combout => \in_gt~combout\);

-- Location: LCCOMB_X55_Y25_N28
\comp_3|out_gt~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \comp_3|out_gt~0_combout\ = (\in_gt~combout\) # ((\a~combout\(3) & (!\b~combout\(3) & \in_eq~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a~combout\(3),
	datab => \b~combout\(3),
	datac => \in_eq~combout\,
	datad => \in_gt~combout\,
	combout => \comp_3|out_gt~0_combout\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_a(2),
	combout => \a~combout\(2));

-- Location: PIN_L23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\b[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_b(2),
	combout => \b~combout\(2));

-- Location: LCCOMB_X55_Y25_N16
\comp_3|out_eq~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \comp_3|out_eq~0_combout\ = (\comp_1|out_it~0_combout\ & (\a~combout\(2) $ (!\b~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_1|out_it~0_combout\,
	datab => \a~combout\(2),
	datad => \b~combout\(2),
	combout => \comp_3|out_eq~0_combout\);

-- Location: LCCOMB_X55_Y25_N10
\comp_1|out_gt~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \comp_1|out_gt~0_combout\ = (\comp_1|out_it~0_combout\ & (\a~combout\(2) & !\b~combout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_1|out_it~0_combout\,
	datab => \a~combout\(2),
	datad => \b~combout\(2),
	combout => \comp_1|out_gt~0_combout\);

-- Location: LCCOMB_X55_Y25_N18
\comp_3|out_gt~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \comp_3|out_gt~2_combout\ = (\comp_3|out_gt~0_combout\) # ((\comp_1|out_gt~0_combout\) # ((\comp_3|out_gt~1_combout\ & \comp_3|out_eq~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_3|out_gt~1_combout\,
	datab => \comp_3|out_gt~0_combout\,
	datac => \comp_3|out_eq~0_combout\,
	datad => \comp_1|out_gt~0_combout\,
	combout => \comp_3|out_gt~2_combout\);

-- Location: PIN_P9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\a[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_a(3),
	combout => \a~combout\(3));

-- Location: LCCOMB_X55_Y25_N24
\comp_1|out_it~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \comp_1|out_it~0_combout\ = (\in_eq~combout\ & (\b~combout\(3) $ (!\a~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \in_eq~combout\,
	datac => \b~combout\(3),
	datad => \a~combout\(3),
	combout => \comp_1|out_it~0_combout\);

-- Location: LCCOMB_X55_Y25_N20
\comp_3|out_eq~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \comp_3|out_eq~1_combout\ = (\b~combout\(0) & (\a~combout\(0) & (\a~combout\(1) $ (!\b~combout\(1))))) # (!\b~combout\(0) & (!\a~combout\(0) & (\a~combout\(1) $ (!\b~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\(0),
	datab => \a~combout\(0),
	datac => \a~combout\(1),
	datad => \b~combout\(1),
	combout => \comp_3|out_eq~1_combout\);

-- Location: LCCOMB_X55_Y25_N22
\comp_3|out_eq~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \comp_3|out_eq~2_combout\ = (\comp_1|out_it~0_combout\ & (\comp_3|out_eq~1_combout\ & (\a~combout\(2) $ (!\b~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_1|out_it~0_combout\,
	datab => \a~combout\(2),
	datac => \comp_3|out_eq~1_combout\,
	datad => \b~combout\(2),
	combout => \comp_3|out_eq~2_combout\);

-- Location: LCCOMB_X55_Y25_N12
\comp_3|out_it~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \comp_3|out_it~1_combout\ = (\a~combout\(1) & (\b~combout\(0) & (!\a~combout\(0) & \b~combout\(1)))) # (!\a~combout\(1) & ((\b~combout\(1)) # ((\b~combout\(0) & !\a~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b~combout\(0),
	datab => \a~combout\(0),
	datac => \a~combout\(1),
	datad => \b~combout\(1),
	combout => \comp_3|out_it~1_combout\);

-- Location: PIN_K24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\in_it~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_in_it,
	combout => \in_it~combout\);

-- Location: LCCOMB_X55_Y25_N2
\comp_3|out_it~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \comp_3|out_it~0_combout\ = (\in_it~combout\) # ((!\a~combout\(3) & (\b~combout\(3) & \in_eq~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a~combout\(3),
	datab => \b~combout\(3),
	datac => \in_eq~combout\,
	datad => \in_it~combout\,
	combout => \comp_3|out_it~0_combout\);

-- Location: LCCOMB_X55_Y25_N0
\comp_1|out_it~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \comp_1|out_it~1_combout\ = (\comp_1|out_it~0_combout\ & (!\a~combout\(2) & \b~combout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_1|out_it~0_combout\,
	datab => \a~combout\(2),
	datad => \b~combout\(2),
	combout => \comp_1|out_it~1_combout\);

-- Location: LCCOMB_X55_Y25_N6
\comp_3|out_it~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \comp_3|out_it~2_combout\ = (\comp_3|out_it~0_combout\) # ((\comp_1|out_it~1_combout\) # ((\comp_3|out_it~1_combout\ & \comp_3|out_eq~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comp_3|out_it~1_combout\,
	datab => \comp_3|out_it~0_combout\,
	datac => \comp_3|out_eq~0_combout\,
	datad => \comp_1|out_it~1_combout\,
	combout => \comp_3|out_it~2_combout\);

-- Location: PIN_K23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\out_gt~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \comp_3|out_gt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_out_gt);

-- Location: PIN_J25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\out_eq~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \comp_3|out_eq~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_out_eq);

-- Location: PIN_K26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\out_it~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \comp_3|out_it~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_out_it);
END structure;



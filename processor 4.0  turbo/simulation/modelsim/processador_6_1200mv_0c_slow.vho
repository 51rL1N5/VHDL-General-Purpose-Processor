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

-- DATE "12/04/2017 09:50:46"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	FFJK IS
    PORT (
	j : IN std_logic;
	k : IN std_logic;
	clk : IN std_logic;
	clear : IN std_logic;
	set : IN std_logic;
	ld : IN std_logic;
	Q : OUT std_logic;
	Qbar : OUT std_logic
	);
END FFJK;

-- Design Ports Information
-- Q	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Qbar	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- set	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clear	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- j	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ld	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF FFJK IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_j : std_logic;
SIGNAL ww_k : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_clear : std_logic;
SIGNAL ww_set : std_logic;
SIGNAL ww_ld : std_logic;
SIGNAL ww_Q : std_logic;
SIGNAL ww_Qbar : std_logic;
SIGNAL \k~input_o\ : std_logic;
SIGNAL \ld~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \Q~output_o\ : std_logic;
SIGNAL \Qbar~output_o\ : std_logic;
SIGNAL \clear~input_o\ : std_logic;
SIGNAL \set~input_o\ : std_logic;
SIGNAL \aux~1_combout\ : std_logic;
SIGNAL \j~input_o\ : std_logic;
SIGNAL \aux~5_combout\ : std_logic;
SIGNAL \aux~3_combout\ : std_logic;
SIGNAL \aux~0_combout\ : std_logic;
SIGNAL \aux~_emulated_q\ : std_logic;
SIGNAL \aux~2_combout\ : std_logic;
SIGNAL \ALT_INV_aux~0_combout\ : std_logic;
SIGNAL \ALT_INV_aux~2_combout\ : std_logic;

BEGIN

ww_j <= j;
ww_k <= k;
ww_clk <= clk;
ww_clear <= clear;
ww_set <= set;
ww_ld <= ld;
Q <= ww_Q;
Qbar <= ww_Qbar;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_aux~0_combout\ <= NOT \aux~0_combout\;
\ALT_INV_aux~2_combout\ <= NOT \aux~2_combout\;

-- Location: IOIBUF_X22_Y0_N8
\k~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k,
	o => \k~input_o\);

-- Location: IOIBUF_X24_Y0_N1
\ld~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ld,
	o => \ld~input_o\);

-- Location: IOIBUF_X24_Y0_N8
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOOBUF_X20_Y0_N2
\Q~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \aux~2_combout\,
	devoe => ww_devoe,
	o => \Q~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\Qbar~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_aux~2_combout\,
	devoe => ww_devoe,
	o => \Qbar~output_o\);

-- Location: IOIBUF_X26_Y0_N8
\clear~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clear,
	o => \clear~input_o\);

-- Location: IOIBUF_X26_Y0_N1
\set~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_set,
	o => \set~input_o\);

-- Location: LCCOMB_X23_Y1_N24
\aux~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \aux~1_combout\ = (!\clear~input_o\ & ((\set~input_o\) # (\aux~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clear~input_o\,
	datac => \set~input_o\,
	datad => \aux~1_combout\,
	combout => \aux~1_combout\);

-- Location: IOIBUF_X22_Y0_N1
\j~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_j,
	o => \j~input_o\);

-- Location: LCCOMB_X23_Y1_N12
\aux~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \aux~5_combout\ = (\aux~2_combout\ & (!\k~input_o\)) # (!\aux~2_combout\ & ((\j~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k~input_o\,
	datac => \j~input_o\,
	datad => \aux~2_combout\,
	combout => \aux~5_combout\);

-- Location: LCCOMB_X23_Y1_N28
\aux~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \aux~3_combout\ = \aux~1_combout\ $ (((\ld~input_o\ & ((\aux~5_combout\))) # (!\ld~input_o\ & (\aux~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011010011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ld~input_o\,
	datab => \aux~1_combout\,
	datac => \aux~2_combout\,
	datad => \aux~5_combout\,
	combout => \aux~3_combout\);

-- Location: LCCOMB_X23_Y1_N30
\aux~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \aux~0_combout\ = (\clear~input_o\) # (\set~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clear~input_o\,
	datac => \set~input_o\,
	combout => \aux~0_combout\);

-- Location: FF_X23_Y1_N29
\aux~_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \aux~3_combout\,
	clrn => \ALT_INV_aux~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \aux~_emulated_q\);

-- Location: LCCOMB_X23_Y1_N6
\aux~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \aux~2_combout\ = (!\clear~input_o\ & ((\set~input_o\) # (\aux~1_combout\ $ (\aux~_emulated_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clear~input_o\,
	datab => \aux~1_combout\,
	datac => \set~input_o\,
	datad => \aux~_emulated_q\,
	combout => \aux~2_combout\);

ww_Q <= \Q~output_o\;

ww_Qbar <= \Qbar~output_o\;
END structure;



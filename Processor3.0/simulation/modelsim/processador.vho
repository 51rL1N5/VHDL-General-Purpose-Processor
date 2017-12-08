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

-- DATE "12/07/2017 15:08:18"

-- 
-- Device: Altera EP2C5T144C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	dp IS
    PORT (
	SW_I_ACC : IN std_logic_vector(1 DOWNTO 0);
	SW_ALU : IN std_logic_vector(2 DOWNTO 0);
	rst : IN std_logic;
	clk : IN std_logic;
	acc_ld : IN std_logic;
	acc_clr : IN std_logic;
	RF_wr : IN std_logic;
	RF_rd : IN std_logic;
	R_addr : IN std_logic_vector(1 DOWNTO 0);
	W_addr : IN std_logic_vector(1 DOWNTO 0);
	imm : IN std_logic_vector(3 DOWNTO 0);
	output_4 : OUT std_logic_vector(3 DOWNTO 0)
	);
END dp;

-- Design Ports Information
-- rst	=>  Location: PIN_73,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- output_4[0]	=>  Location: PIN_126,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output_4[1]	=>  Location: PIN_60,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output_4[2]	=>  Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- output_4[3]	=>  Location: PIN_129,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- imm[0]	=>  Location: PIN_122,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW_I_ACC[1]	=>  Location: PIN_65,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW_I_ACC[0]	=>  Location: PIN_86,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RF_rd	=>  Location: PIN_79,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- R_addr[0]	=>  Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- R_addr[1]	=>  Location: PIN_121,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW_ALU[1]	=>  Location: PIN_88,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW_ALU[0]	=>  Location: PIN_89,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW_ALU[2]	=>  Location: PIN_90,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- acc_clr	=>  Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- acc_ld	=>  Location: PIN_91,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- imm[1]	=>  Location: PIN_125,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- imm[2]	=>  Location: PIN_87,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- imm[3]	=>  Location: PIN_119,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- W_addr[1]	=>  Location: PIN_64,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- RF_wr	=>  Location: PIN_120,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- W_addr[0]	=>  Location: PIN_118,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF dp IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW_I_ACC : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_SW_ALU : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_rst : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_acc_ld : std_logic;
SIGNAL ww_acc_clr : std_logic;
SIGNAL ww_RF_wr : std_logic;
SIGNAL ww_RF_rd : std_logic;
SIGNAL ww_R_addr : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_W_addr : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_imm : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_output_4 : std_logic_vector(3 DOWNTO 0);
SIGNAL \acc_clr~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Register_File|R0|FF0|aux~regout\ : std_logic;
SIGNAL \ACC_IN|Mux3~0_combout\ : std_logic;
SIGNAL \Register_File|R0|FF2|aux~regout\ : std_logic;
SIGNAL \Register_File|R0|FF3|aux~regout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \ACC_IN|Mux3~1_combout\ : std_logic;
SIGNAL \RF_rd~combout\ : std_logic;
SIGNAL \Register_File|output[0]~0_combout\ : std_logic;
SIGNAL \RF_wr~combout\ : std_logic;
SIGNAL \Register_File|WR_decoder|output~0_combout\ : std_logic;
SIGNAL \Register_File|R2|FF0|aux~regout\ : std_logic;
SIGNAL \Register_File|WR_decoder|output~2_combout\ : std_logic;
SIGNAL \Register_File|R3|FF0|aux~regout\ : std_logic;
SIGNAL \Register_File|R1|FF0|aux~feeder_combout\ : std_logic;
SIGNAL \Register_File|WR_decoder|output~1_combout\ : std_logic;
SIGNAL \Register_File|R1|FF0|aux~regout\ : std_logic;
SIGNAL \Register_File|output[0]~2_combout\ : std_logic;
SIGNAL \Register_File|output[0]~3_combout\ : std_logic;
SIGNAL \ACC_IN|Mux3~2_combout\ : std_logic;
SIGNAL \ACC_IN|Mux3~3_combout\ : std_logic;
SIGNAL \acc_clr~combout\ : std_logic;
SIGNAL \acc_clr~clkctrl_outclk\ : std_logic;
SIGNAL \acc_ld~combout\ : std_logic;
SIGNAL \accumulador|FF0|aux~regout\ : std_logic;
SIGNAL \Register_File|R1|FF1|aux~feeder_combout\ : std_logic;
SIGNAL \Register_File|R1|FF1|aux~regout\ : std_logic;
SIGNAL \Register_File|R0|FF1|aux~regout\ : std_logic;
SIGNAL \Register_File|R3|FF1|aux~regout\ : std_logic;
SIGNAL \Register_File|R2|FF1|aux~regout\ : std_logic;
SIGNAL \Register_File|output[1]~4_combout\ : std_logic;
SIGNAL \Register_File|output[1]~5_combout\ : std_logic;
SIGNAL \accumulador|FF1|aux~0_combout\ : std_logic;
SIGNAL \ACC_IN|Mux2~4_combout\ : std_logic;
SIGNAL \ACC_IN|Mux2~5_combout\ : std_logic;
SIGNAL \ACC_IN|Mux2~0_combout\ : std_logic;
SIGNAL \ACC_IN|Mux2~1_combout\ : std_logic;
SIGNAL \ACC_IN|Mux2~2_combout\ : std_logic;
SIGNAL \ACC_IN|Mux2~3_combout\ : std_logic;
SIGNAL \accumulador|FF1|aux~regout\ : std_logic;
SIGNAL \Register_File|R2|FF2|aux~regout\ : std_logic;
SIGNAL \Register_File|R3|FF2|aux~regout\ : std_logic;
SIGNAL \Register_File|R1|FF2|aux~feeder_combout\ : std_logic;
SIGNAL \Register_File|R1|FF2|aux~regout\ : std_logic;
SIGNAL \Register_File|output[2]~6_combout\ : std_logic;
SIGNAL \Register_File|output[2]~7_combout\ : std_logic;
SIGNAL \ACC_IN|Mux1~1_combout\ : std_logic;
SIGNAL \alu1|subtrc|Add0|FA1|carry~0_combout\ : std_logic;
SIGNAL \alu1|adder|FA1|carry~0_combout\ : std_logic;
SIGNAL \ACC_IN|Mux1~4_combout\ : std_logic;
SIGNAL \ACC_IN|Mux1~5_combout\ : std_logic;
SIGNAL \ACC_IN|Mux1~0_combout\ : std_logic;
SIGNAL \ACC_IN|Mux1~2_combout\ : std_logic;
SIGNAL \ACC_IN|Mux1~3_combout\ : std_logic;
SIGNAL \accumulador|FF2|aux~regout\ : std_logic;
SIGNAL \Register_File|output[0]~1_combout\ : std_logic;
SIGNAL \Register_File|R1|FF3|aux~regout\ : std_logic;
SIGNAL \Register_File|R3|FF3|aux~regout\ : std_logic;
SIGNAL \Register_File|R2|FF3|aux~regout\ : std_logic;
SIGNAL \Register_File|output[3]~8_combout\ : std_logic;
SIGNAL \Register_File|output[3]~9_combout\ : std_logic;
SIGNAL \ACC_IN|Mux0~3_combout\ : std_logic;
SIGNAL \ACC_IN|Mux0~1_combout\ : std_logic;
SIGNAL \ACC_IN|Mux0~0_combout\ : std_logic;
SIGNAL \ACC_IN|Mux0~6_combout\ : std_logic;
SIGNAL \ACC_IN|Mux0~7_combout\ : std_logic;
SIGNAL \ACC_IN|Mux0~2_combout\ : std_logic;
SIGNAL \ACC_IN|Mux0~4_combout\ : std_logic;
SIGNAL \ACC_IN|Mux0~5_combout\ : std_logic;
SIGNAL \accumulador|FF3|aux~regout\ : std_logic;
SIGNAL \Register_File|WR_decoder|output\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \SW_ALU~combout\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \R_addr~combout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \SW_I_ACC~combout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \W_addr~combout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \imm~combout\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_SW_I_ACC <= SW_I_ACC;
ww_SW_ALU <= SW_ALU;
ww_rst <= rst;
ww_clk <= clk;
ww_acc_ld <= acc_ld;
ww_acc_clr <= acc_clr;
ww_RF_wr <= RF_wr;
ww_RF_rd <= RF_rd;
ww_R_addr <= R_addr;
ww_W_addr <= W_addr;
ww_imm <= imm;
output_4 <= ww_output_4;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\acc_clr~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \acc_clr~combout\);

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

-- Location: LCFF_X17_Y7_N11
\Register_File|R0|FF0|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \accumulador|FF0|aux~regout\,
	sload => VCC,
	ena => \Register_File|WR_decoder|output\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R0|FF0|aux~regout\);

-- Location: LCCOMB_X18_Y7_N20
\ACC_IN|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux3~0_combout\ = (\SW_ALU~combout\(0) & (\accumulador|FF0|aux~regout\ & ((\SW_ALU~combout\(2)) # (!\SW_ALU~combout\(1))))) # (!\SW_ALU~combout\(0) & (\accumulador|FF0|aux~regout\ $ (((\SW_ALU~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_ALU~combout\(0),
	datab => \accumulador|FF0|aux~regout\,
	datac => \SW_ALU~combout\(2),
	datad => \SW_ALU~combout\(1),
	combout => \ACC_IN|Mux3~0_combout\);

-- Location: LCFF_X17_Y7_N5
\Register_File|R0|FF2|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \accumulador|FF2|aux~regout\,
	sload => VCC,
	ena => \Register_File|WR_decoder|output\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R0|FF2|aux~regout\);

-- Location: LCFF_X17_Y7_N21
\Register_File|R0|FF3|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \accumulador|FF3|aux~regout\,
	sload => VCC,
	ena => \Register_File|WR_decoder|output\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R0|FF3|aux~regout\);

-- Location: PIN_89,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW_ALU[0]~I\ : cycloneii_io
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
	padio => ww_SW_ALU(0),
	combout => \SW_ALU~combout\(0));

-- Location: PIN_87,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\imm[2]~I\ : cycloneii_io
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
	padio => ww_imm(2),
	combout => \imm~combout\(2));

-- Location: PIN_119,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\imm[3]~I\ : cycloneii_io
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
	padio => ww_imm(3),
	combout => \imm~combout\(3));

-- Location: PIN_17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
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
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G2
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: PIN_90,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW_ALU[2]~I\ : cycloneii_io
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
	padio => ww_SW_ALU(2),
	combout => \SW_ALU~combout\(2));

-- Location: PIN_88,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW_ALU[1]~I\ : cycloneii_io
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
	padio => ww_SW_ALU(1),
	combout => \SW_ALU~combout\(1));

-- Location: LCCOMB_X18_Y7_N18
\ACC_IN|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux3~1_combout\ = (\accumulador|FF0|aux~regout\ & ((\SW_ALU~combout\(0)) # ((!\SW_ALU~combout\(2) & !\SW_ALU~combout\(1))))) # (!\accumulador|FF0|aux~regout\ & (\SW_ALU~combout\(2) & ((\SW_ALU~combout\(1)) # (!\SW_ALU~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_ALU~combout\(0),
	datab => \accumulador|FF0|aux~regout\,
	datac => \SW_ALU~combout\(2),
	datad => \SW_ALU~combout\(1),
	combout => \ACC_IN|Mux3~1_combout\);

-- Location: PIN_86,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW_I_ACC[0]~I\ : cycloneii_io
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
	padio => ww_SW_I_ACC(0),
	combout => \SW_I_ACC~combout\(0));

-- Location: PIN_79,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RF_rd~I\ : cycloneii_io
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
	padio => ww_RF_rd,
	combout => \RF_rd~combout\);

-- Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\R_addr[0]~I\ : cycloneii_io
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
	padio => ww_R_addr(0),
	combout => \R_addr~combout\(0));

-- Location: LCCOMB_X19_Y7_N20
\Register_File|output[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|output[0]~0_combout\ = (\RF_rd~combout\ & !\R_addr~combout\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RF_rd~combout\,
	datad => \R_addr~combout\(0),
	combout => \Register_File|output[0]~0_combout\);

-- Location: PIN_64,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\W_addr[1]~I\ : cycloneii_io
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
	padio => ww_W_addr(1),
	combout => \W_addr~combout\(1));

-- Location: PIN_120,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\RF_wr~I\ : cycloneii_io
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
	padio => ww_RF_wr,
	combout => \RF_wr~combout\);

-- Location: PIN_118,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\W_addr[0]~I\ : cycloneii_io
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
	padio => ww_W_addr(0),
	combout => \W_addr~combout\(0));

-- Location: LCCOMB_X19_Y7_N16
\Register_File|WR_decoder|output~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|WR_decoder|output~0_combout\ = (\W_addr~combout\(1) & (\RF_wr~combout\ & !\W_addr~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \W_addr~combout\(1),
	datac => \RF_wr~combout\,
	datad => \W_addr~combout\(0),
	combout => \Register_File|WR_decoder|output~0_combout\);

-- Location: LCFF_X18_Y7_N29
\Register_File|R2|FF0|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \accumulador|FF0|aux~regout\,
	sload => VCC,
	ena => \Register_File|WR_decoder|output~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R2|FF0|aux~regout\);

-- Location: LCCOMB_X19_Y7_N8
\Register_File|WR_decoder|output~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|WR_decoder|output~2_combout\ = (\W_addr~combout\(1) & (\RF_wr~combout\ & \W_addr~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \W_addr~combout\(1),
	datac => \RF_wr~combout\,
	datad => \W_addr~combout\(0),
	combout => \Register_File|WR_decoder|output~2_combout\);

-- Location: LCFF_X18_Y7_N23
\Register_File|R3|FF0|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \accumulador|FF0|aux~regout\,
	sload => VCC,
	ena => \Register_File|WR_decoder|output~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R3|FF0|aux~regout\);

-- Location: LCCOMB_X19_Y7_N30
\Register_File|R1|FF0|aux~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|R1|FF0|aux~feeder_combout\ = \accumulador|FF0|aux~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \accumulador|FF0|aux~regout\,
	combout => \Register_File|R1|FF0|aux~feeder_combout\);

-- Location: LCCOMB_X19_Y7_N14
\Register_File|WR_decoder|output~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|WR_decoder|output~1_combout\ = (!\W_addr~combout\(1) & (\RF_wr~combout\ & \W_addr~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \W_addr~combout\(1),
	datac => \RF_wr~combout\,
	datad => \W_addr~combout\(0),
	combout => \Register_File|WR_decoder|output~1_combout\);

-- Location: LCFF_X19_Y7_N31
\Register_File|R1|FF0|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Register_File|R1|FF0|aux~feeder_combout\,
	ena => \Register_File|WR_decoder|output~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R1|FF0|aux~regout\);

-- Location: LCCOMB_X18_Y7_N22
\Register_File|output[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|output[0]~2_combout\ = (\Register_File|output[0]~1_combout\ & ((\Register_File|output[0]~0_combout\) # ((\Register_File|R1|FF0|aux~regout\)))) # (!\Register_File|output[0]~1_combout\ & (!\Register_File|output[0]~0_combout\ & 
-- (\Register_File|R3|FF0|aux~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Register_File|output[0]~1_combout\,
	datab => \Register_File|output[0]~0_combout\,
	datac => \Register_File|R3|FF0|aux~regout\,
	datad => \Register_File|R1|FF0|aux~regout\,
	combout => \Register_File|output[0]~2_combout\);

-- Location: LCCOMB_X18_Y7_N28
\Register_File|output[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|output[0]~3_combout\ = (\Register_File|output[0]~0_combout\ & ((\Register_File|output[0]~2_combout\ & (\Register_File|R0|FF0|aux~regout\)) # (!\Register_File|output[0]~2_combout\ & ((\Register_File|R2|FF0|aux~regout\))))) # 
-- (!\Register_File|output[0]~0_combout\ & (((\Register_File|output[0]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Register_File|R0|FF0|aux~regout\,
	datab => \Register_File|output[0]~0_combout\,
	datac => \Register_File|R2|FF0|aux~regout\,
	datad => \Register_File|output[0]~2_combout\,
	combout => \Register_File|output[0]~3_combout\);

-- Location: LCCOMB_X18_Y7_N16
\ACC_IN|Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux3~2_combout\ = (\SW_I_ACC~combout\(0) & (((\Register_File|output[0]~3_combout\)))) # (!\SW_I_ACC~combout\(0) & ((\Register_File|output[0]~3_combout\ & (!\ACC_IN|Mux3~0_combout\)) # (!\Register_File|output[0]~3_combout\ & 
-- ((\ACC_IN|Mux3~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ACC_IN|Mux3~0_combout\,
	datab => \ACC_IN|Mux3~1_combout\,
	datac => \SW_I_ACC~combout\(0),
	datad => \Register_File|output[0]~3_combout\,
	combout => \ACC_IN|Mux3~2_combout\);

-- Location: PIN_122,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\imm[0]~I\ : cycloneii_io
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
	padio => ww_imm(0),
	combout => \imm~combout\(0));

-- Location: LCCOMB_X19_Y7_N12
\ACC_IN|Mux3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux3~3_combout\ = (\SW_I_ACC~combout\(1) & (\ACC_IN|Mux3~2_combout\ & (!\SW_I_ACC~combout\(0)))) # (!\SW_I_ACC~combout\(1) & ((\SW_I_ACC~combout\(0) & (\ACC_IN|Mux3~2_combout\)) # (!\SW_I_ACC~combout\(0) & ((\imm~combout\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_I_ACC~combout\(1),
	datab => \ACC_IN|Mux3~2_combout\,
	datac => \SW_I_ACC~combout\(0),
	datad => \imm~combout\(0),
	combout => \ACC_IN|Mux3~3_combout\);

-- Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\acc_clr~I\ : cycloneii_io
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
	padio => ww_acc_clr,
	combout => \acc_clr~combout\);

-- Location: CLKCTRL_G1
\acc_clr~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \acc_clr~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \acc_clr~clkctrl_outclk\);

-- Location: PIN_91,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\acc_ld~I\ : cycloneii_io
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
	padio => ww_acc_ld,
	combout => \acc_ld~combout\);

-- Location: LCFF_X19_Y7_N13
\accumulador|FF0|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ACC_IN|Mux3~3_combout\,
	aclr => \acc_clr~clkctrl_outclk\,
	ena => \acc_ld~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \accumulador|FF0|aux~regout\);

-- Location: LCCOMB_X19_Y7_N22
\Register_File|R1|FF1|aux~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|R1|FF1|aux~feeder_combout\ = \accumulador|FF1|aux~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \accumulador|FF1|aux~regout\,
	combout => \Register_File|R1|FF1|aux~feeder_combout\);

-- Location: LCFF_X19_Y7_N23
\Register_File|R1|FF1|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Register_File|R1|FF1|aux~feeder_combout\,
	ena => \Register_File|WR_decoder|output~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R1|FF1|aux~regout\);

-- Location: LCCOMB_X19_Y7_N10
\Register_File|WR_decoder|output[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|WR_decoder|output\(0) = (!\W_addr~combout\(1) & (\RF_wr~combout\ & !\W_addr~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \W_addr~combout\(1),
	datac => \RF_wr~combout\,
	datad => \W_addr~combout\(0),
	combout => \Register_File|WR_decoder|output\(0));

-- Location: LCFF_X17_Y7_N17
\Register_File|R0|FF1|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \accumulador|FF1|aux~regout\,
	sload => VCC,
	ena => \Register_File|WR_decoder|output\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R0|FF1|aux~regout\);

-- Location: LCFF_X18_Y7_N25
\Register_File|R3|FF1|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \accumulador|FF1|aux~regout\,
	sload => VCC,
	ena => \Register_File|WR_decoder|output~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R3|FF1|aux~regout\);

-- Location: LCFF_X18_Y7_N7
\Register_File|R2|FF1|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \accumulador|FF1|aux~regout\,
	sload => VCC,
	ena => \Register_File|WR_decoder|output~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R2|FF1|aux~regout\);

-- Location: LCCOMB_X18_Y7_N24
\Register_File|output[1]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|output[1]~4_combout\ = (\Register_File|output[0]~1_combout\ & (\Register_File|output[0]~0_combout\)) # (!\Register_File|output[0]~1_combout\ & ((\Register_File|output[0]~0_combout\ & ((\Register_File|R2|FF1|aux~regout\))) # 
-- (!\Register_File|output[0]~0_combout\ & (\Register_File|R3|FF1|aux~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Register_File|output[0]~1_combout\,
	datab => \Register_File|output[0]~0_combout\,
	datac => \Register_File|R3|FF1|aux~regout\,
	datad => \Register_File|R2|FF1|aux~regout\,
	combout => \Register_File|output[1]~4_combout\);

-- Location: LCCOMB_X17_Y7_N16
\Register_File|output[1]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|output[1]~5_combout\ = (\Register_File|output[0]~1_combout\ & ((\Register_File|output[1]~4_combout\ & ((\Register_File|R0|FF1|aux~regout\))) # (!\Register_File|output[1]~4_combout\ & (\Register_File|R1|FF1|aux~regout\)))) # 
-- (!\Register_File|output[0]~1_combout\ & (((\Register_File|output[1]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Register_File|output[0]~1_combout\,
	datab => \Register_File|R1|FF1|aux~regout\,
	datac => \Register_File|R0|FF1|aux~regout\,
	datad => \Register_File|output[1]~4_combout\,
	combout => \Register_File|output[1]~5_combout\);

-- Location: PIN_125,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\imm[1]~I\ : cycloneii_io
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
	padio => ww_imm(1),
	combout => \imm~combout\(1));

-- Location: LCCOMB_X18_Y7_N30
\accumulador|FF1|aux~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \accumulador|FF1|aux~0_combout\ = (\SW_I_ACC~combout\(1) & (\SW_ALU~combout\(2))) # (!\SW_I_ACC~combout\(1) & ((\SW_I_ACC~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_I_ACC~combout\(1),
	datab => \SW_ALU~combout\(2),
	datac => \SW_I_ACC~combout\(0),
	combout => \accumulador|FF1|aux~0_combout\);

-- Location: LCCOMB_X18_Y7_N8
\ACC_IN|Mux2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux2~4_combout\ = (\SW_ALU~combout\(1) & (\SW_ALU~combout\(0))) # (!\SW_ALU~combout\(1) & (\Register_File|output[0]~3_combout\ & (\SW_ALU~combout\(0) $ (\accumulador|FF0|aux~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_ALU~combout\(0),
	datab => \SW_ALU~combout\(1),
	datac => \accumulador|FF0|aux~regout\,
	datad => \Register_File|output[0]~3_combout\,
	combout => \ACC_IN|Mux2~4_combout\);

-- Location: LCCOMB_X18_Y7_N26
\ACC_IN|Mux2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux2~5_combout\ = (\SW_ALU~combout\(1) & ((\accumulador|FF1|aux~regout\ & ((\ACC_IN|Mux2~4_combout\) # (\Register_File|output[1]~5_combout\))) # (!\accumulador|FF1|aux~regout\ & (\ACC_IN|Mux2~4_combout\ & \Register_File|output[1]~5_combout\)))) # 
-- (!\SW_ALU~combout\(1) & (\accumulador|FF1|aux~regout\ $ (\ACC_IN|Mux2~4_combout\ $ (\Register_File|output[1]~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulador|FF1|aux~regout\,
	datab => \SW_ALU~combout\(1),
	datac => \ACC_IN|Mux2~4_combout\,
	datad => \Register_File|output[1]~5_combout\,
	combout => \ACC_IN|Mux2~5_combout\);

-- Location: LCCOMB_X18_Y7_N4
\ACC_IN|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux2~0_combout\ = (\SW_I_ACC~combout\(1) & (((\accumulador|FF1|aux~0_combout\) # (\ACC_IN|Mux2~5_combout\)))) # (!\SW_I_ACC~combout\(1) & (\imm~combout\(1) & (!\accumulador|FF1|aux~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_I_ACC~combout\(1),
	datab => \imm~combout\(1),
	datac => \accumulador|FF1|aux~0_combout\,
	datad => \ACC_IN|Mux2~5_combout\,
	combout => \ACC_IN|Mux2~0_combout\);

-- Location: LCCOMB_X18_Y7_N2
\ACC_IN|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux2~1_combout\ = (\SW_ALU~combout\(0) & ((\accumulador|FF1|aux~regout\ & ((!\Register_File|output[1]~5_combout\))) # (!\accumulador|FF1|aux~regout\ & ((\SW_ALU~combout\(1)) # (\Register_File|output[1]~5_combout\))))) # (!\SW_ALU~combout\(0) & 
-- (\accumulador|FF1|aux~regout\ $ (((!\Register_File|output[1]~5_combout\) # (!\SW_ALU~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101110101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_ALU~combout\(0),
	datab => \SW_ALU~combout\(1),
	datac => \accumulador|FF1|aux~regout\,
	datad => \Register_File|output[1]~5_combout\,
	combout => \ACC_IN|Mux2~1_combout\);

-- Location: LCCOMB_X18_Y7_N12
\ACC_IN|Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux2~2_combout\ = (\accumulador|FF1|aux~0_combout\ & ((\ACC_IN|Mux2~0_combout\ & ((\ACC_IN|Mux2~1_combout\))) # (!\ACC_IN|Mux2~0_combout\ & (\Register_File|output[1]~5_combout\)))) # (!\accumulador|FF1|aux~0_combout\ & 
-- (((\ACC_IN|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulador|FF1|aux~0_combout\,
	datab => \Register_File|output[1]~5_combout\,
	datac => \ACC_IN|Mux2~0_combout\,
	datad => \ACC_IN|Mux2~1_combout\,
	combout => \ACC_IN|Mux2~2_combout\);

-- Location: LCCOMB_X19_Y7_N26
\ACC_IN|Mux2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux2~3_combout\ = (\ACC_IN|Mux2~2_combout\ & ((!\SW_I_ACC~combout\(0)) # (!\SW_I_ACC~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_I_ACC~combout\(1),
	datac => \SW_I_ACC~combout\(0),
	datad => \ACC_IN|Mux2~2_combout\,
	combout => \ACC_IN|Mux2~3_combout\);

-- Location: LCFF_X19_Y7_N27
\accumulador|FF1|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ACC_IN|Mux2~3_combout\,
	aclr => \acc_clr~clkctrl_outclk\,
	ena => \acc_ld~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \accumulador|FF1|aux~regout\);

-- Location: PIN_65,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW_I_ACC[1]~I\ : cycloneii_io
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
	padio => ww_SW_I_ACC(1),
	combout => \SW_I_ACC~combout\(1));

-- Location: LCFF_X18_Y7_N11
\Register_File|R2|FF2|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \accumulador|FF2|aux~regout\,
	sload => VCC,
	ena => \Register_File|WR_decoder|output~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R2|FF2|aux~regout\);

-- Location: LCFF_X18_Y7_N1
\Register_File|R3|FF2|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \accumulador|FF2|aux~regout\,
	sload => VCC,
	ena => \Register_File|WR_decoder|output~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R3|FF2|aux~regout\);

-- Location: LCCOMB_X19_Y7_N28
\Register_File|R1|FF2|aux~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|R1|FF2|aux~feeder_combout\ = \accumulador|FF2|aux~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \accumulador|FF2|aux~regout\,
	combout => \Register_File|R1|FF2|aux~feeder_combout\);

-- Location: LCFF_X19_Y7_N29
\Register_File|R1|FF2|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \Register_File|R1|FF2|aux~feeder_combout\,
	ena => \Register_File|WR_decoder|output~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R1|FF2|aux~regout\);

-- Location: LCCOMB_X18_Y7_N0
\Register_File|output[2]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|output[2]~6_combout\ = (\Register_File|output[0]~1_combout\ & ((\Register_File|output[0]~0_combout\) # ((\Register_File|R1|FF2|aux~regout\)))) # (!\Register_File|output[0]~1_combout\ & (!\Register_File|output[0]~0_combout\ & 
-- (\Register_File|R3|FF2|aux~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Register_File|output[0]~1_combout\,
	datab => \Register_File|output[0]~0_combout\,
	datac => \Register_File|R3|FF2|aux~regout\,
	datad => \Register_File|R1|FF2|aux~regout\,
	combout => \Register_File|output[2]~6_combout\);

-- Location: LCCOMB_X18_Y7_N10
\Register_File|output[2]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|output[2]~7_combout\ = (\Register_File|output[0]~0_combout\ & ((\Register_File|output[2]~6_combout\ & (\Register_File|R0|FF2|aux~regout\)) # (!\Register_File|output[2]~6_combout\ & ((\Register_File|R2|FF2|aux~regout\))))) # 
-- (!\Register_File|output[0]~0_combout\ & (((\Register_File|output[2]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Register_File|R0|FF2|aux~regout\,
	datab => \Register_File|output[0]~0_combout\,
	datac => \Register_File|R2|FF2|aux~regout\,
	datad => \Register_File|output[2]~6_combout\,
	combout => \Register_File|output[2]~7_combout\);

-- Location: LCCOMB_X18_Y7_N14
\ACC_IN|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux1~1_combout\ = (\SW_ALU~combout\(0) & ((\accumulador|FF2|aux~regout\ & ((!\Register_File|output[2]~7_combout\))) # (!\accumulador|FF2|aux~regout\ & ((\SW_ALU~combout\(1)) # (\Register_File|output[2]~7_combout\))))) # (!\SW_ALU~combout\(0) & 
-- (\accumulador|FF2|aux~regout\ $ (((!\Register_File|output[2]~7_combout\) # (!\SW_ALU~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001110111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_ALU~combout\(0),
	datab => \accumulador|FF2|aux~regout\,
	datac => \SW_ALU~combout\(1),
	datad => \Register_File|output[2]~7_combout\,
	combout => \ACC_IN|Mux1~1_combout\);

-- Location: LCCOMB_X17_Y7_N30
\alu1|subtrc|Add0|FA1|carry~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \alu1|subtrc|Add0|FA1|carry~0_combout\ = (\accumulador|FF1|aux~regout\ & ((\accumulador|FF0|aux~regout\) # ((!\Register_File|output[0]~3_combout\) # (!\Register_File|output[1]~5_combout\)))) # (!\accumulador|FF1|aux~regout\ & 
-- (!\Register_File|output[1]~5_combout\ & ((\accumulador|FF0|aux~regout\) # (!\Register_File|output[0]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulador|FF1|aux~regout\,
	datab => \accumulador|FF0|aux~regout\,
	datac => \Register_File|output[1]~5_combout\,
	datad => \Register_File|output[0]~3_combout\,
	combout => \alu1|subtrc|Add0|FA1|carry~0_combout\);

-- Location: LCCOMB_X17_Y7_N10
\alu1|adder|FA1|carry~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \alu1|adder|FA1|carry~0_combout\ = (\Register_File|output[1]~5_combout\ & ((\accumulador|FF1|aux~regout\) # ((\accumulador|FF0|aux~regout\ & \Register_File|output[0]~3_combout\)))) # (!\Register_File|output[1]~5_combout\ & (\accumulador|FF1|aux~regout\ & 
-- (\accumulador|FF0|aux~regout\ & \Register_File|output[0]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Register_File|output[1]~5_combout\,
	datab => \accumulador|FF1|aux~regout\,
	datac => \accumulador|FF0|aux~regout\,
	datad => \Register_File|output[0]~3_combout\,
	combout => \alu1|adder|FA1|carry~0_combout\);

-- Location: LCCOMB_X17_Y7_N14
\ACC_IN|Mux1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux1~4_combout\ = (\SW_ALU~combout\(0) & (((\SW_ALU~combout\(1))) # (!\alu1|subtrc|Add0|FA1|carry~0_combout\))) # (!\SW_ALU~combout\(0) & (((!\SW_ALU~combout\(1) & \alu1|adder|FA1|carry~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011110100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_ALU~combout\(0),
	datab => \alu1|subtrc|Add0|FA1|carry~0_combout\,
	datac => \SW_ALU~combout\(1),
	datad => \alu1|adder|FA1|carry~0_combout\,
	combout => \ACC_IN|Mux1~4_combout\);

-- Location: LCCOMB_X17_Y7_N28
\ACC_IN|Mux1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux1~5_combout\ = (\SW_ALU~combout\(1) & ((\accumulador|FF2|aux~regout\ & ((\Register_File|output[2]~7_combout\) # (\ACC_IN|Mux1~4_combout\))) # (!\accumulador|FF2|aux~regout\ & (\Register_File|output[2]~7_combout\ & \ACC_IN|Mux1~4_combout\)))) # 
-- (!\SW_ALU~combout\(1) & (\accumulador|FF2|aux~regout\ $ (\Register_File|output[2]~7_combout\ $ (\ACC_IN|Mux1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulador|FF2|aux~regout\,
	datab => \Register_File|output[2]~7_combout\,
	datac => \ACC_IN|Mux1~4_combout\,
	datad => \SW_ALU~combout\(1),
	combout => \ACC_IN|Mux1~5_combout\);

-- Location: LCCOMB_X17_Y7_N8
\ACC_IN|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux1~0_combout\ = (\accumulador|FF1|aux~0_combout\ & (((\SW_I_ACC~combout\(1))))) # (!\accumulador|FF1|aux~0_combout\ & ((\SW_I_ACC~combout\(1) & ((\ACC_IN|Mux1~5_combout\))) # (!\SW_I_ACC~combout\(1) & (\imm~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \imm~combout\(2),
	datab => \accumulador|FF1|aux~0_combout\,
	datac => \SW_I_ACC~combout\(1),
	datad => \ACC_IN|Mux1~5_combout\,
	combout => \ACC_IN|Mux1~0_combout\);

-- Location: LCCOMB_X17_Y7_N26
\ACC_IN|Mux1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux1~2_combout\ = (\ACC_IN|Mux1~0_combout\ & (((\ACC_IN|Mux1~1_combout\) # (!\accumulador|FF1|aux~0_combout\)))) # (!\ACC_IN|Mux1~0_combout\ & (\Register_File|output[2]~7_combout\ & ((\accumulador|FF1|aux~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Register_File|output[2]~7_combout\,
	datab => \ACC_IN|Mux1~1_combout\,
	datac => \ACC_IN|Mux1~0_combout\,
	datad => \accumulador|FF1|aux~0_combout\,
	combout => \ACC_IN|Mux1~2_combout\);

-- Location: LCCOMB_X17_Y7_N24
\ACC_IN|Mux1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux1~3_combout\ = (\ACC_IN|Mux1~2_combout\ & ((!\SW_I_ACC~combout\(1)) # (!\SW_I_ACC~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW_I_ACC~combout\(0),
	datac => \SW_I_ACC~combout\(1),
	datad => \ACC_IN|Mux1~2_combout\,
	combout => \ACC_IN|Mux1~3_combout\);

-- Location: LCFF_X17_Y7_N25
\accumulador|FF2|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ACC_IN|Mux1~3_combout\,
	aclr => \acc_clr~clkctrl_outclk\,
	ena => \acc_ld~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \accumulador|FF2|aux~regout\);

-- Location: PIN_121,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\R_addr[1]~I\ : cycloneii_io
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
	padio => ww_R_addr(1),
	combout => \R_addr~combout\(1));

-- Location: LCCOMB_X19_Y7_N4
\Register_File|output[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|output[0]~1_combout\ = (\RF_rd~combout\ & !\R_addr~combout\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RF_rd~combout\,
	datad => \R_addr~combout\(1),
	combout => \Register_File|output[0]~1_combout\);

-- Location: LCFF_X19_Y7_N3
\Register_File|R1|FF3|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \accumulador|FF3|aux~regout\,
	sload => VCC,
	ena => \Register_File|WR_decoder|output~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R1|FF3|aux~regout\);

-- Location: LCFF_X20_Y7_N31
\Register_File|R3|FF3|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \accumulador|FF3|aux~regout\,
	sload => VCC,
	ena => \Register_File|WR_decoder|output~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R3|FF3|aux~regout\);

-- Location: LCFF_X20_Y7_N1
\Register_File|R2|FF3|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \accumulador|FF3|aux~regout\,
	sload => VCC,
	ena => \Register_File|WR_decoder|output~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Register_File|R2|FF3|aux~regout\);

-- Location: LCCOMB_X20_Y7_N30
\Register_File|output[3]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|output[3]~8_combout\ = (\Register_File|output[0]~0_combout\ & ((\Register_File|output[0]~1_combout\) # ((\Register_File|R2|FF3|aux~regout\)))) # (!\Register_File|output[0]~0_combout\ & (!\Register_File|output[0]~1_combout\ & 
-- (\Register_File|R3|FF3|aux~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Register_File|output[0]~0_combout\,
	datab => \Register_File|output[0]~1_combout\,
	datac => \Register_File|R3|FF3|aux~regout\,
	datad => \Register_File|R2|FF3|aux~regout\,
	combout => \Register_File|output[3]~8_combout\);

-- Location: LCCOMB_X19_Y7_N2
\Register_File|output[3]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \Register_File|output[3]~9_combout\ = (\Register_File|output[0]~1_combout\ & ((\Register_File|output[3]~8_combout\ & (\Register_File|R0|FF3|aux~regout\)) # (!\Register_File|output[3]~8_combout\ & ((\Register_File|R1|FF3|aux~regout\))))) # 
-- (!\Register_File|output[0]~1_combout\ & (((\Register_File|output[3]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Register_File|R0|FF3|aux~regout\,
	datab => \Register_File|output[0]~1_combout\,
	datac => \Register_File|R1|FF3|aux~regout\,
	datad => \Register_File|output[3]~8_combout\,
	combout => \Register_File|output[3]~9_combout\);

-- Location: LCCOMB_X17_Y7_N20
\ACC_IN|Mux0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux0~3_combout\ = (\SW_ALU~combout\(0) & ((\accumulador|FF3|aux~regout\ & ((!\Register_File|output[3]~9_combout\))) # (!\accumulador|FF3|aux~regout\ & ((\SW_ALU~combout\(1)) # (\Register_File|output[3]~9_combout\))))) # (!\SW_ALU~combout\(0) & 
-- (\accumulador|FF3|aux~regout\ $ (((!\Register_File|output[3]~9_combout\) # (!\SW_ALU~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101110101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_ALU~combout\(0),
	datab => \SW_ALU~combout\(1),
	datac => \accumulador|FF3|aux~regout\,
	datad => \Register_File|output[3]~9_combout\,
	combout => \ACC_IN|Mux0~3_combout\);

-- Location: LCCOMB_X17_Y7_N4
\ACC_IN|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux0~1_combout\ = (\accumulador|FF2|aux~regout\ & ((\alu1|subtrc|Add0|FA1|carry~0_combout\) # (!\Register_File|output[2]~7_combout\))) # (!\accumulador|FF2|aux~regout\ & (!\Register_File|output[2]~7_combout\ & 
-- \alu1|subtrc|Add0|FA1|carry~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulador|FF2|aux~regout\,
	datab => \Register_File|output[2]~7_combout\,
	datad => \alu1|subtrc|Add0|FA1|carry~0_combout\,
	combout => \ACC_IN|Mux0~1_combout\);

-- Location: LCCOMB_X17_Y7_N2
\ACC_IN|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux0~0_combout\ = (\accumulador|FF2|aux~regout\ & ((\Register_File|output[2]~7_combout\) # (\alu1|adder|FA1|carry~0_combout\))) # (!\accumulador|FF2|aux~regout\ & (\Register_File|output[2]~7_combout\ & \alu1|adder|FA1|carry~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \accumulador|FF2|aux~regout\,
	datac => \Register_File|output[2]~7_combout\,
	datad => \alu1|adder|FA1|carry~0_combout\,
	combout => \ACC_IN|Mux0~0_combout\);

-- Location: LCCOMB_X17_Y7_N6
\ACC_IN|Mux0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux0~6_combout\ = (\SW_ALU~combout\(0) & ((\SW_ALU~combout\(1)) # ((!\ACC_IN|Mux0~1_combout\)))) # (!\SW_ALU~combout\(0) & (!\SW_ALU~combout\(1) & ((\ACC_IN|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101110001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW_ALU~combout\(0),
	datab => \SW_ALU~combout\(1),
	datac => \ACC_IN|Mux0~1_combout\,
	datad => \ACC_IN|Mux0~0_combout\,
	combout => \ACC_IN|Mux0~6_combout\);

-- Location: LCCOMB_X17_Y7_N12
\ACC_IN|Mux0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux0~7_combout\ = (\SW_ALU~combout\(1) & ((\Register_File|output[3]~9_combout\ & ((\accumulador|FF3|aux~regout\) # (\ACC_IN|Mux0~6_combout\))) # (!\Register_File|output[3]~9_combout\ & (\accumulador|FF3|aux~regout\ & \ACC_IN|Mux0~6_combout\)))) # 
-- (!\SW_ALU~combout\(1) & (\Register_File|output[3]~9_combout\ $ (\accumulador|FF3|aux~regout\ $ (\ACC_IN|Mux0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100110010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Register_File|output[3]~9_combout\,
	datab => \SW_ALU~combout\(1),
	datac => \accumulador|FF3|aux~regout\,
	datad => \ACC_IN|Mux0~6_combout\,
	combout => \ACC_IN|Mux0~7_combout\);

-- Location: LCCOMB_X17_Y7_N18
\ACC_IN|Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux0~2_combout\ = (\accumulador|FF1|aux~0_combout\ & (((\SW_I_ACC~combout\(1))))) # (!\accumulador|FF1|aux~0_combout\ & ((\SW_I_ACC~combout\(1) & ((\ACC_IN|Mux0~7_combout\))) # (!\SW_I_ACC~combout\(1) & (\imm~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \imm~combout\(3),
	datab => \accumulador|FF1|aux~0_combout\,
	datac => \SW_I_ACC~combout\(1),
	datad => \ACC_IN|Mux0~7_combout\,
	combout => \ACC_IN|Mux0~2_combout\);

-- Location: LCCOMB_X17_Y7_N0
\ACC_IN|Mux0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux0~4_combout\ = (\accumulador|FF1|aux~0_combout\ & ((\ACC_IN|Mux0~2_combout\ & ((\ACC_IN|Mux0~3_combout\))) # (!\ACC_IN|Mux0~2_combout\ & (\Register_File|output[3]~9_combout\)))) # (!\accumulador|FF1|aux~0_combout\ & 
-- (((\ACC_IN|Mux0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Register_File|output[3]~9_combout\,
	datab => \accumulador|FF1|aux~0_combout\,
	datac => \ACC_IN|Mux0~3_combout\,
	datad => \ACC_IN|Mux0~2_combout\,
	combout => \ACC_IN|Mux0~4_combout\);

-- Location: LCCOMB_X17_Y7_N22
\ACC_IN|Mux0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \ACC_IN|Mux0~5_combout\ = (\ACC_IN|Mux0~4_combout\ & ((!\SW_I_ACC~combout\(1)) # (!\SW_I_ACC~combout\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW_I_ACC~combout\(0),
	datac => \SW_I_ACC~combout\(1),
	datad => \ACC_IN|Mux0~4_combout\,
	combout => \ACC_IN|Mux0~5_combout\);

-- Location: LCFF_X17_Y7_N23
\accumulador|FF3|aux\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ACC_IN|Mux0~5_combout\,
	aclr => \acc_clr~clkctrl_outclk\,
	ena => \acc_ld~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \accumulador|FF3|aux~regout\);

-- Location: PIN_73,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rst~I\ : cycloneii_io
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
	padio => ww_rst);

-- Location: PIN_126,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output_4[0]~I\ : cycloneii_io
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
	datain => \accumulador|FF0|aux~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output_4(0));

-- Location: PIN_60,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output_4[1]~I\ : cycloneii_io
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
	datain => \accumulador|FF1|aux~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output_4(1));

-- Location: PIN_59,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output_4[2]~I\ : cycloneii_io
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
	datain => \accumulador|FF2|aux~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output_4(2));

-- Location: PIN_129,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\output_4[3]~I\ : cycloneii_io
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
	datain => \accumulador|FF3|aux~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_output_4(3));
END structure;



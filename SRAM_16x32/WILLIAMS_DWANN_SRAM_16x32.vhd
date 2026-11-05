-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"
-- CREATED		"Mon Oct 12 01:01:06 2026"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY WILLIAMS_DWANN_SRAM_16x32 IS 
	PORT
	(
		CS :  IN  STD_LOGIC;
		OE :  IN  STD_LOGIC;
		WE :  IN  STD_LOGIC;
		address :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Data_In :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		Data_Out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END WILLIAMS_DWANN_SRAM_16x32;

ARCHITECTURE bdf_type OF WILLIAMS_DWANN_SRAM_16x32 IS 

COMPONENT williams_dwann_sram_16x4
	PORT(OE : IN STD_LOGIC;
		 CS : IN STD_LOGIC;
		 WE : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Data_In : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Data_Out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	Data_Out_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;


BEGIN 



b2v_inst : williams_dwann_sram_16x4
PORT MAP(OE => SYNTHESIZED_WIRE_16,
		 CS => CS,
		 WE => SYNTHESIZED_WIRE_17,
		 address => address,
		 Data_In => Data_In(31 DOWNTO 28),
		 Data_Out => Data_Out_ALTERA_SYNTHESIZED(31 DOWNTO 28));


SYNTHESIZED_WIRE_17 <= CS AND WE;


b2v_inst2 : williams_dwann_sram_16x4
PORT MAP(OE => SYNTHESIZED_WIRE_16,
		 CS => CS,
		 WE => SYNTHESIZED_WIRE_17,
		 address => address,
		 Data_In => Data_In(27 DOWNTO 24),
		 Data_Out => Data_Out_ALTERA_SYNTHESIZED(27 DOWNTO 24));


b2v_inst3 : williams_dwann_sram_16x4
PORT MAP(OE => SYNTHESIZED_WIRE_16,
		 CS => CS,
		 WE => SYNTHESIZED_WIRE_17,
		 address => address,
		 Data_In => Data_In(23 DOWNTO 20),
		 Data_Out => Data_Out_ALTERA_SYNTHESIZED(23 DOWNTO 20));


b2v_inst4 : williams_dwann_sram_16x4
PORT MAP(OE => SYNTHESIZED_WIRE_16,
		 CS => CS,
		 WE => SYNTHESIZED_WIRE_17,
		 address => address,
		 Data_In => Data_In(19 DOWNTO 16),
		 Data_Out => Data_Out_ALTERA_SYNTHESIZED(19 DOWNTO 16));


b2v_inst5 : williams_dwann_sram_16x4
PORT MAP(OE => SYNTHESIZED_WIRE_16,
		 CS => CS,
		 WE => SYNTHESIZED_WIRE_17,
		 address => address,
		 Data_In => Data_In(15 DOWNTO 12),
		 Data_Out => Data_Out_ALTERA_SYNTHESIZED(15 DOWNTO 12));


b2v_inst6 : williams_dwann_sram_16x4
PORT MAP(OE => SYNTHESIZED_WIRE_16,
		 CS => CS,
		 WE => SYNTHESIZED_WIRE_17,
		 address => address,
		 Data_In => Data_In(11 DOWNTO 8),
		 Data_Out => Data_Out_ALTERA_SYNTHESIZED(11 DOWNTO 8));


b2v_inst7 : williams_dwann_sram_16x4
PORT MAP(OE => SYNTHESIZED_WIRE_16,
		 CS => CS,
		 WE => SYNTHESIZED_WIRE_17,
		 address => address,
		 Data_In => Data_In(7 DOWNTO 4),
		 Data_Out => Data_Out_ALTERA_SYNTHESIZED(7 DOWNTO 4));


b2v_inst8 : williams_dwann_sram_16x4
PORT MAP(OE => SYNTHESIZED_WIRE_16,
		 CS => CS,
		 WE => SYNTHESIZED_WIRE_17,
		 address => address,
		 Data_In => Data_In(3 DOWNTO 0),
		 Data_Out => Data_Out_ALTERA_SYNTHESIZED(3 DOWNTO 0));


SYNTHESIZED_WIRE_16 <= OE AND CS;

Data_Out <= Data_Out_ALTERA_SYNTHESIZED;

END bdf_type;
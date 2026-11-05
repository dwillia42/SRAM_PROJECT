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
-- CREATED		"Sun Oct 11 17:41:33 2026"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY WILLIAMS_DWANN_SRAM_CELL IS 
	PORT
	(
		WE :  IN  STD_LOGIC;
		SEL :  IN  STD_LOGIC;
		Data_In :  IN  STD_LOGIC;
		Data_Out :  OUT  STD_LOGIC
	);
END WILLIAMS_DWANN_SRAM_CELL;

ARCHITECTURE bdf_type OF WILLIAMS_DWANN_SRAM_CELL IS 

COMPONENT williams_dwann_d_latch
	PORT(D : IN STD_LOGIC;
		 C : IN STD_LOGIC;
		 Q : OUT STD_LOGIC;
		 Q_NOT : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;


BEGIN 



b2v_inst : williams_dwann_d_latch
PORT MAP(D => Data_In,
		 C => SYNTHESIZED_WIRE_0,
		 Q => SYNTHESIZED_WIRE_1);


b2v_inst1 : williams_dwann_d_latch
PORT MAP(D => SYNTHESIZED_WIRE_1,
		 C => SYNTHESIZED_WIRE_5,
		 Q => SYNTHESIZED_WIRE_3);


PROCESS(SYNTHESIZED_WIRE_3,SEL)
BEGIN
if (SEL = '1') THEN
	Data_Out <= SYNTHESIZED_WIRE_3;
ELSE
	Data_Out <= 'Z';
END IF;
END PROCESS;


SYNTHESIZED_WIRE_5 <= SEL AND WE;


SYNTHESIZED_WIRE_0 <= NOT(SYNTHESIZED_WIRE_5);



END bdf_type;
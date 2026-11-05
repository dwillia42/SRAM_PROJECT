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
-- CREATED		"Sun Oct 11 17:52:52 2026"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY WILLIAMS_DWANN_D_LATCH IS 
	PORT
	(
		C :  IN  STD_LOGIC;
		D :  IN  STD_LOGIC;
		Q_NOT :  OUT  STD_LOGIC;
		Q :  OUT  STD_LOGIC
	);
END WILLIAMS_DWANN_D_LATCH;

ARCHITECTURE bdf_type OF WILLIAMS_DWANN_D_LATCH IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;


BEGIN 
Q_NOT <= SYNTHESIZED_WIRE_0;
Q <= SYNTHESIZED_WIRE_3;



SYNTHESIZED_WIRE_3 <= NOT(SYNTHESIZED_WIRE_0 AND SYNTHESIZED_WIRE_1);


SYNTHESIZED_WIRE_0 <= NOT(SYNTHESIZED_WIRE_2 AND SYNTHESIZED_WIRE_3);


SYNTHESIZED_WIRE_1 <= NOT(SYNTHESIZED_WIRE_7 AND D);


SYNTHESIZED_WIRE_2 <= NOT(SYNTHESIZED_WIRE_5 AND SYNTHESIZED_WIRE_7);


SYNTHESIZED_WIRE_7 <= NOT(C);



SYNTHESIZED_WIRE_5 <= NOT(D);



END bdf_type;
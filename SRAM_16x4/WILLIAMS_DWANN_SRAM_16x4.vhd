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
-- CREATED		"Sun Oct 11 23:47:10 2026"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY WILLIAMS_DWANN_SRAM_16x4 IS 
	PORT
	(
		CS :  IN  STD_LOGIC;
		OE :  IN  STD_LOGIC;
		WE :  IN  STD_LOGIC;
		address :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Data_In :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Data_Out :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END WILLIAMS_DWANN_SRAM_16x4;

ARCHITECTURE bdf_type OF WILLIAMS_DWANN_SRAM_16x4 IS 

COMPONENT williams_dwann_sram_16x1
	PORT(A0 : IN STD_LOGIC;
		 A1 : IN STD_LOGIC;
		 Data : IN STD_LOGIC;
		 WE : IN STD_LOGIC;
		 CS : IN STD_LOGIC;
		 OE : IN STD_LOGIC;
		 A2 : IN STD_LOGIC;
		 A3 : IN STD_LOGIC;
		 output : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	Data_Out_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;


BEGIN 



b2v_inst1 : williams_dwann_sram_16x1
PORT MAP(A0 => address(0),
		 A1 => address(1),
		 Data => Data_In(3),
		 WE => SYNTHESIZED_WIRE_16,
		 CS => CS,
		 OE => SYNTHESIZED_WIRE_17,
		 A2 => address(2),
		 A3 => address(3),
		 output => SYNTHESIZED_WIRE_10);


PROCESS(SYNTHESIZED_WIRE_2,SYNTHESIZED_WIRE_17)
BEGIN
if (SYNTHESIZED_WIRE_17 = '1') THEN
	Data_Out_ALTERA_SYNTHESIZED(0) <= SYNTHESIZED_WIRE_2;
ELSE
	Data_Out_ALTERA_SYNTHESIZED(0) <= 'Z';
END IF;
END PROCESS;


b2v_inst2 : williams_dwann_sram_16x1
PORT MAP(A0 => address(0),
		 A1 => address(1),
		 Data => Data_In(2),
		 WE => SYNTHESIZED_WIRE_16,
		 CS => CS,
		 OE => SYNTHESIZED_WIRE_17,
		 A2 => address(2),
		 A3 => address(3),
		 output => SYNTHESIZED_WIRE_12);


b2v_inst3 : williams_dwann_sram_16x1
PORT MAP(A0 => address(0),
		 A1 => address(1),
		 Data => Data_In(1),
		 WE => SYNTHESIZED_WIRE_16,
		 CS => CS,
		 OE => SYNTHESIZED_WIRE_17,
		 A2 => address(2),
		 A3 => address(3),
		 output => SYNTHESIZED_WIRE_14);


b2v_inst4 : williams_dwann_sram_16x1
PORT MAP(A0 => address(0),
		 A1 => address(1),
		 Data => Data_In(0),
		 WE => SYNTHESIZED_WIRE_16,
		 CS => CS,
		 OE => SYNTHESIZED_WIRE_17,
		 A2 => address(2),
		 A3 => address(3),
		 output => SYNTHESIZED_WIRE_2);


SYNTHESIZED_WIRE_17 <= OE AND CS;


SYNTHESIZED_WIRE_16 <= CS AND WE;


PROCESS(SYNTHESIZED_WIRE_10,SYNTHESIZED_WIRE_17)
BEGIN
if (SYNTHESIZED_WIRE_17 = '1') THEN
	Data_Out_ALTERA_SYNTHESIZED(3) <= SYNTHESIZED_WIRE_10;
ELSE
	Data_Out_ALTERA_SYNTHESIZED(3) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_12,SYNTHESIZED_WIRE_17)
BEGIN
if (SYNTHESIZED_WIRE_17 = '1') THEN
	Data_Out_ALTERA_SYNTHESIZED(2) <= SYNTHESIZED_WIRE_12;
ELSE
	Data_Out_ALTERA_SYNTHESIZED(2) <= 'Z';
END IF;
END PROCESS;


PROCESS(SYNTHESIZED_WIRE_14,SYNTHESIZED_WIRE_17)
BEGIN
if (SYNTHESIZED_WIRE_17 = '1') THEN
	Data_Out_ALTERA_SYNTHESIZED(1) <= SYNTHESIZED_WIRE_14;
ELSE
	Data_Out_ALTERA_SYNTHESIZED(1) <= 'Z';
END IF;
END PROCESS;

Data_Out <= Data_Out_ALTERA_SYNTHESIZED;

END bdf_type;
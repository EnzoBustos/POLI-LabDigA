-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
-- CREATED		"Tue Jun 21 12:06:35 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY altera;
USE altera.maxplus2.all; 

LIBRARY work;

ENTITY 7485_1 IS 
PORT 
( 
	A3	:	IN	 STD_LOGIC;
	B2	:	IN	 STD_LOGIC;
	A2	:	IN	 STD_LOGIC;
	A0	:	IN	 STD_LOGIC;
	B0	:	IN	 STD_LOGIC;
	B3	:	IN	 STD_LOGIC;
	A1	:	IN	 STD_LOGIC;
	B1	:	IN	 STD_LOGIC;
	AEBO	:	OUT	 STD_LOGIC
); 
END 7485_1;

ARCHITECTURE bdf_type OF 7485_1 IS 
BEGIN 

-- instantiate macrofunction 

b2v_inst53 : 7485
PORT MAP(A3 => A3,
		 B2 => B2,
		 A2 => A2,
		 A0 => A0,
		 B0 => B0,
		 B3 => B3,
		 A1 => A1,
		 B1 => B1,
		 AEBO => AEBO);

END bdf_type; 
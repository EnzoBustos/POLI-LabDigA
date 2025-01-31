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
-- CREATED		"Fri Jun 10 15:57:51 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY altera;
USE altera.maxplus2.all; 

LIBRARY work;

ENTITY 74163_1 IS 
PORT 
( 
	CLRN	:	IN	 STD_LOGIC;
	CLK	:	IN	 STD_LOGIC;
	QA	:	OUT	 STD_LOGIC;
	QB	:	OUT	 STD_LOGIC;
	QC	:	OUT	 STD_LOGIC;
	QD	:	OUT	 STD_LOGIC
); 
END 74163_1;

ARCHITECTURE bdf_type OF 74163_1 IS 
BEGIN 

-- instantiate macrofunction 

b2v_inst1 : 74163
PORT MAP(CLRN => CLRN,
		 CLK => CLK,
		 QA => QA,
		 QB => QB,
		 QC => QC,
		 QD => QD);

END bdf_type; 
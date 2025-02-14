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

LIBRARY work;

ENTITY cerveja IS 
	PORT
	(
		Sensor :  IN  STD_LOGIC;
		Reset :  IN  STD_LOGIC;
		Num_por_fardo_0 :  IN  STD_LOGIC;
		Num_por_fardo_1 :  IN  STD_LOGIC;
		Num_por_fardo_2 :  IN  STD_LOGIC;
		Num_por_fardo_3 :  IN  STD_LOGIC;
		Num_por_lote_0 :  IN  STD_LOGIC;
		Num_por_lote_1 :  IN  STD_LOGIC;
		Num_por_lote_2 :  IN  STD_LOGIC;
		Num_por_lote_3 :  IN  STD_LOGIC;
		Fardo_cheio :  OUT  STD_LOGIC;
		Lote_cheio :  OUT  STD_LOGIC;
		Cheio :  OUT  STD_LOGIC;
		Cerveja_3 :  OUT  STD_LOGIC;
		Cerveja_2 :  OUT  STD_LOGIC;
		Cerveja_1 :  OUT  STD_LOGIC;
		Cerveja_0 :  OUT  STD_LOGIC;
		Lote_3 :  OUT  STD_LOGIC;
		Lote_2 :  OUT  STD_LOGIC;
		Lote_1 :  OUT  STD_LOGIC;
		Lote_0 :  OUT  STD_LOGIC
	);
END cerveja;

ARCHITECTURE bdf_type OF cerveja IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT \74163_2\
	PORT(CLRN : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 QA : OUT STD_LOGIC;
		 QB : OUT STD_LOGIC;
		 QC : OUT STD_LOGIC;
		 QD : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \74163_2\: COMPONENT IS true;
ATTRIBUTE noopt OF \74163_2\: COMPONENT IS true;

COMPONENT \74163_3\
	PORT(CLRN : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 QA : OUT STD_LOGIC;
		 QB : OUT STD_LOGIC;
		 QC : OUT STD_LOGIC;
		 QD : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \74163_3\: COMPONENT IS true;
ATTRIBUTE noopt OF \74163_3\: COMPONENT IS true;

COMPONENT \7485_0\
	PORT(A3 : IN STD_LOGIC;
		 B2 : IN STD_LOGIC;
		 A2 : IN STD_LOGIC;
		 A0 : IN STD_LOGIC;
		 B0 : IN STD_LOGIC;
		 B3 : IN STD_LOGIC;
		 A1 : IN STD_LOGIC;
		 B1 : IN STD_LOGIC;
		 AEBO : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \7485_0\: COMPONENT IS true;
ATTRIBUTE noopt OF \7485_0\: COMPONENT IS true;

COMPONENT \7485_1\
	PORT(A3 : IN STD_LOGIC;
		 B2 : IN STD_LOGIC;
		 A2 : IN STD_LOGIC;
		 A0 : IN STD_LOGIC;
		 B0 : IN STD_LOGIC;
		 B3 : IN STD_LOGIC;
		 A1 : IN STD_LOGIC;
		 B1 : IN STD_LOGIC;
		 AEBO : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \7485_1\: COMPONENT IS true;
ATTRIBUTE noopt OF \7485_1\: COMPONENT IS true;

SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;


BEGIN

lote_vector <= Lote_3 & Lote_2 & Lote_1 & Lote_0
cerveja_vector <= Cerveja_3 & Cerveja_2 & Cerveja_1 & Cerveja_0


Fardo_cheio <= SYNTHESIZED_WIRE_19;
Lote_cheio <= SYNTHESIZED_WIRE_20;
Cerveja_3 <= SYNTHESIZED_WIRE_3;
Cerveja_2 <= SYNTHESIZED_WIRE_4;
Cerveja_1 <= SYNTHESIZED_WIRE_6;
Cerveja_0 <= SYNTHESIZED_WIRE_5;
Lote_3 <= SYNTHESIZED_WIRE_8;
Lote_2 <= SYNTHESIZED_WIRE_9;
Lote_1 <= SYNTHESIZED_WIRE_11;
Lote_0 <= SYNTHESIZED_WIRE_10;



Cheio <= SYNTHESIZED_WIRE_19 AND SYNTHESIZED_WIRE_20;


SYNTHESIZED_WIRE_18 <= Reset OR Sensor;


SYNTHESIZED_WIRE_7 <= Reset OR SYNTHESIZED_WIRE_19;


b2v_inst42 : 7485_0
PORT MAP(A3 => SYNTHESIZED_WIRE_3,
		 B2 => Num_por_fardo_1,
		 A2 => SYNTHESIZED_WIRE_4,
		 A0 => SYNTHESIZED_WIRE_5,
		 B0 => Num_por_fardo_3,
		 B3 => Num_por_fardo_0,
		 A1 => SYNTHESIZED_WIRE_6,
		 B1 => Num_por_fardo_2,
		 AEBO => SYNTHESIZED_WIRE_19);


SYNTHESIZED_WIRE_17 <= NOT(SYNTHESIZED_WIRE_7);



b2v_inst53 : 7485_1
PORT MAP(A3 => SYNTHESIZED_WIRE_8,
		 B2 => Num_por_lote_1,
		 A2 => SYNTHESIZED_WIRE_9,
		 A0 => SYNTHESIZED_WIRE_10,
		 B0 => Num_por_lote_3,
		 B3 => Num_por_lote_0,
		 A1 => SYNTHESIZED_WIRE_11,
		 B1 => Num_por_lote_2,
		 AEBO => SYNTHESIZED_WIRE_20);


b2v_inst67 : 74163_2
PORT MAP(CLRN => SYNTHESIZED_WIRE_12,
		 CLK => SYNTHESIZED_WIRE_13,
		 QA => SYNTHESIZED_WIRE_8,
		 QB => SYNTHESIZED_WIRE_9,
		 QC => SYNTHESIZED_WIRE_11,
		 QD => SYNTHESIZED_WIRE_10);


SYNTHESIZED_WIRE_16 <= Reset OR SYNTHESIZED_WIRE_20;


SYNTHESIZED_WIRE_13 <= Reset OR SYNTHESIZED_WIRE_19;


SYNTHESIZED_WIRE_12 <= NOT(SYNTHESIZED_WIRE_16);



b2v_inst92 : 74163_3
PORT MAP(CLRN => SYNTHESIZED_WIRE_17,
		 CLK => SYNTHESIZED_WIRE_18,
		 QA => SYNTHESIZED_WIRE_3,
		 QB => SYNTHESIZED_WIRE_4,
		 QC => SYNTHESIZED_WIRE_6,
		 QD => SYNTHESIZED_WIRE_5);


		 
END bdf_type;
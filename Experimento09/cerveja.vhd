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

LIBRARY work;

ENTITY cerveja IS 
	PORT
	(
		RESET :  IN  STD_LOGIC;
		SENSOR :  IN  STD_LOGIC;
		Cerveja_4 :  OUT  STD_LOGIC;
		Cerveja_3 :  OUT  STD_LOGIC;
		Cerveja_2 :  OUT  STD_LOGIC;
		Cerveja_1 :  OUT  STD_LOGIC;
		FARDO :  OUT  STD_LOGIC;
		Lote_4 :  OUT  STD_LOGIC;
		Lote_3 :  OUT  STD_LOGIC;
		Lote_2 :  OUT  STD_LOGIC;
		Lote_1 :  OUT  STD_LOGIC;
		LOTE :  OUT  STD_LOGIC;
		Saida_8seg_Cerveja: OUT STD_LOGIC_VECTOR(6 downto 0);
		Saida_8seg_Lote: OUT STD_LOGIC_VECTOR(6 downto 0)
	);
END cerveja;

ARCHITECTURE bdf_type OF cerveja IS 

ATTRIBUTE black_box : BOOLEAN;
ATTRIBUTE noopt : BOOLEAN;

COMPONENT \74163_0\
	PORT(CLRN : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 QA : OUT STD_LOGIC;
		 QB : OUT STD_LOGIC;
		 QC : OUT STD_LOGIC;
		 QD : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \74163_0\: COMPONENT IS true;
ATTRIBUTE noopt OF \74163_0\: COMPONENT IS true;

COMPONENT \74163_1\
	PORT(CLRN : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 QA : OUT STD_LOGIC;
		 QB : OUT STD_LOGIC;
		 QC : OUT STD_LOGIC;
		 QD : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \74163_1\: COMPONENT IS true;
ATTRIBUTE noopt OF \74163_1\: COMPONENT IS true;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL   lote_vector: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL   cerveja_vector: STD_LOGIC_VECTOR(3 downto 0);


BEGIN

lote_vector <= Lote_1 & Lote_2 & Lote_3 & Lote_4
cerveja_vector <= Cerveja_1 & Cerveja_2 & Cerveja_3 & Cerveja_4

Cerveja_4 <= SYNTHESIZED_WIRE_15;
Cerveja_3 <= SYNTHESIZED_WIRE_10;
Cerveja_2 <= SYNTHESIZED_WIRE_11;
FARDO <= SYNTHESIZED_WIRE_19;
Lote_4 <= SYNTHESIZED_WIRE_16;
Lote_3 <= SYNTHESIZED_WIRE_17;
Lote_2 <= SYNTHESIZED_WIRE_14;



b2v_inst : 74163_0
PORT MAP(CLRN => SYNTHESIZED_WIRE_0,
		 CLK => SENSOR,
		 QA => SYNTHESIZED_WIRE_15,
		 QB => SYNTHESIZED_WIRE_10,
		 QC => SYNTHESIZED_WIRE_11,
		 QD => Cerveja_1);


b2v_inst1 : 74163_1
PORT MAP(CLRN => SYNTHESIZED_WIRE_1,
		 CLK => SYNTHESIZED_WIRE_2,
		 QA => SYNTHESIZED_WIRE_16,
		 QB => SYNTHESIZED_WIRE_17,
		 QC => SYNTHESIZED_WIRE_14,
		 QD => Lote_1);


SYNTHESIZED_WIRE_18 <= SYNTHESIZED_WIRE_19 OR RESET;


LOTE <= SYNTHESIZED_WIRE_19 AND SYNTHESIZED_WIRE_20;


SYNTHESIZED_WIRE_7 <= SYNTHESIZED_WIRE_20 OR RESET;


SYNTHESIZED_WIRE_1 <= NOT(SYNTHESIZED_WIRE_7);



SYNTHESIZED_WIRE_2 <= SYNTHESIZED_WIRE_19 OR RESET;


SYNTHESIZED_WIRE_19 <= SYNTHESIZED_WIRE_9 AND SYNTHESIZED_WIRE_10 AND SYNTHESIZED_WIRE_11;


SYNTHESIZED_WIRE_20 <= SYNTHESIZED_WIRE_12 AND SYNTHESIZED_WIRE_13 AND SYNTHESIZED_WIRE_14;


SYNTHESIZED_WIRE_9 <= NOT(SYNTHESIZED_WIRE_15);



SYNTHESIZED_WIRE_12 <= NOT(SYNTHESIZED_WIRE_16);



SYNTHESIZED_WIRE_13 <= NOT(SYNTHESIZED_WIRE_17);



SYNTHESIZED_WIRE_0 <= NOT(SYNTHESIZED_WIRE_18);

Saida_8seg_Cerveja <= "1000000" when (cerveja_vector = "0000") else
							 "1111001" when (cerveja_vector = "0001") else
							 "0100100" when (cerveja_vector = "0010") else
							 "0110000" when (cerveja_vector = "0011") else
							 "0011001" when (cerveja_vector = "0100") else
							 "0010010" when (cerveja_vector = "0101") else
							 "0000010" when (cerveja_vector = "0110");

Saida_8seg_Lote    <= "1000000" when (lote_vector = "0000") else
							 "1111001" when (lote_vector = "0001") else
							 "0100100" when (lote_vector = "0010") else
							 "0110000" when (lote_vector = "0011") else
							 "0011001" when (lote_vector = "0100");

END bdf_type;
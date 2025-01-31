
library IEEE;
use IEEE.std_logic_1164.all;

entity sinalizador is
		port(
			vagas, carros: in std_logic_vector (3 downto 0);
			cheio: out std_logic
		);
end sinalizador;

architecture behavior of sinalizador  is
begin
	
	cheio <= '1' when vagas = carros else '0';
		
end behavior;
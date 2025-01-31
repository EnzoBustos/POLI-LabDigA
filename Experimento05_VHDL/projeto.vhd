library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity projeto is
		port(
			clock, clear, entrada, saida: in std_logic;
			vagas: in std_logic_vector (3 downto 0);
			cheio: out std_logic
		);					
end projeto;

architecture behavior of projeto is
		signal enable: std_logic; -- feedback do sinalizador para o contador saber quando interromper contagem
		signal contagem: std_logic_vector (3 downto 0); -- numero de carros no contador
		signal lotacao: std_logic; -- alto em caso de lotacao do estacionamento
		
		component contador_up_down is
		port(
			clock, clear, entrada, saida, enable: in std_logic;
			contagem: out std_logic_vector (3 downto 0);
			fim: out std_logic
		);					
		end component;
		
		component sinalizador is
		port(
			vagas, carros: in std_logic_vector (3 downto 0);
			cheio: out std_logic
		);
		end component;
		
begin

		enable <= '0' when contagem = vagas else '1';

		cont: contador_up_down port map(clock, clear, entrada, saida, enable, contagem, lotacao);
		sinaliz: sinalizador port map(vagas, contagem, cheio);
		
end behavior;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contador_up_down is
		port(
			clock, clear, entrada, saida, enable: in std_logic;
			contagem: out std_logic_vector (3 downto 0);
			fim: out std_logic
		);					
end contador_up_down;

architecture behavior of contador_up_down is
		signal IQ: integer range 0 to 15;
begin

		process(clock, clear, entrada, saida, enable, IQ)
		begin
			if clear = '1' then IQ <= 0;
			elsif clock'event and clock = '1' then 
				if entrada = '1' and saida = '0' and (IQ < 15) and enable = '1'then -- existem vagas disponiveis e um carro entra, caso nao esteja lotado
					IQ <= IQ + 1; 
				elsif entrada = '0' and saida ='1' and (IQ /= 0) then -- algum carro sai, dado que existe algum carro
					IQ <= IQ - 1;
		-- caso entrada e saida ambos igual a 0 ou 1, o contador nao altera
				end if;	
			end if;
		end process;
		
		contagem <= std_logic_vector(to_unsigned(IQ, contagem'length));
		
		fim <= '1' when IQ = 15 else '0';
		
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity maquina_estados_6 is
		port(
			clk, clear, in_out_adulto, in_out_idoso: in std_logic; 
			vagas: in std_logic_vector (3 downto 0);
			num_idosos: out std_logic_vector (3 downto 0);
			cheio: out std_logic
		);					
end maquina_estados_6;

architecture arch_behav of maquina_estados_6 is

	-- definitions of signals
	signal contagem_int, contagem_idosos_int, vagas_int: unsigned (3 downto 0); -- guarda variaveis em inteiro
	
	-- definitions of states
	type state_type is (ha_vagas, nao_ha_vagas);
	signal current_state : state_type;
	

begin

	-- atribuitions
	vagas_int <= unsigned(vagas);
	num_idosos <= std_logic_vector(contagem_idosos_int);

	-- process
	async_proc: process (clk, clear, current_state)
	begin 
		if (clear = '1') then 
			current_state <= ha_vagas; -- take care of the asynchronous input
			contagem_int <= "0000";
			contagem_idosos_int <= "0000";
			cheio <= '0';
		end if; 
	end process async_proc;
	
	-- actions and transitions of states 
	comb_proc: process (clk)
	begin
		case current_state is
			when ha_vagas =>
				cheio <= '0';
				-- action of state
				if rising_edge(clk) then
					
					if (in_out_adulto = '0' and in_out_idoso = '0') then
						contagem_int <= contagem_int - 2;
						contagem_idosos_int <= contagem_idosos_int - 1;
					
					elsif (in_out_adulto = '0' and in_out_idoso = '1') then
						contagem_idosos_int <= contagem_idosos_int + 1;
					
					elsif (in_out_adulto = '1' and in_out_idoso = '0') then
						contagem_idosos_int <= contagem_idosos_int - 1;
					
					-- entra ambos tendo pelo menos 2vagas disponiveis
					elsif (in_out_adulto = '1' and in_out_idoso = '1' and vagas_int > contagem_int + 1) then
						contagem_int <= contagem_int + 2;
						contagem_idosos_int <= contagem_idosos_int + 1;
					
					-- so ha uma vaga, o idoso tem prioridade
					elsif (in_out_adulto = '1' and in_out_idoso = '1' and vagas_int = contagem_int + 1) then
						contagem_int <= contagem_int + 1;
						contagem_idosos_int <= contagem_idosos_int + 1;
					end if;
					
				end if;
				
				-- transition of state
				if (vagas_int = contagem_int) then
					current_state <= nao_ha_vagas; 
				end if;
				
			when nao_ha_vagas => cheio <= '1';
			
			if rising_edge(clk) then
				-- action of state
				if (in_out_adulto = '0' and in_out_idoso = '0') then
						contagem_int <= contagem_int - 2;
						contagem_idosos_int <= contagem_idosos_int - 1;
				end if;
				if (in_out_adulto = '0' and in_out_idoso = '1') then
						contagem_idosos_int <= contagem_idosos_int + 1;
				end if;
				if (in_out_adulto = '1' and in_out_idoso = '0') then
						contagem_idosos_int <= contagem_idosos_int - 1;
				end if;
			end if;
		end case;
		
		-- transition of state
		if (vagas_int = contagem_int) then
			current_state <= nao_ha_vagas; 
		end if;
	
	end process comb_proc;
	
end arch_behav;

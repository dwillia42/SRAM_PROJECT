LIBRARY IEEE;
use IEEE.std_logic_1164.all;

ENTITY WILLIAMS_DWANN_2x4Decoder IS
	port(
		address: in std_logic_vector(1 downto 0);
		output: out std_logic_vector(3 downto 0)
		);
end WILLIAMS_DWANN_2x4Decoder;

ARCHITECTURE arch of WILLIAMS_DWANN_2x4Decoder IS

	begin
	
	with address select
		output <= "0001" when "00",
					 "0010" when "01",
					 "0100" when "10",
					 "1000" when "11",
					 "0000" when others;
end arch;
	

-- Quartus Prime VHDL Template
-- Binary Up/Down Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sw_debouncer is

	port
	(
		clk		   : in std_logic;
		resetn : in std_logic;
		sw_in	   : in std_logic;
		sw_out	   : out std_logic
	);

end entity;

architecture rtl of sw_debouncer is

	COMPONENT clock_divider_v1
	GENERIC ( DIVISOR : integer );
	PORT
	(
		clock_in		:	 IN STD_LOGIC;
		clock_out		:	 OUT STD_LOGIC
	);
	END COMPONENT;

	
	signal clk_slow : std_logic;
	signal sw_out_w : std_logic;
	
begin

	inst0 : clock_divider_v1
	generic map (divisor => 25000000)
	port map(
		clock_in => clk,
		clock_out => clk_slow
	);
	
	process(clk_slow, resetn)
	begin
		if resetn = '0' then
			sw_out_w <= '0';
		elsif rising_edge(clk_slow) then
			sw_out_w <= sw_in;
		end if;
	end process;
	
	sw_out <= sw_out_w;
	

end rtl;

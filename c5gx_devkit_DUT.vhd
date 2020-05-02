--c5gx_devkit_DUT.vhd by Vincent Gosselin, 2020.


-- Quartus Prime VHDL Template
-- Binary Up/Down Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity c5gx_devkit_DUT is

	port
	(
		--from devkit
		clk_50		   : in std_logic;
		key0, key1, key2, key3, sw0, sw1, sw2, sw3	:	in std_logic;
		ledg0, ledg1, ledg2, ledg3, ledr0, ledr1, ledr2, ledr3 : out std_logic;
		gpio_d : out std_logic_vector(35 downto 0)
	);

end entity;

architecture rtl of c5gx_devkit_DUT is

	--component declaration
	COMPONENT clock_divider_v1
	GENERIC ( DIVISOR : integer );
	PORT
	(
		clock_in		:	 IN STD_LOGIC;
		clock_out		:	 OUT STD_LOGIC
	);
	END COMPONENT;
	
	
	
	--signals
	signal resetn : std_logic;
	signal heartbeat : std_logic;
	
begin
	
	
	--assignments
	resetn <= key0;
	ledg0 <= resetn;
	
	ledr0 <= heartbeat;
	
	inst0 : clock_divider_v1
	generic map (DIVISOR => 50000000)
	port map(
		clock_in => clk_50,
		clock_out => heartbeat
	);
		
	
	
	


end rtl;

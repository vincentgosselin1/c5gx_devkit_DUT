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
	
	COMPONENT sw_debouncer
	PORT
	(
		clk		:	 IN STD_LOGIC;
		resetn		:	 IN STD_LOGIC;
		sw_in		:	 IN STD_LOGIC;
		sw_out		:	 out STD_LOGIC
	);
	END COMPONENT;
	
	
	--DUT
	COMPONENT myGalvo_v2
	PORT
	(
		clk		:	 IN STD_LOGIC;
		galvo_busy_in		:	 IN STD_LOGIC;
		resetn_in		:	 IN STD_LOGIC;
		galvo_ydata_xy2		:	 OUT STD_LOGIC;
		galvo_xdata_xy2		:	 OUT STD_LOGIC;
		galvo_sync_xy2		:	 OUT STD_LOGIC;
		galvo_clock_xy2		:	 OUT STD_LOGIC;
		galvo_line_sync		:	 OUT STD_LOGIC
	);
	END COMPONENT;
	
	
	
	--signals
	signal resetn : std_logic;
	signal heartbeat : std_logic;
	signal sw0_d : std_logic;
	
begin
	
	
	--assignments
	resetn <= key0;
	ledg0 <= resetn;
	ledr0 <= heartbeat;
	
	
	--instantiations
	inst0 : clock_divider_v1
	generic map (DIVISOR => 50000000)
	port map(
		clock_in => clk_50,
		clock_out => heartbeat
	);
	
	inst0a : sw_debouncer
	PORT map
	(
		clk		=> clk_50,
		resetn	=> resetn,
		sw_in		=> sw0,
		sw_out	=> sw0_d
	);
	
	
	--DUT
	inst1 :  myGalvo_v2
	PORT map
	(
		clk => clk_50,
		galvo_busy_in	=> sw0_d,
		resetn_in	=> resetn,
		galvo_ydata_xy2	=> gpio_d(0),
		galvo_xdata_xy2	=> gpio_d(2),
		galvo_sync_xy2		=> gpio_d(4),
		galvo_clock_xy2	=> gpio_d(6),
		galvo_line_sync	=> gpio_d(8)
	);
		
	
	
	


end rtl;

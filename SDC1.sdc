create_clock -name clk_50 -period 20 -waveform {0 10} [get_ports {clk_50}]
derive_pll_clocks -create_base_clocks
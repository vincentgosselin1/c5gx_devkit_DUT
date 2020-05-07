set_global_assignment -entity "PLL_devkit" -library "lib_PLL_devkit" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "PLL_devkit" -library "lib_PLL_devkit" -name IP_TOOL_VERSION "17.1"
set_global_assignment -entity "PLL_devkit" -library "lib_PLL_devkit" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_PLL_devkit" -name SPD_FILE [file join $::quartus(sip_path) "PLL_devkit.spd"]

set_global_assignment -library "lib_PLL_devkit" -name MISC_FILE [file join $::quartus(sip_path) "PLL_devkit_sim/PLL_devkit.vo"]

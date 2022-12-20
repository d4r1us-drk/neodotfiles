//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Command*/	 	                             /*Update Interval*/	/*Update Signal*/
//	{"", "$HOME/.config/suckless/dwmblocks/block_cpu",              1,                       1},

//	{"", "$HOME/.config/suckless/dwmblocks/block_memory",           1,                       1},

	{"", "$HOME/.config/suckless/dwmblocks/scripts/block_layout",           1,                       0},

	{"", "$HOME/.config/suckless/dwmblocks/scripts/block_battery",          1,                       0},

	{"", "$HOME/.config/suckless/dwmblocks/scripts/block_brightness",       1,                       0},

	{"", "$HOME/.config/suckless/dwmblocks/scripts/block_volume",           1,                       0},

	{"", "$HOME/.config/suckless/dwmblocks/scripts/block_clock",            1,                       0},

	{"", "$HOME/.config/suckless/dwmblocks/scripts/block_wifi",             1,                       0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';

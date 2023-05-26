//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Command*/	 	                             /*Update Interval*/	/*Update Signal*/
	{"", "$HOME/.config/suckless/dwmblocks/scripts/block_layout",           5,                       5},

	{"", "$HOME/.config/suckless/dwmblocks/scripts/block_battery",          10,                      10},

	{"", "$HOME/.config/suckless/dwmblocks/scripts/block_brightness",       5,                       5},

	{"", "$HOME/.config/suckless/dwmblocks/scripts/block_volume",           1,                       0},

	{"", "$HOME/.config/suckless/dwmblocks/scripts/block_clock",            1,                       0},

	{"", "$HOME/.config/suckless/dwmblocks/scripts/block_wifi",             10,                      10},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';

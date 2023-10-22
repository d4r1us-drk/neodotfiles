//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "$HOME/.config/suckless/someblocks/scripts/block_battery",         10,                       1},

	{"", "$HOME/.config/suckless/someblocks/scripts/block_brightness",       0,                      10},

	{"", "$HOME/.config/suckless/someblocks/scripts/block_volume",           0,                      10},

	{"", "$HOME/.config/suckless/someblocks/scripts/block_clock",           60,                       1},

	{"", "$HOME/.config/suckless/someblocks/scripts/block_wifi",            20,                       1},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
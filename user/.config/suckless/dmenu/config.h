/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy = 1;                      /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"mononoki Nerd Font Mono:size=12"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#ebdbb2", "#1d2021" },
	[SchemeSel] = { "#ebdbb2", "#cc241d" },
	[SchemeSelHighlight] = { "#fbf1c7", "#282828" },
	[SchemeNormHighlight] = { "#fbf1c7", "#282828" },
	[SchemeOut] = { "#ebdbb2", "#8ec07c" },
	[SchemeOutHighlight] = { "#fabd2f", "#83a598" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

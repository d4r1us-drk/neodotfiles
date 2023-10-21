#include "keys.h"
/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }
/* appearance */
static const int sloppyfocus               = 1;  /* focus follows mouse */
static const int mousefollowsfocus         = 1;  /* mouse follows focus */
static const int bypass_surface_visibility = 0;  /* 1 means idle inhibitors will disable idle tracking even if it's surface isn't visible  */
static const int smartgaps                 = 0;  /* 1 means no outer gap when there is only one window */
static const unsigned int borderpx         = 1;  /* border pixel of windows */
static const unsigned int gappx           = 10; /* horiz inner gap between windows */
static const float bordercolor[]           = COLOR(0x504945ff);
static const float focuscolor[]            = COLOR(0xcc241dff);
static const float urgentcolor[]           = COLOR(0xfb4934ff);
/* To conform the xdg-protocol, set the alpha to zero to restore the old behavior */
static const float fullscreen_bg[]         = COLOR(0x1d2021ff); /* You can also use glsl colors */
static const int center_relative_to_monitor = 0;  /* 0 means center floating relative to the window area  */

/* Autostart */
static const char *const autostart[] = {
        "./.config/suckless/dwl/bootstrap", NULL,
        NULL /* terminate */
};

/* tagging - TAGCOUNT must be no greater than 31 */
#define TAGCOUNT (9)

/* logging */
static int log_level = WLR_ERROR;

static const Rule rules[] = {
	/* app_id     title       tags mask     isfloating   monitor scratchkey */
	/* examples:
	{ "Gimp",     NULL,       0,            1,           -1 },
	*/
	{ "^neovide$",                      NULL,       1 << 0,     0,          -1,     0 },
	{ "^emacs$",                        NULL,       1 << 0,     0,          -1,     0 },
	{ "^Code$",                         NULL,       1 << 0,     0,          -1,     0 },
	{ "^neovim$",                       NULL,       1 << 0,     0,          -1,     0 },
	{ "^virt-manager$",                 NULL,       1 << 1,     0,          -1,     0 },
	{ "^gnome-boxes$",                  NULL,       1 << 1,     0,          -1,     0 },
	{ "^Firefox$",                      NULL,       1 << 2,     0,          -1,     0 },
	{ "^Librewolf$",                    NULL,       1 << 2,     0,          -1,     0 },
	{ "^Chromium$",                     NULL,       1 << 2,     0,          -1,     0 },
	{ "^org.qutebrowser.qutebrowser$",  NULL,       1 << 2,     0,          -1,     0 },
	{ "^Brave-browser$",                NULL,       1 << 2,     0,          -1,     0 },
	{ "^Bitwarden$",                    NULL,       1 << 2,     0,          -1,     0 },
	{ "^org.qbittorrent.qBittorrent$",  NULL,       1 << 2,     0,          -1,     0 },
	{ "^gomuks$",                       NULL,       1 << 3,     0,          -1,     0 },
	{ "^Signal$",                       NULL,       1 << 3,     0,          -1,     0 },
	{ "^revolt-desktop$",               NULL,       1 << 3,     0,          -1,     0 },
	{ "^Element$",                      NULL,       1 << 3,     0,          -1,     0 },
	{ "^audacity$",                     NULL,       1 << 4,     0,          -1,     0 },
	{ "^Ardour$",                       NULL,       1 << 4,     0,          -1,     0 },
	{ "^carla$",                        NULL,       1 << 4,     0,          -1,     0 },
	{ "^carla-control$",                NULL,       1 << 4,     0,          -1,     0 },
	{ "^hydrogen$",                     NULL,       1 << 4,     0,          -1,     0 },
	{ "^guitarix$",                     NULL,       1 << 4,     0,          -1,     0 },
	{ "^lsp-plugins$",                  NULL,       1 << 4,     0,          -1,     0 },
	{ "^QjackCtl$",                     NULL,       1 << 4,     0,          -1,     0 },
	{ "^org.rncbc.qpwgraph$",           NULL,       1 << 4,     0,          -1,     0 },
	{ "^soundconverter$",               NULL,       1 << 4,     0,          -1,     0 },
	{ "^com.github.wwmm.easyeffects$",  NULL,       1 << 4,     0,          -1,     0 },
	{ "^kid3-qt$",                      NULL,       1 << 4,     0,          -1,     0 },
	{ "^pitivi$",                       NULL,       1 << 5,     0,          -1,     0 },
	{ "^org.kde.kdenlive$",             NULL,       1 << 5,     0,          -1,     0 },
	{ "^mpv$",                          NULL,       1 << 5,     1,          -1,     0 },
	{ "^blender$",                      NULL,       1 << 5,     0,          -1,     0 },
	{ "^com.obsproject.Studio$",        NULL,       1 << 5,     0,          -1,     0 },
	{ "^fr.handbrake.ghb$",             NULL,       1 << 5,     0,          -1,     0 },
	{ "^org.inkscape.Inkscape$",        NULL,       1 << 6,     0,          -1,     0 },
	{ "^Gimp-2.10$",                    NULL,       1 << 6,     0,          -1,     0 }, { "^xournalpp$",                    NULL,       1 << 6,     0,          -1,     0 },
	{ "^krita$",                        NULL,       1 << 6,     0,          -1,     0 },
	{ "^darktable$",                    NULL,       1 << 6,     0,          -1,     0 },
	{ "^org.kde.digikam$",              NULL,       1 << 6,     0,          -1,     0 },
	{ "^libreoffice-writer$",           NULL,       1 << 7,     0,          -1,     0 },
	{ "^libreoffice-calc$",             NULL,       1 << 7,     0,          -1,     0 },
	{ "^libreoffice-impress$",          NULL,       1 << 7,     0,          -1,     0 },
	{ "^libreoffice-base$",             NULL,       1 << 7,     0,          -1,     0 },
	{ "^libreoffice-draw$",             NULL,       1 << 7,     0,          -1,     0 },
	{ "^libreoffice-math$",             NULL,       1 << 7,     0,          -1,     0 },
	{ "^soffice$",                      NULL,       1 << 7,     0,          -1,     0 },
	{ "^GeoGebra$",                     NULL,       1 << 7,     0,          -1,     0 },
	{ "^org.pwmt.zathura$",             NULL,       1 << 7,     0,          -1,     0 },
	{ "^org.libretro.Retroarch$",       NULL,       1 << 8,     0,          -1,     0 },
	{ "^org.github.tkashkin.gamehub$",  NULL,       1 << 8,     0,          -1,     0 },
	{ "^DarkPlaces$",                   NULL,       1 << 8,     0,          -1,     0 },
	{ "^pyrogenesis$",                  NULL,       1 << 8,     0,          -1,     0 },
	{ "^wesnoth$",                      NULL,       1 << 8,     0,          -1,     0 },
	{ "^Steam$",                        NULL,       1 << 8,     0,          -1,     0 },
	{ "^Minetest$",                     NULL,       1 << 8,     0,          -1,     0 },
	{ "^spterm$",                       NULL,       0,          1,          -1,   't' },
	{ "^spbtop$",                       NULL,       0,          1,          -1,   'b' },
	{ "^sppuls$",                       NULL,       0,          1,          -1,   'p' },
	{ "^spcmus$",                       NULL,       0,          1,          -1,   'm' },
	{ "^sprang$",                       NULL,       0,          1,          -1,   'v' },
	{ "^spnews$",                       NULL,       0,          1,          -1,   'r' },
	{ "^spflix$",                       NULL,       0,          1,          -1,   'f' },
	{ "^spanic$",                       NULL,       0,          1,          -1,   'a' },
	{ "^spytfz$",                       NULL,       0,          1,          -1,   'y' },
	{ "^spytfm$",                       NULL,       0,          1,          -1,   'n' },
};

/* layout(s) */
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "|M|",      centeredmaster },
};

/* monitors */
static const MonitorRule monrules[] = {
	/* name       mfact nmaster scale layout       rotate/reflect                x    y */
	/* example of a HiDPI laptop monitor:
	{ "eDP-1",    0.5,  1,      2,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL,   -1,  -1 },
	*/
	/* defaults */
	{ NULL,       0.55, 1,      1,    &layouts[0], WL_OUTPUT_TRANSFORM_NORMAL,   -1,  -1 },
};

/* keyboard */
static const struct xkb_rule_names xkb_rules = {
	/* can specify fields: rules, model, layout, variant, options */
	/* example:
	.options = "ctrl:nocaps",
	*/
	.options = NULL,
};

static const int repeat_rate = 25;
static const int repeat_delay = 600;

/* es will be set the first time togglekblayout is called, then us.. it is
 * recommended to set the same layout in position 0 of kblayouts and in
 * xkb_rules */
static const char *kblayouts[] = {"us", "es"};

/* Trackpad */
static const int tap_to_click = 1;
static const int tap_and_drag = 1;
static const int drag_lock = 1;
static const int natural_scrolling = 1;
static const int disable_while_typing = 1;
static const int left_handed = 0;
static const int middle_button_emulation = 0;
/* You can choose between:
LIBINPUT_CONFIG_SCROLL_NO_SCROLL
LIBINPUT_CONFIG_SCROLL_2FG
LIBINPUT_CONFIG_SCROLL_EDGE
LIBINPUT_CONFIG_SCROLL_ON_BUTTON_DOWN
*/
static const enum libinput_config_scroll_method scroll_method = LIBINPUT_CONFIG_SCROLL_2FG;

/* You can choose between:
LIBINPUT_CONFIG_CLICK_METHOD_NONE
LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS
LIBINPUT_CONFIG_CLICK_METHOD_CLICKFINGER
*/
static const enum libinput_config_click_method click_method = LIBINPUT_CONFIG_CLICK_METHOD_BUTTON_AREAS;

/* You can choose between:
LIBINPUT_CONFIG_SEND_EVENTS_ENABLED
LIBINPUT_CONFIG_SEND_EVENTS_DISABLED
LIBINPUT_CONFIG_SEND_EVENTS_DISABLED_ON_EXTERNAL_MOUSE
*/
static const uint32_t send_events_mode = LIBINPUT_CONFIG_SEND_EVENTS_ENABLED;

/* You can choose between:
LIBINPUT_CONFIG_ACCEL_PROFILE_FLAT
LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE
*/
static const enum libinput_config_accel_profile accel_profile = LIBINPUT_CONFIG_ACCEL_PROFILE_ADAPTIVE;
static const double accel_speed = 0.0;
static const int cursor_timeout = 5;

/* You can choose between:
LIBINPUT_CONFIG_TAP_MAP_LRM -- 1/2/3 finger tap maps to left/right/middle
LIBINPUT_CONFIG_TAP_MAP_LMR -- 1/2/3 finger tap maps to left/middle/right
*/
static const enum libinput_config_tap_button_map button_map = LIBINPUT_CONFIG_TAP_MAP_LRM;

/* If you want to use the windows key for MODKEY, use WLR_MODIFIER_LOGO */
#define MODKEY WLR_MODIFIER_LOGO

#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                    KEY,            view,            {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL,  KEY,            toggleview,      {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_SHIFT, KEY,            tag,             {.ui = 1 << TAG} }, \
	{ MODKEY|WLR_MODIFIER_CTRL|WLR_MODIFIER_SHIFT,KEY,toggletag,  {.ui = 1 << TAG} }

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *termcmd[] = { "wezterm", NULL };
static const char *menucmd[] = { "wofi", "--show", "run", "-p", " Run", NULL };
static const char *dmenucmd[] = { "wofi", "--show", "drun", "-p", "󰀻 Apps", NULL };

/* named scratchpads - First arg only serves to match against key in rules*/
static const char *spterm[] = { "t", "wezterm", "start", "--class", "spterm", NULL };
static const char *spbtop[] = { "b", "wezterm", "start", "--class", "spbtop", "btop", NULL };
static const char *sppuls[] = { "p", "wezterm", "start", "--class", "sppuls", "pulsemixer", NULL };
static const char *spcmus[] = { "m", "wezterm", "start", "--class", "spcmus", "cmus", NULL };
static const char *sprang[] = { "v", "wezterm", "start", "--class", "sprang", "ranger", NULL };
static const char *spnews[] = { "r", "wezterm", "start", "--class", "spnews", "newsboat", NULL };
static const char *spflix[] = { "f", "wezterm", "start", "--class", "spflix", "flix-cli", NULL };
static const char *spanic[] = { "a", "wezterm", "start", "--class", "spanic", "ani-cli", NULL };
static const char *spytfz[] = { "y", "wezterm", "start", "--class", "spytfz", "ytfzf", "-flst", NULL };
static const char *spytfm[] = { "n", "wezterm", "start", "--class", "spytfm", "ytfzf", "-mlst", NULL };

static const Key keys[] = {
	/* Note that Shift changes certain key codes: c -> C, 2 -> at, etc. */
	/* modifier                         key                         function            argument */
	{ MODKEY,                           Key_q,                      killclient,         {0} },
	{ MODKEY,                           Key_Return,                 spawn,              {.v = termcmd} },
	{ MODKEY,                           Key_j,                      focusstack,         {.i = +1} },
	{ MODKEY,                           Key_k,                      focusstack,         {.i = -1} },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_j,                      movestack,          {.i = +1} },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_k,                      movestack,          {.i = -1} },
	{ MODKEY,                           Key_i,                      incnmaster,         {.i = +1} },
	{ MODKEY,                           Key_d,                      incnmaster,         {.i = -1} },
	{ MODKEY,                           Key_h,                      setmfact,           {.f = -0.05} },
	{ MODKEY,                           Key_l,                      setmfact,           {.f = +0.05} },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_Return,                 zoom,               {0} },
	{ MODKEY,                           Key_Tab,                    view,               {0} },
	{ MODKEY,                           Key_g,                      togglegaps,         {0} },
	{ MODKEY,                           Key_t,                      setlayout,          {.v = &layouts[0]} },
	{ MODKEY,                           Key_f,                      setlayout,          {.v = &layouts[1]} },
	{ MODKEY,                           Key_m,                      setlayout,          {.v = &layouts[2]} },
	{ MODKEY,                           Key_u,                      setlayout,          {.v = &layouts[3]} },
	{ MODKEY,                           Key_o,                      setlayout,          {.v = &layouts[4]} },
	{ MODKEY,                           Key_c,                      setlayout,          {.v = &layouts[5]} },
	{ MODKEY,                           Key_space,                  setlayout,          {0} },
	{ MODKEY|WLR_MODIFIER_CTRL,         Key_space,                  togglefloating,     {0} },
	{ MODKEY|WLR_MODIFIER_CTRL,         Key_f,                      togglefullscreen,   {0} },
	{ MODKEY,                           Key_b,                      togglebar,          {0} },
	{ MODKEY,                           Key_x,                      movecenter,         {0} },
	{ MODKEY,                           Key_0,                      view,               {.ui = ~0} },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_parenright,             tag,                {.ui = ~0} },
	{ MODKEY,                           Key_comma,                  focusmon,           {.i = WLR_DIRECTION_LEFT} },
	{ MODKEY,                           Key_period,                 focusmon,           {.i = WLR_DIRECTION_RIGHT} },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_minus,                  tagmon,             {.i = WLR_DIRECTION_LEFT} },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_equal,                  tagmon,             {.i = WLR_DIRECTION_RIGHT} },
	{ MODKEY|WLR_MODIFIER_CTRL,         Key_x,    	 	            togglekblayout,     {0} },
	{ MODKEY,                           Key_e,                      spawn,              SHCMD("$HOME/.local/bin/neovide.AppImage --neovim-bin $HOME/.local/bin/lvim") },
	{ MODKEY,                           Key_w,                      spawn,              SHCMD("firefox") },
	{ MODKEY,                           Key_s,                      spawn,              SHCMD("flatpak run org.signal.Signal") },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_r,                      spawn,              {.v = menucmd} },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_d,                      spawn,              {.v = dmenucmd} },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_d,                      spawn,              SHCMD("pkill wofi || $HOME/.config/wofi/scripts/rs_drun") },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_i,                      spawn,              SHCMD("pkill wofi || $HOME/.config/wofi/scripts/rs_wifi") },
	{ MODKEY,                           Key_Print,                  spawn,              SHCMD("pkill wofi || $HOME/.config/wofi/scripts/rs_scrot") },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_w,                      spawn,              SHCMD("pkill wofi || $HOME/.config/wofi/scripts/rs_wall") },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_e,                      spawn,              SHCMD("pkill wofi || $HOME/.config/wofi/scripts/rs_emoji") },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_b,                      spawn,              SHCMD("pkill wofi || $HOME/.config/wofi/scripts/rs_blue") },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_q,                      spawn,              SHCMD("pkill wofi || $HOME/.config/wofi/scripts/rs_power") },
	{ MODKEY|WLR_MODIFIER_SHIFT,        Key_c,                      spawn,              SHCMD("pkill wofi || cliphist list | wofi --dmenu -p '  Clipboard' | cliphist decode | wl-copy") },
	{ 0,                                Key_XF86AudioRaiseVolume,   spawn,              SHCMD("pamixer -i 5 && pkill -RTMIN+10 someblocks") },
	{ 0,                                Key_XF86AudioLowerVolume,   spawn,              SHCMD("pamixer -d 5 && pkill -RTMIN+10 someblocks") },
	{ 0,                                Key_XF86AudioMute,          spawn,              SHCMD("pamixer -t && pkill -RTMIN+10 someblocks") },
	{ 0,                                Key_XF86AudioMicMute,       spawn,              SHCMD("pamixer --default-source -t && pkill -RTMIN+10 someblocks") },
	{ 0,                                Key_XF86MonBrightnessUp,    spawn,              SHCMD("brightnessctl s 5%+ && pkill -RTMIN+10 someblocks") },
	{ 0,                                Key_XF86MonBrightnessDown,  spawn,              SHCMD("brightnessctl s 5%- && pkill -RTMIN+10 someblocks") },
	{ 0,                                Key_XF86Display,            spawn,              SHCMD("wdisplays") },
	{ 0,                                Key_XF86AudioPause,         spawn,              SHCMD("playerctl play-pause") },
	{ 0,                                Key_XF86AudioPlay,          spawn,              SHCMD("playerctl play-pause") },
	{ 0,                                Key_XF86AudioNext,          spawn,              SHCMD("playerctl next") },
	{ 0,                                Key_XF86AudioPrev,          spawn,              SHCMD("playerctl previous") },
	{ 0,                                Key_XF86AudioStop,          spawn,              SHCMD("playerctl stop") },
	{ 0,                                Key_XF86New,                togglescratch,      {.v = spnews } },
	{ MODKEY|WLR_MODIFIER_ALT,          Key_Return,                 togglescratch,      {.v = spterm } },
	{ MODKEY|WLR_MODIFIER_ALT,          Key_b,                      togglescratch,      {.v = spbtop } },
	{ MODKEY|WLR_MODIFIER_ALT,          Key_p,                      togglescratch,      {.v = sppuls } },
	{ MODKEY|WLR_MODIFIER_ALT,          Key_m,                      togglescratch,      {.v = spcmus } },
	{ MODKEY|WLR_MODIFIER_ALT,          Key_v,                      togglescratch,      {.v = sprang } },
	{ MODKEY|WLR_MODIFIER_ALT,          Key_r,                      togglescratch,      {.v = spnews } },
	{ MODKEY|WLR_MODIFIER_ALT,          Key_f,                      togglescratch,      {.v = spflix } },
	{ MODKEY|WLR_MODIFIER_ALT,          Key_a,                      togglescratch,      {.v = spanic } },
	{ MODKEY|WLR_MODIFIER_ALT,          Key_y,                      togglescratch,      {.v = spytfz } },
	{ MODKEY|WLR_MODIFIER_ALT,          Key_n,                      togglescratch,      {.v = spytfm } },
	TAGKEYS( Key_1,  0 ),
	TAGKEYS( Key_2,  1 ),
	TAGKEYS( Key_3,  2 ),
	TAGKEYS( Key_4,  3 ),
	TAGKEYS( Key_5,  4 ),
	TAGKEYS( Key_6,  5 ),
	TAGKEYS( Key_7,  6 ),
	TAGKEYS( Key_8,  7 ),
	TAGKEYS( Key_9,  8 ),

	/* Ctrl-Alt-Backspace and Ctrl-Alt-Fx used to be handled by X server */
	{ WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT,Key_BackSpace, quit, {0} },
#define CHVT(KEY,n) { WLR_MODIFIER_CTRL|WLR_MODIFIER_ALT, KEY, chvt, {.ui = (n)} }
	CHVT(Key_F1, 1), CHVT(Key_F2,  2),  CHVT(Key_F3,  3),  CHVT(Key_F4,  4),
	CHVT(Key_F5, 5), CHVT(Key_F6,  6),  CHVT(Key_F7,  7),  CHVT(Key_F8,  8),
	CHVT(Key_F9, 9), CHVT(Key_F10, 10), CHVT(Key_F11, 11), CHVT(Key_F12, 12),
};

static const Button buttons[] = {
	{ MODKEY, BTN_LEFT,   moveresize,     {.ui = CurMove} },
	{ MODKEY, BTN_MIDDLE, togglefloating, {0} },
	{ MODKEY, BTN_RIGHT,  moveresize,     {.ui = CurResize} },
};

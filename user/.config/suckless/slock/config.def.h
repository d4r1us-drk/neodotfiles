/* user and group to drop privileges to */
static const char *user  = "drk";
static const char *group = "drk";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#1d2021",   /* after initialization */
	[INPUT] =  "#076678",   /* during input */
	[FAILED] = "#cc241d",   /* wrong password */
	[PAM] =    "#32302f",   /* waiting for PAM */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* default message */
static const char * message = "This device is locked\neven if you manage to unlock it\nyou wont know how to use it";

/* text color */
static const char * text_color = "#d4c4a1";

/* text size (must be a valid size) */
static const char * font_name = "mtx";

/* Background image path, should be available to the user above */
static const char* background_image = ".config/suckless/slock/lockscreen.png";

/* PAM service that's used for authentication */
static const char* pam_service = "system-local-login";

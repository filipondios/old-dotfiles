#define BORDER_NORMAL   "#222222"
#define BORDER_SELECTED "#3f4445"
#define WORKSPACES    4
#define BORDER_PIXELS 2
#define SNAP 32
#define MFACT 0.5f
#define NMASTER 1
#define RESIZE_HINTS 1
#define LOCK_FULLSCREEN 1

static const Layout layouts[] = {
	{ "[]!",  tile },
	{ "><>",  NULL },
	{ "[M]",  monocle },
};

#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

static const Key keys[] = {
	{ MODKEY,												XK_d,				spawn,					SHCMD("dmenu_run") },
	{ MODKEY,												XK_Return,	spawn,					SHCMD("alacritty") },
	{ MODKEY|ShiftMask,							XK_j,				focusstack,			{.i = +1 } },
	{ MODKEY|ShiftMask,							XK_k,				focusstack,			{.i = -1 } },
	{ MODKEY,												XK_i,				incnmaster,			{.i = +1 } },
	{ MODKEY,												XK_j,				incnmaster,			{.i = -1 } },
	{ MODKEY,												XK_h,				setmfact,				{.f = -0.05} },
	{ MODKEY,												XK_l,				setmfact,				{.f = +0.05} },
	{ MODKEY|ShiftMask,							XK_Return,	zoom,						{0} },
	{ MODKEY,												XK_Tab,			view,						{0} },
	{ MODKEY,												XK_q,				killclient,			{0} },
	{ MODKEY,												XK_t,				setlayout,			{.v = &layouts[0]} },
	{ MODKEY,												XK_f,				setlayout,			{.v = &layouts[1]} },
	{ MODKEY,												XK_m,				setlayout,			{.v = &layouts[2]} },
	{ MODKEY,												XK_space,		setlayout,			{0} },
	{ MODKEY|ShiftMask,							XK_space,		togglefloating,	{0} },
	{ MODKEY,												XK_0,				view,						{.ui = ~0 } },
	{ MODKEY|ShiftMask,							XK_0,				tag,						{.ui = ~0 } },
	{ MODKEY,												XK_comma,		focusmon,				{.i = -1 } },
	{ MODKEY,												XK_period,	focusmon,				{.i = +1 } },
	{ MODKEY|ShiftMask,							XK_comma,		tagmon,					{.i = -1 } },
	{ MODKEY|ShiftMask,							XK_period,	tagmon,					{.i = +1 } },
	TAGKEYS(												XK_1,												0)
	TAGKEYS(												XK_2,												1)
	TAGKEYS(												XK_3,												2)
	TAGKEYS(												XK_4,												3)
	{ MODKEY|ShiftMask,							XK_q,				quit,						{0} },
};

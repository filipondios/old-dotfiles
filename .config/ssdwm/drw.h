
typedef struct {
	Cursor cursor;
} Cur;

enum { ColFg, ColBg, ColBorder }; /* Clr scheme index */
typedef XftColor Clr;

typedef struct {
	unsigned int w, h;
	Display *dpy;
	int screen;
	Window root;
	Drawable drawable;
	GC gc;
	Clr *scheme;
} Drw;

/* Drawable abstraction */
Drw* drw_create(Display *dpy, int screen, Window win, unsigned int w, unsigned int h);
void drw_resize(Drw *drw, unsigned int w, unsigned int h);
void drw_free(Drw *drw);

/* Colorscheme abstraction */
void drw_clr_create(Drw *drw, Clr *dest, const char *clrname);

/* Cursor abstraction */
Cur *drw_cur_create(Drw *drw, int shape);
void drw_cur_free(Drw *drw, Cur *cursor);

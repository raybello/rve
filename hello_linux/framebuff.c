/*
 * framebuff.c – multi-pattern framebuffer renderer
 *
 * Usage: ./framebuff <1-10>
 *   1   SMPTE colour bars
 *   2   HSV gradient
 *   3   Mandelbrot set
 *   4   Plasma (sine-wave interference)
 *   5   3-D wireframe cube
 *   6   Rainbow concentric rings
 *   7   HSV colour wheel
 *   8   Sierpinski triangle
 *   9   Julia set  (c = -0.4 + 0.6i)
 *  10   Lissajous figures
 */
#include <fcntl.h>
#include <linux/fb.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <unistd.h>

#define PI 3.14159265f

/* ------------------------------------------------------------------ */
/* Globals                                                              */
/* ------------------------------------------------------------------ */
static uint8_t *g_buf;
static int      g_w, g_h;

/* ------------------------------------------------------------------ */
/* Primitives                                                           */
/* ------------------------------------------------------------------ */
static void pset(int x, int y, uint8_t r, uint8_t g, uint8_t b)
{
    if ((unsigned)x >= (unsigned)g_w || (unsigned)y >= (unsigned)g_h) return;
    int off = (y * g_w + x) * 4;
    g_buf[off+0] = r; g_buf[off+1] = g; g_buf[off+2] = b; g_buf[off+3] = 0xff;
}

static void fill_rect(int x0, int y0, int x1, int y1,
                      uint8_t r, uint8_t g, uint8_t b)
{
    if (x0 < 0) x0 = 0; if (y0 < 0) y0 = 0;
    if (x1 > g_w) x1 = g_w; if (y1 > g_h) y1 = g_h;
    for (int y = y0; y < y1; y++)
        for (int x = x0; x < x1; x++) {
            int off = (y * g_w + x) * 4;
            g_buf[off+0]=r; g_buf[off+1]=g; g_buf[off+2]=b; g_buf[off+3]=0xff;
        }
}

static void clear(void) { fill_rect(0, 0, g_w, g_h, 0, 0, 0); }

/* Bresenham line */
static void draw_line(int x0, int y0, int x1, int y1,
                      uint8_t r, uint8_t g, uint8_t b)
{
    int dx = abs(x1-x0), sx = x0<x1 ? 1 : -1;
    int dy = -abs(y1-y0), sy = y0<y1 ? 1 : -1;
    int err = dx+dy;
    for (;;) {
        pset(x0, y0, r, g, b);
        if (x0==x1 && y0==y1) break;
        int e2 = err<<1;
        if (e2 >= dy) { if (x0==x1) break; err+=dy; x0+=sx; }
        if (e2 <= dx) { if (y0==y1) break; err+=dx; y0+=sy; }
    }
}

/* HSV [0,1] → RGB [0,255] */
static void hsv2rgb(float h, float s, float v,
                    uint8_t *r, uint8_t *g, uint8_t *b)
{
    float c = v*s;
    float x = c * (1.0f - fabsf(fmodf(h*6.0f, 2.0f) - 1.0f));
    float m = v-c;
    float r1,g1,b1;
    int hi = (int)(h*6.0f) % 6;
    if      (hi==0){r1=c;g1=x;b1=0;}
    else if (hi==1){r1=x;g1=c;b1=0;}
    else if (hi==2){r1=0;g1=c;b1=x;}
    else if (hi==3){r1=0;g1=x;b1=c;}
    else if (hi==4){r1=x;g1=0;b1=c;}
    else           {r1=c;g1=0;b1=x;}
    *r = (uint8_t)((r1+m)*255.0f);
    *g = (uint8_t)((g1+m)*255.0f);
    *b = (uint8_t)((b1+m)*255.0f);
}

/* Integer square root */
static int isqrt(int n)
{
    if (n <= 0) return 0;
    int x = n, y = (x+1)/2;
    while (y < x) { x = y; y = (x + n/x) / 2; }
    return x;
}

/* Sin lookup table [-127,127], 256 entries for one full period */
static int8_t sin_tab[256];
static void sin_tab_init(void)
{
    for (int i = 0; i < 256; i++)
        sin_tab[i] = (int8_t)(sinf(i * 2.0f * PI / 256.0f) * 127.0f);
}

/* ================================================================== */
/* Pattern 1 – SMPTE colour bars                                       */
/* ================================================================== */
static void pat_smpte(void)
{
    int w=g_w, h=g_h, y1=h*7/12, y2=h*8/12;

    static const uint8_t top[7][3] = {
        {191,191,191}, /* 75% White   */
        {191,191,  0}, /* 75% Yellow  */
        {  0,191,191}, /* 75% Cyan    */
        {  0,191,  0}, /* 75% Green   */
        {191,  0,191}, /* 75% Magenta */
        {191,  0,  0}, /* 75% Red     */
        {  0,  0,191}, /* 75% Blue    */
    };
    static const uint8_t mid[7][3] = {
        {  0,  0,191}, /* Blue    */
        {  0,  0,  0}, /* Black   */
        {191,  0,191}, /* Magenta */
        {  0,  0,  0}, /* Black   */
        {  0,191,191}, /* Cyan    */
        {  0,  0,  0}, /* Black   */
        {191,191,191}, /* Gray    */
    };
    for (int i = 0; i < 7; i++) {
        int x0 = w*i/7, x1 = w*(i+1)/7;
        fill_rect(x0, 0,  x1, y1, top[i][0], top[i][1], top[i][2]);
        fill_rect(x0, y1, x1, y2, mid[i][0], mid[i][1], mid[i][2]);
    }
    int bw = w/4;
    fill_rect(0,    y2, bw,   h,  0,  0,128);
    fill_rect(bw,   y2, bw*2, h, 255,255,255);
    fill_rect(bw*2, y2, bw*3, h,  75,  0,128);
    fill_rect(bw*3, y2, w,    h,  0,  0,  0);
}

/* ================================================================== */
/* Pattern 2 – Smooth HSV gradient (hue=X, brightness=Y)              */
/* ================================================================== */
static void pat_gradient(void)
{
    for (int y = 0; y < g_h; y++)
        for (int x = 0; x < g_w; x++) {
            uint8_t r,g,b;
            hsv2rgb((float)x/g_w, 1.0f, 1.0f - (float)y/g_h, &r,&g,&b);
            pset(x, y, r, g, b);
        }
}

/* ================================================================== */
/* Pattern 3 – Mandelbrot set  (fixed-point 4.12)                     */
/* ================================================================== */
static void pat_mandelbrot(void)
{
#define FP 12
#define FS (1<<FP)
    int32_t re_min = (int32_t)(-2.5f*FS), re_max = (int32_t)(1.0f*FS);
    int32_t im_min = (int32_t)(-1.25f*FS), im_max = (int32_t)(1.25f*FS);
    const int MAXITER = 80;
    const int32_t ESCAPE = 4*FS;

    for (int py = 0; py < g_h; py++) {
        int32_t cim = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
        for (int px = 0; px < g_w; px++) {
            int32_t cre = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
            int32_t zr=0, zi=0;
            int iter=0;
            while (iter < MAXITER) {
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FP);
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FP);
                if (zr2+zi2 > ESCAPE) break;
                int32_t tmp = zr2 - zi2 + cre;
                zi = (int32_t)(((int64_t)zr*zi) >> (FP-1)) + cim;
                zr = tmp;
                iter++;
            }
            if (iter == MAXITER) { pset(px,py, 0,0,0); }
            else {
                uint8_t r,g,b;
                hsv2rgb((float)iter/MAXITER, 0.9f, 1.0f, &r,&g,&b);
                pset(px, py, r, g, b);
            }
        }
    }
#undef FP
#undef FS
}

/* ================================================================== */
/* Pattern 4 – Plasma (overlapping sine-wave interference)             */
/* ================================================================== */
static void pat_plasma(void)
{
    sin_tab_init();
    for (int y = 0; y < g_h; y++)
        for (int x = 0; x < g_w; x++) {
            int a = (x*3 + y)     & 255;
            int b = (x   + y*3)   & 255;
            int c = (x*2 + y*2+128) & 255;
            /* sum is in [-381,381]; shift to [0,762] */
            int v = (int)sin_tab[a] + (int)sin_tab[b] + (int)sin_tab[c] + 381;
            uint8_t r,g,bl;
            hsv2rgb((float)v / 762.0f, 1.0f, 1.0f, &r,&g,&bl);
            pset(x, y, r, g, bl);
        }
}

/* ================================================================== */
/* Pattern 5 – 3-D wireframe cube                                      */
/* ================================================================== */
static void pat_cube(void)
{
    static const float vraw[8][3] = {
        {-1,-1,-1},{1,-1,-1},{1,1,-1},{-1,1,-1},
        {-1,-1, 1},{1,-1, 1},{1,1, 1},{-1,1, 1},
    };
    static const int edges[12][2] = {
        {0,1},{1,2},{2,3},{3,0},   /* back  */
        {4,5},{5,6},{6,7},{7,4},   /* front */
        {0,4},{1,5},{2,6},{3,7},   /* sides */
    };
    static const uint8_t ecol[12][3] = {
        {255, 80, 80},{255, 80, 80},{255, 80, 80},{255, 80, 80},
        { 80,255, 80},{ 80,255, 80},{ 80,255, 80},{ 80,255, 80},
        { 80, 80,255},{ 80, 80,255},{ 80, 80,255},{ 80, 80,255},
    };

    clear();

    float ay = 35.0f*PI/180.0f, ax = 20.0f*PI/180.0f;
    float cy = cosf(ay), sy = sinf(ay);
    float cx = cosf(ax), sx = sinf(ax);
    float fov = 400.0f, dist = 3.0f;

    int px[8], py[8];
    for (int i = 0; i < 8; i++) {
        float x = vraw[i][0], y = vraw[i][1], z = vraw[i][2];
        float x1 =  x*cy - z*sy;
        float z1 =  x*sy + z*cy;
        float y2 =  y*cx - z1*sx;
        float z2 =  y*sx + z1*cx;
        float proj = fov / (dist + z2);
        px[i] = (int)(x1*proj) + g_w/2;
        py[i] = (int)(y2*proj) + g_h/2;
    }
    for (int i = 0; i < 12; i++) {
        int a = edges[i][0], b = edges[i][1];
        /* draw 3 parallel lines for thickness */
        draw_line(px[a],   py[a],   px[b],   py[b],   ecol[i][0],ecol[i][1],ecol[i][2]);
        draw_line(px[a]+1, py[a],   px[b]+1, py[b],   ecol[i][0],ecol[i][1],ecol[i][2]);
        draw_line(px[a],   py[a]+1, px[b],   py[b]+1, ecol[i][0],ecol[i][1],ecol[i][2]);
    }
}

/* ================================================================== */
/* Pattern 6 – Rainbow concentric rings                                */
/* ================================================================== */
static void pat_rings(void)
{
    int cx = g_w/2, cy = g_h/2;
    for (int y = 0; y < g_h; y++)
        for (int x = 0; x < g_w; x++) {
            int dx = x-cx, dy = y-cy;
            int dist = isqrt(dx*dx + dy*dy);
            uint8_t r,g,b;
            hsv2rgb((float)(dist % 48) / 48.0f, 1.0f, 1.0f, &r,&g,&b);
            pset(x, y, r, g, b);
        }
}

/* ================================================================== */
/* Pattern 7 – HSV colour wheel                                        */
/* ================================================================== */
static void pat_wheel(void)
{
    int cx = g_w/2, cy = g_h/2;
    int maxr = (cx < cy ? cx : cy);
    for (int y = 0; y < g_h; y++)
        for (int x = 0; x < g_w; x++) {
            int dx = x-cx, dy = y-cy;
            int r = isqrt(dx*dx + dy*dy);
            if (r > maxr) { pset(x,y, 0,0,0); continue; }
            float hue = (atan2f((float)dy, (float)dx) + PI) / (2.0f*PI);
            float sat = (float)r / maxr;
            uint8_t rv,gv,bv;
            hsv2rgb(hue, sat, 1.0f, &rv,&gv,&bv);
            pset(x, y, rv, gv, bv);
        }
}

/* ================================================================== */
/* Pattern 8 – Sierpinski triangle (Pascal's triangle mod 2)           */
/* ================================================================== */
static void pat_sierpinski(void)
{
    /* Map pixel coords to a power-of-2 grid then apply (row & col)==0 */
    int sz = 1;
    while (sz < g_h) sz <<= 1;

    for (int y = 0; y < g_h; y++) {
        int row = (int)((int64_t)y * sz / g_h);
        for (int x = 0; x < g_w; x++) {
            int col = (int)((int64_t)x * sz / g_w);
            if ((row & col) == 0) {
                uint8_t r,g,b;
                hsv2rgb((float)(row ^ col) / (float)sz, 1.0f, 1.0f, &r,&g,&b);
                pset(x, y, r, g, b);
            } else {
                pset(x, y, 0, 0, 0);
            }
        }
    }
}

/* ================================================================== */
/* Pattern 9 – Julia set  (c = -0.4 + 0.6i, fixed-point 4.12)        */
/* ================================================================== */
static void pat_julia(void)
{
#define FPJ 12
#define FSJ (1<<FPJ)
    int32_t cre = (int32_t)(-0.4f*FSJ), cim = (int32_t)(0.6f*FSJ);
    int32_t re_min = (int32_t)(-1.6f*FSJ), re_max = (int32_t)(1.6f*FSJ);
    int32_t im_min = (int32_t)(-0.9f*FSJ), im_max = (int32_t)(0.9f*FSJ);
    const int MAXITER = 80;
    const int32_t ESCAPE = 4*FSJ;

    for (int py = 0; py < g_h; py++) {
        int32_t im0 = im_min + (int32_t)((int64_t)(im_max-im_min)*py/g_h);
        for (int px = 0; px < g_w; px++) {
            int32_t zr = re_min + (int32_t)((int64_t)(re_max-re_min)*px/g_w);
            int32_t zi = im0;
            int iter = 0;
            while (iter < MAXITER) {
                int32_t zr2 = (int32_t)((int64_t)zr*zr >> FPJ);
                int32_t zi2 = (int32_t)((int64_t)zi*zi >> FPJ);
                if (zr2+zi2 > ESCAPE) break;
                int32_t tmp = zr2 - zi2 + cre;
                zi = (int32_t)(((int64_t)zr*zi) >> (FPJ-1)) + cim;
                zr = tmp;
                iter++;
            }
            if (iter == MAXITER) { pset(px,py, 0,0,0); }
            else {
                uint8_t r,g,b;
                hsv2rgb((float)iter/MAXITER, 1.0f, 0.9f, &r,&g,&b);
                pset(px, py, r, g, b);
            }
        }
    }
#undef FPJ
#undef FSJ
}

/* ================================================================== */
/* Pattern 10 – Lissajous figures                                      */
/* ================================================================== */
static void pat_lissajous(void)
{
    clear();
    sin_tab_init();

    int cx = g_w/2, cy = g_h/2;
    int rx = g_w*2/5, ry = g_h*2/5;

    static const struct { int a, q, phase; uint8_t r, g, b; } curves[] = {
        {3, 2,   0, 255,  80,  80},
        {4, 3,  64,  80, 255,  80},
        {5, 4, 128,  80,  80, 255},
        {5, 3,  32, 255, 255,  80},
        {7, 4,  96, 255,  80, 255},
    };
    int ncurves = (int)(sizeof(curves)/sizeof(curves[0]));
    const int STEPS = 8192;

    for (int ci = 0; ci < ncurves; ci++) {
        for (int t = 0; t < STEPS; t++) {
            int ai = (curves[ci].a * t * 256 / STEPS) & 255;
            int bi = (curves[ci].q * t * 256 / STEPS + curves[ci].phase) & 255;
            int x = cx + rx * (int)sin_tab[ai] / 128;
            int y = cy + ry * (int)sin_tab[bi] / 128;
            /* 2×2 dot for visibility */
            pset(x,   y,   curves[ci].r, curves[ci].g, curves[ci].b);
            pset(x+1, y,   curves[ci].r, curves[ci].g, curves[ci].b);
            pset(x,   y+1, curves[ci].r, curves[ci].g, curves[ci].b);
            pset(x+1, y+1, curves[ci].r, curves[ci].g, curves[ci].b);
        }
    }
}

/* ================================================================== */
/* main                                                                 */
/* ================================================================== */
int main(int argc, char *argv[])
{
    if (argc < 2) {
        printf("Usage: framebuff <1-10>\n"
               "  1  SMPTE bars          6  Rainbow rings\n"
               "  2  HSV gradient        7  HSV colour wheel\n"
               "  3  Mandelbrot set      8  Sierpinski triangle\n"
               "  4  Plasma              9  Julia set\n"
               "  5  3D cube            10  Lissajous\n");
        return 1;
    }

    int pat = atoi(argv[1]);
    if (pat < 1 || pat > 10) { printf("Pattern must be 1-10\n"); return 1; }

    int fd = open("/dev/fb0", O_RDWR);
    if (fd < 0) { printf("framebuff: open /dev/fb0 failed\n"); return 1; }

    struct fb_var_screeninfo vinfo;
    if (ioctl(fd, FBIOGET_VSCREENINFO, &vinfo) < 0) {
        printf("framebuff: ioctl failed\n"); close(fd); return 1;
    }

    g_w = (int)vinfo.xres;
    g_h = (int)vinfo.yres;
    int size = g_w * g_h * 4;

    g_buf = malloc(size);
    if (!g_buf) { printf("framebuff: malloc failed\n"); close(fd); return 1; }

    switch (pat) {
    case  1: pat_smpte();      break;
    case  2: pat_gradient();   break;
    case  3: pat_mandelbrot(); break;
    case  4: pat_plasma();     break;
    case  5: pat_cube();       break;
    case  6: pat_rings();      break;
    case  7: pat_wheel();      break;
    case  8: pat_sierpinski(); break;
    case  9: pat_julia();      break;
    case 10: pat_lissajous();  break;
    }

    static const char *names[] = {
        "", "SMPTE bars", "HSV gradient", "Mandelbrot set", "Plasma",
        "3D cube", "Rainbow rings", "HSV colour wheel",
        "Sierpinski triangle", "Julia set", "Lissajous",
    };
    printf("framebuff: %s rendered (%dx%d)\n", names[pat], g_w, g_h);
    lseek(fd, 0, SEEK_SET);
    write(fd, g_buf, size);

    free(g_buf);
    close(fd);
    return 0;
}

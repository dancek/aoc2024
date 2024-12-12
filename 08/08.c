#include<stdio.h>
#define oob(x,y) (x<0||x>=sz||y<0||y>=sz)
char ant[9999],n1[9999],n2[9999]; int sz,crds[256][5];

void addc(char c, int crd) { int i=0;
    while(crds[c][i]>0) i++;
    crds[c][i] = crd; }
void read() { int i=0,c;
    while((c=getchar())) {
        if (c<0) return;
        if (c=='\n') { if (!sz) sz=i; }
        else { if (c!='.') addc(c,i);
               ant[i++] = c; }}}
int addn(char* nd, int x, int y) {
    if (oob(x,y)) return 0;
    nd[y*sz + x]++; return 1;}
void addns(int x, int y, int dx, int dy) { int s=x,t=y;
    addn(n1, x-dx, y-dy); addn(n1, x+2*dx, y+2*dy);
    while (!oob(s,t)) { addn(n2,s,t); s-=dx; t-=dy; } s=x;t=y;
    while (!oob(s,t)) { addn(n2,s,t); s+=dx; t+=dy; }}
void nods(char c) { int cnt=0,i,j,x,y,X,Y,a,b,dx,dy;
    while(crds[c][cnt]>0) cnt++;
    for (i=0;i<cnt;i++) for(j=i+1;j<cnt;j++) {
        a=crds[c][i]; b=crds[c][j];
        X=a%sz; Y=a/sz; x=b%sz; y=b/sz; dx=x-X; dy=y-Y;
        addns(X, Y, dx, dy); }}

int main() { int s1=0,s2=0;
    read();
    for (int c=0; c<256; c++) nods(c);
    for (int i=0; i<sz*sz; i++) { if(n1[i])s1++; if(n2[i])s2++; }
    printf("%d %d\n", s1, s2); }

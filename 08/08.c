#include<stdio.h>
char ant[9999],nod[9999]; int sz, crds[256][5];

void addc(char c, int crd) { int i=0;
    printf("addc %c %d\n", c,crd);
    while(crds[c][i]>0) i++;
    crds[c][i] = crd; }
void read() { int i=0, c;
    while((c=getchar())) {
        if (c<0) return;
        if (c=='\n') { if (!sz) sz=i;
        }else{ if (c!='.') addc(c,i);
            ant[i++] = c;}}}
void addn(int x, int y) {
    if (x<0 || y<0 || x>=sz || y>=sz) return;
    printf("nod %d,%d\n", x,y);
    nod[y*sz + x]++;}
void nods(char c) { int cnt=0,i,j,x,y,X,Y,a,b,dx,dy;
    while(crds[c][cnt]>0) printf("crds %c %d\n", c, crds[c][cnt++]);
    for (i=0;i<cnt;i++) for(j=i+1;j<cnt;j++) {
        a=crds[c][i]; b=crds[c][j];
        X=a%sz; Y=a/sz; x=b%sz; y=b/sz; dx=x-X; dy=y-Y;
        printf("%c %d:%d,%d %d:%d,%d\n", c,a,X,Y,b,x,y);
        addn(X-dx, Y-dy); addn(x+dx, y+dy); }}

int main() { int nodes=0;
    read();
    for (int c=0; c<256; c++) nods(c);
    for (int i=0; i<sz*sz; i++) if (nod[i])nodes++;
    for (int y=0;y<sz;y++) {
        for (int x=0;x<sz;x++) {
            int i=y*sz+x;
            if (nod[i]!=0) printf("#");
            else printf("%c", ant[i]); }
        printf("\n"); }
    printf("%d nodes\n", nodes); }

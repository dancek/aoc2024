#include<stdio.h>
#include<stdlib.h>

C(int*a,int*b){return *a-*b;}

R(){int n=0,c,s=1;
    while((c=getchar())>47||s) {
        if (c<0) return c;
        if (c>47){s=0;
            n=10*n+(c-'0');}}
    return n;}

main(){int a[1001],b[1001], p,r,i,m,e;
    p=0;do{ a[p]=R(); b[p]=R();
    }while( a[p]>0 &&++p);
    qsort(a,p,4,C); qsort(b,p,4,C);
#define L(_)for(e=_=0;_<p;_++)
    L(i) m+=abs(a[i]-b[i]);
    printf("%d\n",m);
    m=0;L(i){
        L(r) if(a[i]==b[r])e++;
        m+=a[i]*e;}
    printf("%d\n",m);
}

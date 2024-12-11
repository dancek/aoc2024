s=v=>""+v; l=v=>s(v).length; h=(v,i)=>+s(v).slice(i*l(v)/2,(i+1)*l(v)/2)
b=v=> v==0 ? [1] : l(v)%2 ? [2024*v] : [h(v,0),h(v,1)]
F=(n,x)=> {v=S(n-1,b(x)); c[n]=c[n]??{};c[n][x]=v; return v}
c={}; C=(n,x)=> n==0 ? 1 : c?.[n]?.[x] ?? F(n,x)
S=(n,xs)=> xs.map(x=>C(n,x)).reduce((a,b)=>a+b)

I=[8793800,1629,65,5,960,0,138983,85629]
console.log(S(25,I), S(75,I))

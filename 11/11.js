s=v=>""+v; l=v=>s(v).length; h=(v,i)=>+s(v).slice(i*l(v)/2,(i+1)*l(v)/2)
Θ=v=> v==0 ? [1] : l(v)%2 ? [2024*v] : [h(v,0),h(v,1)]
c={}; C=(n,x)=> n==0 ? 1 : c?.[n]?.[x] ?? ℂ(n,x)
ℂ=(n,x)=> {v=Σ(n-1,Θ(x)); c[n]=c[n]??{};c[n][x]=v; return v}
Σ=(n,xs)=> xs.map(x=>C(n,x)).reduce((a,b)=>a+b)

I=[8793800,1629,65,5,960,0,138983,85629]
console.log(Σ(25,I), Σ(75,I))

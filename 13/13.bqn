in ← ('0'+↕10)⊸(•ParseFloat¨(¬-˜⊢×·+`»⊸>)∘∊˜⊔⊢)¨•FLines"/dev/stdin"
probs ← ∘‿3⥊(0≠≠)¨⊸/in

#          k(A + n*B) = k(S)
# (xa+n*xb)/(ya+n*yb) = xs/ys
#       ys(xa + n*xb) = xs(ya + n*yb)
#     ys*xa + n*ys*xb = xs*ya + n*xs*yb
#   n*(ys*xb - xs*yb) = xs*ya - ys*xa
#                   n = (xs*ya - ys*xa)/(ys*xb - xs*yb)
Round ← {⌊0.5+𝕩}
Solve ← {𝕊 a‿b‿s:
  ⟨xa‿ya,xb‿yb,xs‿ys⟩ ← a‿b‿s
  k ← ((xs×ya)-(ys×xa))÷((ys×xb)-(xs×yb))
  ca ← Round ⊑s÷a+k×b
  cb ← Round k×ca
  {s≡(ca×a)+cb×b ? ca‿cb ; 0‿0}
}
•Show +´⥊ 3‿1⊸×˘ Solve˘ probs
•Show +´⥊ 3‿1⊸×˘ Solve˘ (10000000000000⊸+)⌾(2⊸⊏˘)probs

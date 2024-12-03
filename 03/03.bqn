in←•FChars"sample"

Mask ← {+´⌽⟜((≠𝕩)↑𝕨⍷𝕩)¨(-↕≠𝕨)}
Combine ← +´(⊢×1+↕∘≠)

tokens ← "mul("‿")"‿","∾'0'+↕10

m ← Combine Mask⟜in¨tokens

# quick visualization
•Show in ≍ ' '+ (('('-' ')×1=m) + ((')'-' ')×2=m) + ('-'-' ')×2<m

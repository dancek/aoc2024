_fixp ← {𝕊∘⊢⍟≢⟜𝔽𝕩}
ZInf ← {𝕊0:∞; 𝕩}
in ← "-1234567890"⊸(•ParseFloat¨(¬-˜⊢×·+`»⊸>)∘∊˜⊔⊢)¨•FLines"input"
e ← 71‿71↑0
dist ← 0⌾⊑∞¨e
mv ← ⟨»˘,»,«˘,«⟩

Solve ← {𝕊bs:
  w ← ⍉⌈´{∞⌾(𝕩⊸⊑)e}¨bs↑in
  Step ← {𝕊d:
    w⌈d⌊⌊´{ZInf¨ 𝕏 d+1}¨mv
  }
  ¯1⊑⥊ Step _fixp dist
}
•Show Solve 1024
{𝕊⋄ •Show ⟨𝕩,Solve 𝕩⟩}¨1024+↕1024-˜≠in

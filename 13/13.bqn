in ← ('0'+↕10)⊸(•ParseFloat¨(¬-˜⊢×·+`»⊸>)∘∊˜⊔⊢)¨•FLines"input"
Solve ← {𝕊 a‿b‿s:
  max ← ⌈⌈´s÷a
  asum ← a×⌜↕max
  bdiv ← b÷˜s-asum
  acnts ← /((∧˝⌊⊸=)∧=˝)bdiv
  {0=≠acnts ? 0‿0 ;
   acnt ← ⊑acnts
   bcnt ← ⊑acnt⊏˘bdiv
   acnt‿bcnt}
}
probs ← ∘‿3⥊(0≠≠)¨⊸/in
+´⥊ 3‿1⊸×˘ Solve˘ probs

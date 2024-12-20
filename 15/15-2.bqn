inm‿inc ← {(+`0=≠¨𝕩)⊔𝕩}•Flines"/dev/stdin"
p1‿b1‿w1 ← (>inm)⊸=¨"@O#"
wall ← ⍉>2/<˘⍉w1
z ← ⊏⍉p1
pos ← ⍉∾´≍⟜z¨<˘⍉p1
box ← ⍉∾´≍⟜z¨<˘⍉b1
cmds ← "^>v<"⊐∾´inc
coords ← +´¨100‿1⊸×¨↕≢pos

Display ← {𝕊p‿b‿w: ⊑⟜".@[]#    "¨p+(2×b)+(3×»˘b)+(4×w)}
mv ← ⟨«,»˘,»,«˘⟩
boxMv ← ⟨{(«˘∨⊢∨»˘)«𝕩}, »˘⍟2, {(«˘∨⊢∨»˘)»𝕩}, «˘⍟2⟩
boxFstMv ← ⟨{(«˘∨⊢)«𝕩}, »˘, {(«˘∨⊢)»𝕩}, «˘⍟2⟩
boxWallMv ← ⟨{(⊢∨»˘)«𝕩}, »˘⍟2, {(⊢∨»˘)»𝕩}, «˘⟩
Step ← {𝕊cmd:
  M ← cmd◶Mv
  BM ← cmd◶BoxMv
  BFM ← cmd◶BoxFstMv
  BWM ← cmd◶BoxWallMv
  p ← M pos
  b ← {𝕩∨box∧BM𝕩}•_while_{∨´⥊box∧(¬𝕩)∧BM𝕩}box∧BFM pos
  ¬∨´⥊ (wall∧BWM b) ∨ wall∧p ?
    pos ↩ p
    box ↩ (M b)∨box∧¬b
    #•Show cmd∾b⋈Display pos‿box‿wall
  ;@}
Step¨cmds
•Show +´⥊box×coords

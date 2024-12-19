inm‿inc ← {(+`0=≠¨𝕩)⊔𝕩}•Flines"/dev/stdin"
pos‿box‿wall ← (>inm)⊸=¨"@O#"
cmds ← "^>v<"⊐∾´inc
mv ← ⟨«,»˘,»,«˘⟩
coords ← +´¨100‿1⊸×¨↕≢pos

Display ← {𝕊p‿b‿w: ⊑⟜".@O#"¨p+(2×b)+3×w}
Step ← {𝕊cmd:
  M ← cmd◶mv
  p ← M pos
  b ← {𝕩∨M𝕩}•_while_{∨´⥊box∧(¬𝕩)∧M𝕩}box∧p
  ¬∨´⥊ (wall∧M b) ∨ wall∧p ?
    pos ↩ p
    box ↩ (M b)∨box∧¬b
    #•Show Display pos‿box‿wall
  ;@}
Step¨cmds
•Show +´⥊box×coords

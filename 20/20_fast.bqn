_fixp ← {𝔽∘⊢⍟≢⟜𝔽_𝕣∘⊢⍟≢⟜𝔽𝕩}
Shift ← {𝕨<0? «⍟(-𝕨) 𝕩; »⍟𝕨 𝕩}
in ← >•Flines"input"
wall‿start‿end ← in⊸=¨"#SE"
cor ← ¬wall

mv ← ⟨»˘,»,«˘,«⟩
Step ← {cor 𝕊 dist:
  (dist×¬cor) + dist⌊⌊´{cor × 𝕏 dist+1}¨mv
}
d ← cor⊸Step _fixp (¯999999×start)+0¨in
CheatSaves ← {𝕊x‿y: s←(|x)+|y
  -⟜s {(𝕩<499999) ∧ s<𝕩}⊸/⥊ cor× d- x⊸Shift˘ y⊸Shift d}
MDist ← {𝕊d: {d≥+´|𝕩}¨⊸/⥊ -⟜d ↕{1+2×d‿d}}
•Show +´100≤∾´CheatSaves¨MDist 2
•Show +´100≤∾´CheatSaves¨MDist 20

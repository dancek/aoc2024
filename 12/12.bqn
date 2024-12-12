in ← >•FLines"input"
e  ← (≢in)↑0
h  ← e
tp ← 0

mv    ← ⟨»,»˘,«,«˘⟩
Fill  ← {𝕊p: p∨ ∨´{(𝕏p) ∧ in=𝕏 in}¨mv}
_fixp ← {𝕊∘⊢⍟≢⟜𝔽𝕩}

Next ← {𝕊
  i  ← ⊑⍋⥊h
  a  ← 1⌾(i⊸⊑∘⥊)e
  p  ← Fill _fixp a
  fs ← +´{p>𝕏p}¨mv
  tp +↩ (+´⥊p) × +´⥊fs
  h  ∨↩ p
}

{𝕊⋄Next@}•_while_{𝕊⋄¬∧´⥊h}@
•Show tp

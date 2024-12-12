in ← >•FLines"/dev/stdin"
e  ← (≢in)↑0
h  ← e
t1 ← t2 ← 0

mv    ← ⟨»,»˘,«,«˘⟩
Fill  ← {𝕊p: p∨ ∨´{(𝕏p) ∧ in=𝕏 in}¨mv}
_fixp ← {𝕊∘⊢⍟≢⟜𝔽𝕩}

Next ← {𝕊
  i  ← ⊑⍋⥊h
  a  ← 1⌾(i⊸⊑∘⥊)e
  p  ← Fill _fixp a
  fs ← +´{p>𝕏p}¨mv
  es ← +´⥊+´{⍉>⟜𝕏⍉p>𝕏p}¨mv
  t1 +↩ (+´⥊p) × +´⥊fs
  t2 +↩ (+´⥊p) × es
  h  ∨↩ p
}

{𝕊⋄Next@}•_while_{𝕊⋄¬∧´⥊h}@
•Show t1
•Show t2

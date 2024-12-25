_fixp ← {𝕊∘⊢⍟≢⟜𝔽𝕩}
in ← (2⊸↑⋈3⊸↓)¨•FLines"input"
nb ← ⟨⟩•HashMap⟨⟩
Add ← {𝕊 a‿b: a nb.Set ∧(<b) ∾ ⟨⟩ nb.Get a}
Add¨in
Add∘⌽¨in
ts ← ('t'=⊑)¨⊸/∧nb.Keys@
Clique3s ← {𝕊 name:
  xs ← nb.Get name
  ⍷∾´{𝕩⊸{∧⟨name,𝕩,𝕨⟩}¨{𝕩∊xs}⊸/ nb.Get 𝕩}¨xs}
c3s ← ⍷∾´Clique3s¨ts
•Show ≠c3s
LargerCliques ← {⍷(@⊸≢)¨⊸/⥊𝕩{c𝕊k‿vs: {∧´c∊vs ? ∧c∾<k; @}}⌜<˘⍉(nb.Keys@)≍(nb.Values@)}
# such naive much wait (~80s runtime; generate all cliques in an array'y way)
•Show 1↓∾´','⊸∾¨⊑ {𝕊c: d ← LargerCliques c ⋄ {0=≠d?c;d}} _fixp ⋈¨nb.Keys@

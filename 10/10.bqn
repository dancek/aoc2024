_fixp ← {𝔽∘⊢⍟≢⟜𝔽_𝕣∘⊢⍟≢⟜𝔽𝕩}
SplitMask ← {𝕊m: {(≢m)⥊1⌾(𝕩⊸⊑)0¨⥊m}¨/⥊m}
in ← '0'-˜>•FLines"/dev/stdin"
ths ← SplitMask 0=in
mv ← ⟨»˘,»,«˘,«⟩
Step ← {map 𝕊 trail: (∨´⥊)¨⊸/{(𝕏 trail) × map=𝕏 map+1}¨mv}
Steps ← {map 𝕊 trails: ∾{∨´⥊9=map×𝕩 ? ⋈𝕩 ; map Step 𝕩}¨trails}
Score ← {+´⥊∨´ in⊸Steps _fixp ⋈𝕩}
Rating ← {+´⥊+´in⊸Steps _fixp ⋈𝕩}
•Show +´Score¨ths
•Show +´Rating¨ths

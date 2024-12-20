_fixp ← {𝔽∘⊢⍟≢⟜𝔽_𝕣∘⊢⍟≢⟜𝔽𝕩}
in ← >•Flines"input"
wall‿start‿end ← in⊸=¨"#SE"
cor ← ¬wall

mv ← ⟨»˘,»,«˘,«⟩
mvI ← ⟨«˘,«,»˘,»⟩

Step ← {cor 𝕊 dist:
  (dist×¬cor) + dist⌊⌊´{cor × 𝕏 dist+1}¨mv
}
dist ← cor⊸Step _fixp (¬start)×999999¨in
Distance ← {𝕊 cor: +´⥊end × cor⊸Step _fixp dist}
cheatmask ← ∨´{wall ∧ (𝕩◶MvI cor) ∧ 𝕩◶Mv cor}¨↕4
cheats ← {(≢in)⥊1⌾(𝕩⊸⊑)0¨⥊in}¨/⥊cheatmask
base ← Distance cor
•Show base⋈≠cheats
save ← base - Distance¨ cor⊸+¨cheats
•Show ∧save
•Show +´save≥100

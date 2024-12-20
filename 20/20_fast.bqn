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

cheatmask ← ∨´{wall ∧ (𝕩◶MvI cor) ∧ 𝕩◶Mv cor}¨↕4
cheats ← {(≢in)⥊1⌾(𝕩⊸⊑)0¨⥊in}¨/⥊cheatmask
Save ← {𝕊 cheat:
  2-˜⌊´0⊸<⊸/{+´⥊(cheat × 𝕩◶MvI dist) - cheat × 𝕩◶Mv dist}¨↕4
}
•Show +´100≤Save¨cheats

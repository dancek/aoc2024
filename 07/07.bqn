in ← ": "⊸(•ParseFloat¨(⊢-˜¬×·+`1⊸»⊸<)∘∊˜⊔⊢)¨•FLines"input"
HeadTail ← ⊑⋈1⊸↓
Calc ← {𝕨 𝕊 ⟨⟩: ⟨𝕨⟩;
        𝕨 𝕊 𝕩: v‿vs ← HeadTail 𝕩
               ((𝕨×v) Calc vs) ∾ (𝕨+v) Calc vs}
Valid ← {t‿xs ← HeadTail 𝕩
         v‿vs ← HeadTail xs
         ∨´t= v Calc vs}

•Show +´⊑¨Valid¨⊸/in

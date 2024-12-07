in ← ": "⊸(•ParseFloat¨(⊢-˜¬×·+`1⊸»⊸<)∘∊˜⊔⊢)¨•FLines"/dev/stdin"
HeadTail ← ⊑⋈1⊸↓
Calc ← {ops 𝕊 s‿⟨⟩: ⟨s⟩;
        ops 𝕊 s‿xs: v‿vs ← HeadTail xs
                    ∾´{ops Calc (s𝕏v)‿vs}¨ops}
Valid ← {t‿xs ← HeadTail 𝕩
         ∨´t= 𝕨 Calc HeadTail xs}
•Show +´⊑¨ ⟨+,×⟩⊸Valid¨⊸/in

Concat←{𝕩+𝕨×10⋆1+⌊10⋆⁼𝕩}
•Show +´⊑¨ ⟨+,×,Concat⟩⊸Valid¨⊸/in

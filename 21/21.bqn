in ← •FLines"input"
npc ← ⥊↕≢numpad ← >"789"‿"456"‿"123"‿" 0A"
kpc ← ⥊↕≢keypad ← >" ^A"‿"<v>"

cache ← ⟨⟩•HashMap⟨⟩
_memo ← {_𝕣 ⋄ f‿w‿x ← k ← 𝕗‿𝕨‿𝕩
  {cache.Has k ? cache.Get k ;
   v ← w F x
   k cache.Set v ⋄ v}}

Np ← {⊑(⥊𝕩=numpad)/npc}
Kp ← {⊑(⥊𝕩=keypad)/kpc}
_seq ← {y‿x ← (a‿b←𝔽𝕩) - c‿d←𝔽𝕨
  s ← ((0⌈x)⥊'>') ∾ ((0⌈y)⥊'v') ∾ ((0⌈-y)⥊'^') ∾ ((0⌈-x)⥊'<') ∾ "A"
  f ← ((0⌈-x)⥊'<') ∾ ((0⌈y)⥊'v') ∾ ((0⌈-y)⥊'^') ∾ ((0⌈x)⥊'>') ∾ "A"
  t ← ¬((y=0) ∨ (x=0) ∨ ((𝕗=np)∧(3=a⌈c)∧0=b⌊d) ∨ ((𝕗=kp)∧(0=a⌊c)∧0=b⌊d))
  {t ? f; s} # safe or fast solution?
}
_pairwise ← {∾´ 𝔽¨ <˘ 2↕𝕩}
KpDepthImpl ← {0 𝕊 a‿b: a Np _seq _memo b;
  d 𝕊 a‿b: Kp _seq _memo´ _pairwise "A"∾ (d-1) KpDepth a‿b}
KpDepth ← KpDepthImpl _memo

Solve ← {(•ParseFloat ¯1↓𝕩) ×≠ 𝕨⊸KpDepth _pairwise "A"∾𝕩}
•Show +´ 2 Solve¨in
•Show +´ 10 Solve¨in
# TODO: somehow only save lengths, not concrete solutions... using way too much RAM
•Show +´≠¨cache.Values@

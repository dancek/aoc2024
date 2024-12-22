in ← •FLines"input"
npc ← ⥊↕≢numpad ← >"789"‿"456"‿"123"‿" 0A"
kpc ← ⥊↕≢keypad ← >" ^A"‿"<v>"

Np ← {⊑(⥊𝕩=numpad)/npc}
Kp ← {⊑(⥊𝕩=keypad)/kpc}
_seq ← {y‿x ← (a‿b←𝔽𝕩) - c‿d←𝔽𝕨
  s ← ((0⌈x)⥊'>') ∾ ((0⌈y)⥊'v') ∾ ((0⌈-y)⥊'^') ∾ ((0⌈-x)⥊'<') ∾ "A"
  f ← ((0⌈-x)⥊'<') ∾ ((0⌈y)⥊'v') ∾ ((0⌈-y)⥊'^') ∾ ((0⌈x)⥊'>') ∾ "A"
  t ← ¬((y=0) ∨ (x=0) ∨ ((𝕗=np)∧(3=a⌈c)∧0=b⌊d) ∨ ((𝕗=kp)∧(0=a⌊c)∧0=b⌊d))
  {t ? f; s} # safe or fast solution?
}
_pairwise ← {∾´ 𝔽¨ <˘ 2↕𝕩}
# Solve ← {(•ParseFloat ¯1↓𝕩) ×≠ 𝕨⊸KpDepth _pairwise "A"∾𝕩}

ks ← 1↓⥊keypad
kseqs ← 'A' Kp _seq¨ks
CalcKpCost ← {costs 𝕊 seq: +´(ks⊐seq)⊏costs}
KpNextCosts ← {𝕩∾(¯1⊏𝕩)⊸CalcKpCost¨kseqs}
c0 ← ≍1‿1‿1‿1‿1
kpCosts ← KpNextCosts⍟25 ≍1‿1‿1‿1‿1
NpCost ← {depth 𝕊 code:
  s ← Np _seq´ _pairwise "A"∾code
  •Show s
  •Show c ← depth⊏kpCosts
  c CalcKpCost s}
•Show ks≍kseqs
•Show kpCosts
2 NpCost "179A"

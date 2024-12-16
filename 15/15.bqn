_fixp ← {𝕊∘⊢⍟≢⟜𝔽𝕩}
InfMul ← {𝕊0:0; ∞×𝕩}
ZInf ← {𝕊0:∞; 𝕩}

in ← >•FLines"/dev/stdin"
start‿end‿w ← in⊸=¨"SE#"
e ← 0↑˜≢in

walls ← InfMul¨>w‿w‿w‿w
pos ← >start‿e‿e‿e
pts ← InfMul¨¬pos
mv ← ⟨»˘,»,«˘,«⟩
turn ← ⟨¯1⊸⌽,1⊸⌽⟩

Step ← {𝕊 pts:
  turn_pts ← ⌊´{ZInf¨𝕏 1000+pts}¨turn
  mv_pts ← ZInf¨>mv{𝕎 1+𝕩}¨<˘pts
  walls⌈pts⌊turn_pts⌊mv_pts
}
Star1 ← {⌊´⥊(⥊end)⊸/˘ ⥊˘𝕩}
•Show Star1 Step _fixp pts

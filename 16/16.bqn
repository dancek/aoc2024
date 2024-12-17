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
mvI ← ⟨«˘,«,»˘,»⟩
turn ← ⟨¯1⊸⌽,1⊸⌽⟩

Step ← {𝕊 pts:
  turn_pts ← ⌊´{ZInf¨𝕏 1000+pts}¨turn
  mv_pts ← ZInf¨>mv{𝕎 1+𝕩}¨<˘pts
  walls⌈pts⌊turn_pts⌊mv_pts
}
Star1 ← {⌊´⥊(⥊end)⊸/˘ ⥊˘𝕩}
costs ← Step _fixp pts
•Show mincost ← Star1 costs

pathend ← mincost=costs
FindPaths ← {𝕊 paths:
  tp ← ∨´{costs < 𝕏 costs×paths}¨turn
  mp ← >{(𝕩⊏costs) < 𝕩◶MvI 𝕩⊏costs×paths}¨↕4
  mp∨tp∨paths
}
# getting 500, correct is 486. All samples I found on Reddit are correct...
•Show +´⥊∨˝FindPaths _fixp pathend

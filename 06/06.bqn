in  ← >•FLines"/dev/stdin"
obs ← in='#'
pos ← in='^'
mv  ← ⟨«,»˘,»,«˘⟩

dir     ← 0
empty   ← (≢in)↑0
visited ← pos‿empty‿empty‿empty
Step    ← {𝕊
  npos ← (dir◶mv)pos
  {𝕊⋄ ∨´⥊obs∧npos
    ? dir ↩ 4|dir+1
    ; pos ↩ npos}@
  visited ↩ (pos⊸∨)⌾(dir⊸⊑) visited
}

{𝕊⋄Step@}•_while_{𝕊⋄∨´⥊pos}@
•Show +´⥊∨´visited

# failed attempt at star 2: a bit of brute force is needed
LoopObs ← {(¬obs)∧(𝕩◶mv)((4|𝕩+1)⊑visited)∧𝕩⊑visited}
•Show +´⥊∨´LoopObs¨↕4

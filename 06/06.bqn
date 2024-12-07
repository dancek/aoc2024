in    ← >•FLines"/dev/stdin"
obs_  ← in='#'
pos_  ← in='^'
empty ← (≢in)↑0
mv    ← ⟨«,»˘,»,«˘⟩

Round ← {pos 𝕊 obs:
  dir      ← 0
  visited  ⇐ pos‿empty‿empty‿empty
  finished ⇐ 1
  loop     ⇐ 0
  Step     ⇐ {𝕊
    npos ← (dir◶mv)pos
    {𝕊⋄ ∨´⥊obs∧npos
      ? dir ↩ 4|dir+1
      ; pos ↩ npos}@
    out      ← ¬∨´⥊pos
    nvisited ← (pos⊸∨)⌾(dir⊸⊑) visited
    loop     ↩ nvisited≡visited ∧ ¬out
    visited  ↩ nvisited
    finished ↩ loop ∨ out
  }
}

r ← pos_ Round obs_
{𝕊⋄ r.Step@}•_while_{𝕊⋄ ¬r.finished}@
allvisited ← ∨´r.visited
•Show +´⥊allvisited  # star 1

HasLoop ← {𝕊 xobs:
  r ← pos_ Round xobs
  {𝕊⋄ r.Step@}•_while_{𝕊⋄ ¬r.finished}@
  r.loop
}

# split each one into a separate mask
SplitMask  ← {𝕊 mask: {(≢mask)⥊(≠⥊mask)↑/⁼⟨𝕩⟩}¨/⥊mask}
candidates ← obs_⊸∨¨SplitMask allvisited

•Show +´HasLoop¨candidates  # star 2

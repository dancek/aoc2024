in ← >•FLines"sample"
Diag ← {(↕≠𝕩)⌽˘𝕩}
Cols ← <˘⍉
dirs ← ⊢‿⍉‿Diag‿(Diag∘⌽)

padded ← (1+≢in)↑in
all ← (⌽¨∾⊢) ∾´Cols¨{𝕏 padded}¨dirs
•Show +´∾´"XMAS"⊸⍷¨all  # star 1


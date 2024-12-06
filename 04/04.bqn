in ← >•FLines"/dev/stdin"
Diag ← ((↕≠)⌽˘⊢)
Cols ← <˘⍉
dirs ← ⊢‿⍉‿Diag‿(Diag∘⌽)

padded ← (1+≢in)↑in
strs ← (⌽¨∾⊢) ∾´Cols¨{𝕏 padded}¨dirs
•Show +´∾´"XMAS"⊸⍷¨strs  # star 1

mas ← >"M"‿"A"‿"S"
FindMAS ← {»(≢padded)↑((⌽mas)⊸⍷𝕩)+(mas⊸⍷𝕩)}
mas1 ← (FindMAS ⌾ (Diag∘⌽)) padded
mas2 ← (FindMas ⌾ Diag) padded
•Show +´⥊mas1 × mas2  # star 2

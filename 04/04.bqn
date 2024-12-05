in ← >•FLines"sample"
Diag ← {(↕≠𝕩)⌽˘𝕩}
Cols ← <˘⍉
dirs ← ⊢‿⍉‿Diag‿(Diag∘⌽)

padded ← (1+≢in)↑in
strs ← (⌽¨∾⊢) ∾´Cols¨{𝕏 padded}¨dirs
•Show +´∾´"XMAS"⊸⍷¨strs  # star 1
mas2← >"M.S"‿".A."‿"M.S"
mas2⍷in
# TODO: diagonaalit molempiin suuntiin, "MAS"⍷, jotenkin » keskimmäisen kirjaimen kohdalle, palautus oikeaan muotoon ⌾ ja maskien yhdistäminen ×
abc← >"ABC"‿"DEF"‿"GHI"

Diag∘⌽ abc

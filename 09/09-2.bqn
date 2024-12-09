in ← '0'-˜•GetLine@
disk ← in≍˘˜{𝕩↑⥊(↕𝕩)≍˘𝕩⥊¯1}≠in
# combine consecutive elements, remove 0 lengths
Combine ← {v‿0𝕊a: a ;
           xs𝕊¯1‿·: xs ; # strip ¯1 from end
           v‿l𝕊w‿k: {v=w ? v∾(k+l) ; (≍v‿l)∾(≍w‿k) } ; # ˝ first call
           v‿l𝕊a: {v≡⊑⥊a ? (l⊸+)⌾((0‿1)⊸⊑)a ; (≍v‿l)∾a}}
MoveFile ← {f𝕊a:
  idxd ← a∾˘↕≠a
  v‿l‿i ← ⊏(f=⊏)˘⊸/idxd
  holes ← {𝕊¯1‿s‿·: s≥l ; 0}˘⊸/idxd
  {0=≠holes ? a ;
    ·‿s‿j ← ⊏holes
    {i<j ? a ;
      Combine˝ (j↑a)∾(v‿l)∾(¯1⋈s-l)∾((j+1)↓¯1⌾((i‿0)⊸⊑)a) }}}
Checksum ← {+´×˝(↕∘≠≍(⊢×0⊸≤))/˝⌽⍉𝕩}
·‿sln ← {𝕊 n‿a: (n-1)‿(n MoveFile a)}•_while_{𝕊 n‿a: n>0}(⌈´⊏˘disk)‿disk
•Show Checksum sln


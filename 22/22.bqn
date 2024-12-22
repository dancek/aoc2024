in ← •ParseFloat¨•FLines"input"
_mp ← {𝕩 32•bit._xor 16777216|𝔽𝕩}
Next ← {2048⊸×_mp (⌊÷⟜32)_mp 64⊸×_mp 𝕩}
secrets ← {𝕩∾Next ¯1⊏𝕩}⍟2000 ≍in
•Show +´¯1⊏secrets
total ← ⟨⟩•HashMap⟨⟩
{𝕊 ⋄ sp ← ⍉{{(≍˜⊏∊˘𝕩)/˘𝕩}(4↓𝕩)≍˜<˘4↕-˜˝⍉2↕𝕩}10|𝕩 # simple!
  {𝕊 seq‿price: seq total.Set price + 0 total.Get seq}˘sp
@}˘⍉secrets
•Show ⊑⊏∨⍉(total.Values@)≍total.Keys@

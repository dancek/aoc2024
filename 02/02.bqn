in←•ParseFloat¨¨' '((¬-˜⊢×·+`»⊸>)∘≠⊔⊢)¨•FLines"/dev/stdin"
Safe←{∧´(3≥¨|𝕩)∧(0≠¨𝕩)∧(1=≠⍷×𝕩)}(-˝1↓˘»≍⊢)
•Show +´Safe¨in
AnySafe←{∨´Safe˘/⟜𝕩˘(≠⌜˜↕≠𝕩)}
•Show +´AnySafe¨in

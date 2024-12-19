in ← "-1234567890"⊸(•ParseFloat¨(¬-˜⊢×·+`»⊸>)∘∊˜⊔⊢)¨•FLines"input"
s ← 101‿103 ⋄ h ← ⌊s÷2
P ← { t 𝕊 x‿y‿v‿w: s | (x‿y) + t×(v‿w) }  # position after t
ps ← 100⊸P¨in
nc ← {∧´0≠𝕩-h}¨⊸/ps  # non-center positions
Star1 ← {×´≠¨(⊐×-⟜h¨𝕩)⊔𝕩}
•Show Star1 nc
StepN ← {
  ps ← 𝕩⊸P¨in
  # lucky guess: each "pixel" is distinct
  {(∧´∊ps) ?
  •Show 𝕩
  •Show ⊑⟜" *"¨⍉(≠ps)>ps⊐↕s ;@}𝕩
  𝕩+1
}
{StepN 𝕩}•_while_{𝕩<10000}1

in ← '0'-˜•GetLine@
disk ← in/{𝕩↑⥊(↕𝕩)≍˘𝕩⥊¯1}≠in
Step ← {¯1↓(⊑⌽𝕩)⌾((⊑⍋𝕩)⊸⊑)𝕩}
defragged ← {Step𝕩}•_while_{∨´¯1=𝕩}disk
•Show +´×˝((↕≠)≍⊢)defragged

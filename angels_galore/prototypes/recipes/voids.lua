vgal.recipe.make_recipeable_void("angels-liquid-polluted-fish-atmosphere", "water")
vgal.recipe.make_recipeable_void("angels-liquid-fish-atmosphere", "water")

vgal.recipe.make_recipeable_void("angels-tree-seed", "bio", 10)
-- vgal.recipe.make_recipeable_void("angels-solid-compost", "bio", 10)
for _, nutrientable in pairs(vgal.defines.nutrientables) do
    local items_needed_for_compost = (nutrientable.name == "angels-solid-pips") and 3 or 2
    vgal.recipe.make_recipeable_void(nutrientable.name, "bio", items_needed_for_compost)
end

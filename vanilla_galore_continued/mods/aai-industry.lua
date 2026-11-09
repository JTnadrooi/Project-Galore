if not mods["aai-industry"] then return end

for _, recipe in vgal.domain_pairs("vgal", "recipe") do
    recipe.allow_hand_crafting = true
end

data.raw["recipe"]["oil-processing-heavy"].subgroup = "vgal-oil"

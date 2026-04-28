-- hide barrel recipes from player crafting.
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.category == "barreling-pump" then
        recipe.hide_from_player_crafting = true
    end
end

-- clean subgroups bc anywhere else this code is just a suggestion.
local subgroups_to_clean = {
    ["angels-copper"] = true,
    ["angels-copper-casting"] = true,
    ["angels-iron"] = true,
    ["angels-iron-casting"] = true,
    ["angels-steel-casting"] = true,
    ["angels-stone"] = true,
    ["angels-stone-casting"] = true,
}
for _, recipe in pairs(data.raw["recipe"]) do
    if subgroups_to_clean[recipe.subgroup] then
        vgal.subgroup.clean(recipe)
    end
end
vgal.recipe.replace_ingredient("angels-ore2-crystal", "angels-liquid-hydrofluoric-acid", "angels-liquid-sulfuric-acid")

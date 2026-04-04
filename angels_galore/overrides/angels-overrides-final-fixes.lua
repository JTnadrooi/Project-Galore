--- barrel hiding ---
for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.category == "barreling-pump" then
        recipe.hide_from_player_crafting = true
    end
end

--- clean subgroups bc anywhere else this code is just a suggestion ---
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
        recipe.order = nil
        recipe.subgroup = nil
    end
end

--- unhide refining recipes ---
local function unhide(name)
    local recipe = data.raw["recipe"][name]
    if recipe then
        recipe.hidden = false
        recipe.hidden_in_factoriopedia = false
    end

    local item = data.raw["item"][name]
    if item then
        item.hidden = false
        item.hidden_in_factoriopedia = false
    end
end

for _, metal in ipairs(vgal.constants.METALS) do
    unhide("angels-" .. metal .. "-pebbles")
    unhide("angels-" .. metal .. "-chunk")
end

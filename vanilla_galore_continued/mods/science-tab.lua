if not mods["science-tab"] then return end

local nauvis_packs = {
    ["automation-science-pack"] = true,
    ["chemical-science-pack"] = true,
    ["logistic-science-pack"] = true,
    ["military-science-pack"] = true,
    ["production-science-pack"] = true,
    ["space-science-pack"] = true,
    ["utility-science-pack"] = true
}

for name, subgroup in pairs(data.raw["item-subgroup"]) do
    if string.match(name, "^vgal.-science%-pack$") then
        subgroup.group = "science"
    end
end

for _, recipe in vgal.data.domain_pairs("vgal", "recipe") do
    if nauvis_packs[recipe.main_product] then
        recipe.subgroup = "vgal-" .. recipe.main_product
    end
end

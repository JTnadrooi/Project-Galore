-- deduplicate fluids
---@type table<string, string>
local dedupe_map = {
    ["ammonia"] = "angels-gas-ammonia",
    ["carbon"] = "angels-solid-carbon",
    ["molten-iron"] = "angels-liquid-molten-iron",
    ["molten-copper"] = "angels-liquid-molten-copper",
}

for _, recipe in pairs(data.raw["recipe"]) do
    for _, ingredient in ipairs(recipe.ingredients or {}) do
        if dedupe_map[ingredient.name] then
            ingredient.name = dedupe_map[ingredient.name]
        end
    end

    for _, result in ipairs(recipe.results or {}) do
        if dedupe_map[result.name] then
            result.name = dedupe_map[result.name]
        end
    end

    if recipe.main_product and dedupe_map[recipe.main_product] then
        recipe.main_product = dedupe_map[recipe.main_product]
    end
end

for og_name, _ in pairs(dedupe_map) do
    vgal.data.deephide(vgal.get_recipeable(og_name))
end

-- fix prereq of removed vanilla techs
for _, tech in pairs(data.raw["technology"]) do
    if tech.prerequisites then
        for i, prerequisite in ipairs(tech.prerequisites) do
            if prerequisite == "fish-breeding" then
                tech.prerequisites[i] = "angels-bio-refugium-fish-1"
                break
            end

            if prerequisite == "tree-seeding" then
                tech.prerequisites[i] = "angels-bio-arboretum-1"
                break
            end
        end
    end
end

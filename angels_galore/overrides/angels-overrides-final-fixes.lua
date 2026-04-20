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

-- restore refining recipes.
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

-- unhide nuggets and pebbles.
for _, metal in pairs(vgal.defines.metals) do
    unhide(metal.pebbles)
    -- unhide("angels-" .. metal .. "-pebbles-smelting")
    unhide(metal.nugget)
    -- unhide("angels-" .. metal .. "-nugget-smelting")
    unhide(metal.slag)
    -- unhide("angels-" .. metal .. "-slag-smelting")
    unhide(metal.plate)
end

-- prepare recipe for next loop. (the recipe amount will not apply otherwise)
vgal.recipe.replace_ingredient("angels-ore2-crystal", "angels-liquid-hydrofluoric-acid", "angels-liquid-sulfuric-acid")

-- fix ores, both time normalizing as ore density (see docs/ore-density)
for _, ore_index in ipairs(agal.defines.ore_indexes) do
    -- chunk
    data.raw["recipe"]["angels-ore" .. ore_index .. "-chunk"].energy_required = 3.2
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-chunk", 6, "angels-ore" .. ore_index .. "-crushed")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 4, "angels-ore" .. ore_index .. "-chunk")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 50, "angels-water-yellow-waste")

    -- chunk geode removal
    if ore_index == 2 then
        vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 0, "angels-geode-purple")
    else
        vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-chunk", 0, "angels-geode-yellow")
    end

    -- crystal
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-crystal", 5, "angels-liquid-sulfuric-acid")
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-crystal", 5, "angels-ore" .. ore_index .. "-chunk")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-crystal", 4, "angels-ore" .. ore_index .. "-crystal")

    -- pure
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-pure", 4, "angels-ore" .. ore_index .. "-crystal")
    vgal.recipe.set_result_amount("angels-ore" .. ore_index .. "-pure", 2, "angels-ore" .. ore_index .. "-pure")

    -- processing
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-chunk-processing", 4,
        "angels-ore" .. ore_index .. "-chunk")
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-crystal-processing", 4,
        "angels-ore" .. ore_index .. "-crystal")
    vgal.recipe.set_ingredient_amount("angels-ore" .. ore_index .. "-pure-processing", 2, -- should be 2.25
        "angels-ore" .. ore_index .. "-pure")
end

-- restore processing recipes.
data.raw["recipe"]["angels-ore3-crushed-processing"].results = vgal.build.table({
    { "iron-ore",            1 },
    { "angels-iron-nugget",  1 },
    { "angels-iron-pebbles", 2 },
})
data.raw["recipe"]["angels-ore3-chunk-processing"].results = vgal.build.table({
    { "iron-ore",            1 },
    { "angels-iron-nugget",  2 },
    { "angels-iron-pebbles", 4 },
})
data.raw["recipe"]["angels-ore3-crystal-processing"].results = vgal.build.table({
    { "iron-ore",            2 },
    { "angels-iron-nugget",  3 },
    { "angels-iron-pebbles", 3 },
    { "angels-iron-slag",    1 },
})
data.raw["recipe"]["angels-ore3-pure-processing"].results = vgal.build.table({
    { "iron-ore",            2 },
    { "angels-iron-nugget",  5 },
    { "angels-iron-pebbles", 3 },
    { "angels-iron-slag",    1 },
})

data.raw["recipe"]["angels-ore2-crushed-processing"].results = vgal.build.table({
    { "copper-ore",           2 },
    { "angels-copper-nugget", 1 },
})
data.raw["recipe"]["angels-ore2-chunk-processing"].results = vgal.build.table({
    { "copper-ore",            2 },
    { "angels-copper-nugget",  2 },
    { "angels-copper-pebbles", 2 },
})
data.raw["recipe"]["angels-ore2-crystal-processing"].results = vgal.build.table({
    { "copper-ore",            4 },
    { "angels-copper-nugget",  2 },
    { "angels-copper-pebbles", 3 },
    { "angels-copper-slag",    1 },
})
data.raw["recipe"]["angels-ore2-pure-processing"].results = vgal.build.table({
    { "copper-ore",            3 },
    { "angels-copper-nugget",  4 },
    { "angels-copper-pebbles", 5 },
    { "angels-copper-slag",    1 },
})

for _, metal in pairs(vgal.defines.metals) do
    data.raw["recipe"][metal.plate].ingredients = vgal.build.table({
        { metal.crushed, 3 }
    })
end

-- fix prerequisite techs.
do
    for _, environment in ipairs({ "desert", "swamp", "temperate" }) do
        data.raw["technology"]["angels-bio-" .. environment .. "-farm"].prerequisites = {
            "angels-bio-" .. environment .. "-farming-1",
            "angels-bio-farm-alien",
            "chemical-science-pack"
        }
        data.raw["technology"]["angels-bio-" .. environment .. "-farming-2"].prerequisites = {
            "angels-bio-" .. environment .. "-farm",
            "angels-geode-processing-1",
        }
    end

    vgal.tech.add_prerequisite("angels-water-treatment-3", "chemical-science-pack")
    vgal.tech.add_prerequisite("angels-bio-processing-blue", "chemical-science-pack")
    vgal.tech.add_prerequisite("angels-bio-refugium-hatchery", "chemical-science-pack")
    vgal.tech.add_prerequisite("angels-slag-processing-2", "chemical-science-pack")
    vgal.tech.add_prerequisite("angels-ore-processing-2", "chemical-science-pack")
    vgal.tech.add_prerequisite("angels-stone-smelting-2", "chemical-science-pack")
    vgal.tech.add_prerequisite("angels-copper-casting-3", "chemical-science-pack")
    vgal.tech.add_prerequisite("angels-iron-casting-3", "chemical-science-pack")
    vgal.tech.add_prerequisite("angels-steel-smelting-3", "chemical-science-pack")

    vgal.tech.add_prerequisite("angels-advanced-chemistry-2", "chemical-science-pack")
    vgal.tech.add_prerequisite("angels-advanced-chemistry-2", "angels-advanced-chemistry-1")

    vgal.tech.add_prerequisite("angels-advanced-chemistry-4", "production-science-pack")
    vgal.tech.add_prerequisite("angels-advanced-chemistry-4", "angels-advanced-chemistry-3")

    vgal.tech.add_prerequisite("angels-advanced-chemistry-5", "utility-science-pack")
    vgal.tech.add_prerequisite("angels-advanced-chemistry-5", "angels-advanced-chemistry-4")

    data.raw["technology"]["angels-bio-refugium-biter-1"].prerequisites = {
        "processing-unit",
        "angels-bio-nutrient-paste",
        "angels-bio-farm-alien",
        "production-science-pack"
    }

    data.raw["technology"]["angels-slag-processing-3"].prerequisites = {
        "angels-slag-processing-2",
        "production-science-pack"
    }

    data.raw["technology"]["angels-water-chemistry-1"].prerequisites = {
        "angels-sulfur-processing-3",
        "production-science-pack"
    }

    -- restore automation 3 to be same as vanilla.
    data.raw["technology"]["automation-3"].prerequisites = {
        "electric-engine",
        "speed-module",
        "production-science-pack"
    }

    -- angels stone smelting 3 is a COMEBACKAT
end

-- remove ore gen of removed ores.
for _, ore_index in pairs(agal.defines.removed_ore_indexes) do
    local ore = "angels-ore" .. ore_index

    vgal.data.deephide(data.raw["resource"][ore])
    data.raw["autoplace-control"][ore] = nil
    data.raw["planet"]["nauvis"].map_gen_settings.autoplace_controls[ore] = nil
    data.raw["planet"]["nauvis"].map_gen_settings.autoplace_settings.entity.settings[ore] = nil

    for _, map_gen_preset in pairs(data.raw["map-gen-presets"]) do
        for key, value in pairs(map_gen_preset) do
            if key == "name" or key == "type" then
                goto continue
            end

            if value.basic_settings and value.basic_settings.autoplace_controls then
                value.basic_settings.autoplace_controls[ore] = nil
            end

            ::continue::
        end
    end
end

-- TECH FIXES
-- Add vgal-biologic-science-pack as unit to technologies that require the "vgal-biologic-science-pack" tech.
local cache = {}

local function has_prerequisite_recursive(tech_name, target, visited)
    if cache[tech_name] ~= nil then
        return cache[tech_name]
    end

    visited = visited or {}
    if visited[tech_name] then
        return false
    end
    visited[tech_name] = true

    local tech = data.raw["technology"][tech_name]
    if not tech or not tech.prerequisites then
        cache[tech_name] = false
        return false
    end

    for _, prereq_name in pairs(tech.prerequisites) do
        if prereq_name == target or has_prerequisite_recursive(prereq_name, target, visited) then
            cache[tech_name] = true
            return true
        end
    end

    cache[tech_name] = false
    return false
end

for tech_name, tech in pairs(data.raw["technology"]) do
    if has_prerequisite_recursive(tech_name, "vgal-biologic-science-pack") then
        if tech.unit and tech.unit.ingredients then
            table.insert(tech.unit.ingredients, { "vgal-biologic-science-pack", 1 })
        end
    end
end

-- Add angels-stone-smelting-2 as prerequisite to technologies that unlock buildings that require concrete bricks.

-- LOGCACHE::
-- vgal.log("listlist")

-- for _, tech in pairs(data.raw["technology"]) do
--     local uses_concrete_brick = false

--     for _, effect in ipairs(tech.effects or {}) do
--         if effect.type == "unlock-recipe" then
--             local recipe = data.raw["recipe"][effect.recipe]

--             if recipe.ingredients and (not recipe.hidden) then
--                 for _, ingredient in ipairs(recipe.ingredients) do
--                     if ingredient.name == "angels-concrete-brick" then
--                         uses_concrete_brick = true
--                     end
--                 end
--             end
--         end
--     end

--     if (not has_prerequisite_recursive(tech.name, "angels-stone-smelting-2")) and uses_concrete_brick and (not tech.hidden) then
--         vgal.log(tech.name)
--     end
-- end

-- vgal.log("listlist-end")

-- LOGCACHE RESULT::
local techs_that_need_stone_smelting = {
    "angels-ore-leaching",
    "angels-ore-refining",
    "angels-water-treatment-3",
    "angels-thorium-power",
    "angels-advanced-gas-processing",
    "angels-advanced-chemistry-2",
    "angels-advanced-chemistry-4",
    "angels-ore-processing-2",
    "angels-bio-refugium-hatchery"
}

for _, tech_name in ipairs(techs_that_need_stone_smelting) do
    local tech = data.raw["technology"][tech_name]
    table.insert(tech.prerequisites, "angels-stone-smelting-2")
end

-- TECH FIXES (alot of this is done in final fixes too)
data.raw["technology"]["angels-basic-chemistry"].unit.count = 40
data.raw["technology"]["angels-ore-crushing"].prerequisites = { "automation" }
vgal.tech.merge("angels-flare-stack", "angels-basic-chemistry")
table.insert(data.raw["technology"]["angels-water-treatment"].prerequisites, "angels-water-washing-1")
table.insert(data.raw["technology"]["angels-bio-processing-green"].unit.ingredients, { "logistic-science-pack", 1 })
table.insert(data.raw["technology"]["angels-bio-processing-green"].prerequisites, "angels-bio-nutrient-paste")
vgal.tech.move_recipe("angels-bio-processing-green", "angels-water-treatment", "angels-water-mineralized")
vgal.tech.replace_recipe("angels-ore-crushing", "angels-ore4-crushed", "angels-ore3-crushed")

-- data.raw["technology"]["angels-bio-arboretum-1"].prerequisites = { "vgal-biological-science-pack" } -- commentedbc: Just like black science, im leaving some techs open. This one fits.

-- remove cement 3. it only adds alternate recipes but as those arent really alternates and more upgrades, Im gonna remove them instead of editing them.
vgal.tech.deephide("angels-stone-smelting-3")
vgal.tech.techs_to_splice["angels-stone-smelting-3"] = data.raw["technology"]["angels-stone-smelting-3"]

-- move fertilizer to unlock before agri science and remove farming 2 tech (it only had the fertilizer recipe)
vgal.tech.move_recipe("angels-bio-farm-2", "angels-composting", "angels-solid-fertilizer")
vgal.tech.deephide("angels-bio-farm-2")
vgal.tech.add_prerequisite("angels-composting", "angels-nitrogen-processing-2")
vgal.tech.add_unit("angels-composting", "logistic-science-pack")
vgal.tech.set_unit_count("angels-composting", 50)
vgal.tech.add_unit("angels-bio-arboretum-1", "logistic-science-pack")
vgal.tech.set_unit_count("angels-bio-arboretum-1", 50)

-- fix farm prerequisites
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

-- vgal.tech.add_prerequisite("angels-water-treatment-3", "chemical-science-pack")
-- vgal.tech.add_prerequisite("angels-bio-processing-blue", "chemical-science-pack")
-- vgal.tech.add_prerequisite("angels-bio-refugium-hatchery", "chemical-science-pack")
-- vgal.tech.add_prerequisite("angels-slag-processing-2", "chemical-science-pack")
-- vgal.tech.add_prerequisite("angels-ore-processing-2", "chemical-science-pack")
-- vgal.tech.add_prerequisite("angels-stone-smelting-2", "chemical-science-pack")
-- vgal.tech.add_prerequisite("angels-copper-casting-3", "chemical-science-pack")
-- vgal.tech.add_prerequisite("angels-iron-casting-3", "chemical-science-pack")
-- vgal.tech.add_prerequisite("angels-steel-smelting-3", "chemical-science-pack")

-- data.raw["technology"]["angels-plastic-3"].prerequisites = { "angels-plastic-2", "angels-advanced-chemistry-4" }
data.raw["technology"]["angels-nitrogen-processing-4"].prerequisites =
{
    "angels-advanced-chemistry-4",
    "utility-science-pack",
}

-- t5 tech is kinda unneeded, merge with t4 (t4 does not have any visible effects anyways, it will get removed otherwise)
data.raw["technology"]["angels-advanced-chemistry-5"].effects = {}
vgal.tech.add_recipe("angels-advanced-chemistry-4", "angels-liquid-phenol")
vgal.tech.add_recipe("angels-advanced-chemistry-4", "angels-cumene-process")

data.raw["technology"]["angels-bio-refugium-biter-1"].prerequisites = {
    "processing-unit",
    "angels-bio-nutrient-paste",
    "angels-bio-farm-alien",
    "production-science-pack"
}

data.raw["technology"]["angels-bio-processing-crystal-full"].prerequisites = {
    "angels-bio-refugium-biter-3",
}

-- beacon does not require bio processing anymore (just like the modules)
vgal.tech.remove_prerequisite("effect-transmission", "angels-bio-processing-crystal-full")

data.raw["technology"]["angels-slag-processing-3"].prerequisites = {
    "angels-slag-processing-2",
    "production-science-pack"
}

data.raw["technology"]["angels-water-chemistry-1"].prerequisites = {
    "angels-sulfur-processing-3",
    "production-science-pack"
}

-- restore automation 3 to be same as vanilla (restore is a byproduct of the fix)
data.raw["technology"]["automation-3"].prerequisites = {
    "electric-engine",
    "speed-module",
    "production-science-pack"
}

-- fix roll casting tech prerequisites
local funky_tech_names = {
    ["iron"] = { "-smelting-1", "-casting-2", "-casting-3" },
    ["copper"] = { "-smelting-1", "-casting-2", "-casting-3" },
    ["steel"] = { "-smelting-1", "-smelting-2", "-smelting-3" },
}
for material, tech_postfixes in pairs(funky_tech_names) do
    data.raw["technology"]["angels-" .. material .. tech_postfixes[2]].prerequisites = {
        "angels-" .. material .. tech_postfixes[1],
        "angels-strand-casting-1",
    }
    data.raw["technology"]["angels-" .. material .. tech_postfixes[3]].prerequisites = {
        "angels-" .. material .. tech_postfixes[2],
        "angels-coolant-1",
    }
end

-- powderizer already unlocked elsewhere, unlock here not needed anymore
vgal.tech.remove_recipe("angels-powder-metallurgy-2", "angels-powderizer")

-- move garden processing tech more into farming tree part
vgal.tech.remove_prerequisite("angels-gardens", "angels-stone-smelting-1")

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

-- BIO SCIENCE
-- add initial
data.raw["technology"]["angels-bio-farm-1"].prerequisites = { "vgal-biological-science-pack", "angels-gardens" }
vgal.tech.add_prerequisite("angels-bio-processing-paste", "vgal-biological-science-pack")

-- Add vgal-biological-science-pack as unit to technologies that require the "vgal-biological-science-pack" tech.
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
    if has_prerequisite_recursive(tech_name, "vgal-biological-science-pack") then
        if tech.unit and tech.unit.ingredients then
            table.insert(tech.unit.ingredients, { "vgal-biological-science-pack", 1 })
        end
    end
end

-- add angels-stone-smelting-2 as prerequisite to technologies that unlock buildings that require concrete bricks

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
    -- "angels-ore-leaching",
    -- "angels-ore-refining",
    -- "angels-water-treatment-3",
    -- "angels-thorium-power",
    -- "angels-ore-processing-2",
    -- "angels-bio-refugium-hatchery"
}

for _, tech_name in ipairs(techs_that_need_stone_smelting) do
    local tech = data.raw["technology"][tech_name]

    vgal.tech.add_prerequisite(tech_name, "angels-stone-smelting-2")
    table.insert(tech.prerequisites, "angels-stone-smelting-2")
end

-- SPLICE TECHS

-- mark empty techs for splicing (can't do this in final-fixes bc of galorelib, but this should work)
-- AND remove hidden effects, I could use queue_to_clean... hmm...
local function startsWith(str, prefix)
    return string.sub(str, 1, #prefix) == prefix
end

for _, tech in pairs(data.raw["technology"]) do
    if startsWith(tech.name, "angels")
        and not startsWith(tech.name, "angels-hidden")
        and tech.effects then
        local tech_is_without_relevant_effects = true

        for i = #tech.effects, 1, -1 do
            local effect = tech.effects[i]

            local is_hidden_recipe_unlock = effect.type == "unlock-recipe" and data.raw["recipe"][effect.recipe].hidden

            if effect.hidden or is_hidden_recipe_unlock then
                table.remove(tech.effects, i)
            else
                tech_is_without_relevant_effects = false
            end
        end

        if tech_is_without_relevant_effects then
            vgal.tech.techs_to_splice[tech.name] = tech
        end
    end
end

-- TECH FIXES (alot of this is done in final fixes too)
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
vgal.tech.add_unit("angels-bio-arboretum-1", "logistic-science-pack")

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

-- fix hatching tech
vgal.tech.add_prerequisite("angels-bio-refugium-hatchery", "vgal-biological-science-pack")
-- vgal.tech.remove_prerequisite("angels-bio-refugium-hatchery", "angels-chlorine-processing-1")

-- move coal processing 3 back the pellet press is needed for it.
vgal.tech.add_prerequisite("angels-coal-processing-3", "angels-ore-processing-2")
vgal.tech.add_unit("angels-coal-processing-3", "chemical-science-pack")

-- add angels pebble recipes
vgal.tech.add_recipe("angels-ore-crushing", "angels-iron-pebbles")
vgal.tech.add_recipe("angels-ore-crushing", "angels-copper-pebbles")

-- add crystal prereq to uranium mining as the sorting recipe is there
vgal.tech.add_prerequisite("uranium-mining", "angels-ore-leaching")

-- add "angels-filter-ceramic" to alien farm tech as the new alt seed recipes need it
vgal.tech.add_recipe("angels-bio-farm-alien", "angels-filter-ceramic")

-- move recipes so rocket boosteer techs are removed
vgal.tech.move_recipe("angels-rocket-booster-1", "angels-nitrogen-processing-2", "angels-solid-ammonium-nitrate")
vgal.tech.move_recipe("angels-rocket-booster-2", "angels-chlorine-processing-4", "angels-solid-ammonium-perchlorate")
vgal.tech.add_prerequisite("angels-chlorine-processing-4", "angels-nitrogen-processing-2")

-- fix techs that depended on it
vgal.tech.remove_prerequisite("rocketry", "angels-rocket-booster-1")

-- fix nuke tech prerequisites
vgal.tech.add_prerequisite("atomic-bomb", "angels-fusion-power-1")

-- BIO SCIENCE
-- add initial
data.raw["technology"]["angels-gardens"].prerequisites = { "vgal-biological-science-pack" }
data.raw["technology"]["angels-bio-farm-1"].prerequisites = { "angels-gardens" }
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

-- SPLICE TECHS
-- pre splice fix so not everything requires chlorine...
data.raw["technology"]["angels-aluminium-smelting-1"].prerequisites = {}

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

-- fix tech costs
-- only affects angels techs
local function get_previous_tech_name(tech_name)
    local base_name, number = tech_name:match("^(.-)-(%d+)$")

    if base_name and number then
        local num = tonumber(number)
        if num and num > 1 then
            if num == 2 then
                local prev_tier_tech = data.raw["technology"][base_name] or data.raw["technology"]
                    [base_name .. "-" .. 1]
                if prev_tier_tech then
                    return prev_tier_tech.name
                end
            else
                local prev_tier_tech = data.raw["technology"][base_name .. "-" .. (num - 1)]
                if prev_tier_tech then
                    return prev_tier_tech.name
                end
            end
        end
    end

    return nil
end

local techs_with_tier = {}
local tech_adjustments = {}

for _, tech in pairs(data.raw["technology"]) do
    if startsWith(tech.name, "angels") and tech.unit and tech.unit.ingredients and tech.unit.count and not tech.hidden and not vgal.tech.techs_to_splice[tech.name] then
        local is_icon_tech = false
        local ingredient_count = #tech.unit.ingredients
        local highest_value_unit = vgal.tech.get_highest_value_unit(tech.name)

        for _, icon in ipairs(tech.icons or {}) do
            if icon.icon:match("gas/gas") then
                is_icon_tech = true
                goto gas_check_continue
            end
        end
        if tech.icon and tech.icon:match("coolant") then
            is_icon_tech = true
        end
        ::gas_check_continue::

        local recipe_count = 0
        for _, effect in ipairs(tech.effects) do
            if not effect.hidden and effect.type == "unlock-recipe" then
                recipe_count = recipe_count + 1
            end
        end

        local new_tech_count = tech.unit.count

        if is_icon_tech then
            new_tech_count = math.max(25 * ingredient_count, 20)

            if ingredient_count > 3 then
                new_tech_count = new_tech_count + 20
            end
            if ingredient_count > 4 then
                new_tech_count = new_tech_count + 25
            end
        else
            new_tech_count = new_tech_count + math.abs(tech.unit.count - 30) * ingredient_count

            if highest_value_unit == "automation-science-pack" then
                new_tech_count = math.min(25, new_tech_count * 0.4)
            elseif highest_value_unit == "logistic-science-pack" or highest_value_unit == "vgal-biological-science-pack" then
                new_tech_count = math.min(40, new_tech_count * 0.6)
            end

            new_tech_count = new_tech_count + math.min(#(tech.prerequisites or {}), 5) * 5

            if recipe_count < 10 then
                new_tech_count = new_tech_count + recipe_count * 15
            end

            if recipe_count < 2 then
                new_tech_count = new_tech_count * 0.75
            end

            new_tech_count = math.floor((new_tech_count + 5) / 5) * 5
        end

        tech_adjustments[tech.name] = {
            new_count = new_tech_count,
            ingredients_count = ingredient_count
        }
    end
end

for name, adjustment in pairs(tech_adjustments) do
    local tier = 0
    local base_name, number = name:match("^(.-)-(%d+)$")
    if base_name and number then
        tier = tonumber(number) --[[@as integer]]
        techs_with_tier[#techs_with_tier + 1] = {
            name = name,
            tier = tier,
            base_name = base_name,
            adjustment = adjustment
        }
    else
        techs_with_tier[#techs_with_tier + 1] = {
            name = name,
            tier = 1,
            base_name = name,
            adjustment = adjustment
        }
    end
end

table.sort(techs_with_tier, function(a, b)
    return a.tier > b.tier
end)

for _, tech_info in ipairs(techs_with_tier) do
    local name = tech_info.name
    local adjustment = tech_info.adjustment
    local previous_tech_name = get_previous_tech_name(name)

    if previous_tech_name and tech_adjustments[previous_tech_name] then
        local previous_adjustment = tech_adjustments[previous_tech_name]

        if previous_adjustment.new_count > adjustment.new_count - 10 then
            previous_adjustment.new_count = adjustment.new_count - 5 * adjustment.ingredients_count - 10
            if previous_adjustment.new_count < 1 then
                previous_adjustment.new_count = 1
            end
        end
    end
end

for name, adjustment in pairs(tech_adjustments) do
    data.raw["technology"][name].unit.count = adjustment.new_count
end

-- manual tech cost fixes
vgal.tech.set_unit_count("angels-coal-cracking", 200) -- (normally gets icon treatment) same as vanilla, also fitting for something so usefull
vgal.tech.set_unit_count("angels-nuclear-fuel", 1500)

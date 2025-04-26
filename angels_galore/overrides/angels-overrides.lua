-- vgal.recipe.unhide("thermal-water-purification")
-- vgal.tech.add_recipe("vgal-hydrochloric-intermediates", "thermal-water-purification")


--- time normalising ---
data.raw.recipe["angels-iron-pebbles-smelting"].energy_required = 6.4
data.raw.recipe["angels-iron-nugget-smelting"].energy_required = 6.4
data.raw.recipe["angels-copper-pebbles-smelting"].energy_required = 6.4
data.raw.recipe["angels-copper-nugget-smelting"].energy_required = 6.4
data.raw.recipe["angelsore1-crushed-smelting"].energy_required = 6.4
data.raw.recipe["angelsore3-crushed-smelting"].energy_required = 6.4

data.raw.recipe["copper-plate"].energy_required = 9.6
data.raw.recipe["iron-plate"].energy_required = 9.6

--- plastic buff ---
vgal.subgroup.clean("solid-plastic")
vgal.recipe.multiply("solid-plastic", 1.25)

--- ore removal ---
vgal.recipe.all.replace_ingredient("catalyst-metal-yellow", { type = "item", name = "catalyst-metal-red", amount = 1 })
vgal.recipe.all.replace_ingredient("catalyst-metal-blue", { type = "item", name = "catalyst-metal-green", amount = 1 })
vgal.data.trim("catalyst-metal-blue")
vgal.data.trim("catalyst-metal-yellow")

local UNNEEDED_ORES = { "2", "4" }
local UNNEEDED_ORES_STATES = { "crushed", "crystal", "chunk", "pure" }
for _, ore in ipairs(UNNEEDED_ORES) do
    vgal.data.deep_hide(data.raw["item"]["angels-ore" .. ore])
    for _, state in ipairs(UNNEEDED_ORES_STATES) do
        vgal.data.trim("angelsore" .. ore .. "-" .. state .. "-processing")
        vgal.data.trim("angelsore" .. ore .. "-" .. state)
        vgal.data.deep_hide(data.raw["item"]["angels-ore" .. ore .. "-" .. state])
    end
end

data.raw.recipe["catalyst-metal-green"].ingredients = vgal.build.table({
    { "catalyst-metal-carrier", 10 },
    { "angels-ore3",            1 },
})
data.raw.recipe["catalyst-metal-red"].ingredients = vgal.build.table({
    { "catalyst-metal-carrier", 10 },
    { "angels-ore1",            1 },
})

--- building removal ---
local UNNEEDED_BUILDINGS = {
    ["oil-refinery"] = 1,
    ["steam-cracker"] = 1,
    ["liquifier"] = 2,
    ["angels-electrolyser"] = 2,
    ["angels-chemical-plant"] = 2,
    ["advanced-chemical-plant"] = 2,
    ["separator"] = 2,
    ["gas-refinery-small"] = 1,
    ["gas-refinery"] = 1,
    ["angels-air-filter"] = 1,

    ["hydro-plant"] = 1,
    ["washing-plant"] = 1,
    ["angels-electric-boiler"] = 2,
    ["salination-plant"] = 1,

    ["algae-farm"] = 2,

    ["induction-furnace"] = 1,
    ["casting-machine"] = 1,
    ["strand-casting-machine"] = 1,

    ["ore-sorting-facility"] = 2,
    ["ore-crusher"] = 1,
    ["ore-floatation-cell"] = 1,
    ["ore-leaching-plant"] = 1,
    ["ore-refinery"] = 1,
    ["ore-powderizer"] = 1, -- z..
    ["filtration-unit"] = 1,
    ["crystallizer"] = 1,   -- z 2..

    ["ore-processing-machine"] = 1,
    ["pellet-press"] = 1,
    ["powder-mixer"] = 1,
    ["blast-furnace"] = 1,
    ["angels-chemical-furnace"] = 1,
}

local MODULE_COUNT_BLACKLIST = {
    ["angels-air-filter"] = true,
    ["oil-refinery"] = true,
    ["angels-electric-boiler"] = true,
}

for building_name, max_tier in pairs(UNNEEDED_BUILDINGS) do
    for i = 2, 5 do
        local building = data.raw["assembling-machine"][building_name .. "-" .. i]
        if building and (not MODULE_COUNT_BLACKLIST[building_name]) then
            building.module_slots = 1 + i
        end
        if (i > max_tier) and building then
            vgal.data.deep_hide(building)
            vgal.data.deep_hide(data.raw["item"][building_name .. "-" .. i])
            vgal.data.trim(building_name .. "-" .. i)
            building.next_upgrade = nil
        end
    end
    local building = data.raw["assembling-machine"][building_name .. "-" .. max_tier] or
        data.raw["assembling-machine"][building_name]
    if building then
        building.next_upgrade = nil
        building.module_slots = 2
    else
        error(building_name)
    end
end

--- crafting speed fixes ---
data.raw["assembling-machine"]["oil-refinery"].crafting_speed = 2
data.raw["assembling-machine"]["liquifier"].crafting_speed = 1
data.raw["assembling-machine"]["liquifier-2"].crafting_speed = 2
data.raw["assembling-machine"]["angels-chemical-plant"].crafting_speed = 1
data.raw["assembling-machine"]["angels-chemical-plant-2"].crafting_speed = 2
data.raw["assembling-machine"]["advanced-chemical-plant"].crafting_speed = 1
data.raw["assembling-machine"]["advanced-chemical-plant-2"].crafting_speed = 2
data.raw["assembling-machine"]["gas-refinery-small"].crafting_speed = 1
data.raw["assembling-machine"]["gas-refinery"].crafting_speed = 2
data.raw["assembling-machine"]["separator-2"].crafting_speed = 2

data.raw["assembling-machine"]["washing-plant"].crafting_speed = 2
data.raw["assembling-machine"]["angels-electric-boiler-2"].crafting_speed = 2

data.raw["assembling-machine"]["ore-floatation-cell"].crafting_speed = 1
data.raw["assembling-machine"]["ore-leaching-plant"].crafting_speed = 1
data.raw["assembling-machine"]["ore-refinery"].crafting_speed = 1
data.raw["assembling-machine"]["ore-crusher"].crafting_speed = 2
data.raw["assembling-machine"]["ore-powderizer"].crafting_speed = 2
data.raw["assembling-machine"]["crystallizer"].crafting_speed = 1
data.raw["assembling-machine"]["ore-sorting-facility"].crafting_speed = 1
data.raw["assembling-machine"]["ore-sorting-facility-2"].crafting_speed = 2
data.raw["assembling-machine"]["ore-sorting-facility"].crafting_speed = 1

data.raw["assembling-machine"]["bio-refugium-fish"].crafting_speed = 1
data.raw["assembling-machine"]["bio-refugium-puffer"].crafting_speed = 1
data.raw["assembling-machine"]["algae-farm"].crafting_speed = 1
data.raw["assembling-machine"]["algae-farm-2"].crafting_speed = 2
data.raw["assembling-machine"]["seed-extractor"].crafting_speed = 1

data.raw["mining-drill"]["thermal-bore"].mining_speed = 1

--- final module slot fixes P2---
data.raw["mining-drill"]["thermal-extractor"].module_slots = 4
data.raw["assembling-machine"]["ore-sorting-facility-2"].module_slots = 4
data.raw["assembling-machine"]["strand-casting-machine"].module_slots = 3

--- plastic buff ---
local PLASTIC_MULTIPLIER = 5
vgal.recipe.multiply_results("liquid-plastic-1", PLASTIC_MULTIPLIER)
vgal.recipe.multiply_results("liquid-plastic-2", PLASTIC_MULTIPLIER)
vgal.recipe.multiply_results("liquid-plastic-3", PLASTIC_MULTIPLIER)
vgal.recipe.multiply_results("bio-plastic-1", PLASTIC_MULTIPLIER)
vgal.recipe.multiply_results("bio-plastic-2", PLASTIC_MULTIPLIER)

-- vgal.item.set_subgroup("angels-iron-pebbles", "vgal-iron-variants")
-- vgal.item.set_subgroup("angels-copper-pebbles", "vgal-copper-variants")

-- vgal.item.set_subgroup("angels-iron-nugget", "vgal-iron-variants")
-- vgal.item.set_subgroup("angels-copper-nugget", "vgal-copper-variants")

-- vgal.item.set_subgroup("angels-iron-slag", "vgal-iron-variants")
-- vgal.item.set_subgroup("angels-copper-slag", "vgal-copper-variants")

-- vgal.item.set_subgroup("stone-crushed", "ore-processing-a")

-- vgal.item.set_order("stone-crushed", "g")

-- vgal.recipe.set_energy_required("catalysator-brown", 2)

-- data.raw["recipe"]["angels-iron-pebbles"].main_product = "angels-iron-pebbles"
-- data.raw["recipe"]["angels-copper-pebbles"].main_product = "angels-copper-pebbles"

-- vgal.recipe.clear_subgroup_and_order("angels-iron-pebbles")
-- vgal.recipe.clear_subgroup_and_order("angels-copper-pebbles")

-- vgal.recipe.clear_subgroup_and_order("solid-mud-landfill")

-- local function fix_coolant(recipeName)
--     local recipe = data.raw["recipe"][recipeName]
--     local cAmount = 0
--     for _, value in ipairs(recipe.ingredients) do
--         vgal.recipe.normalize_table_value(value)
--         if value.name == "liquid-coolant" then
--             cAmount = value.amount
--         end
--     end
--     for _, value in ipairs(recipe.results) do
--         vgal.recipe.normalize_table_value(value)
--         if value.name == "liquid-coolant-used" then
--             value.amount = cAmount
--         end
--     end
-- end

-- vgal.recipe.overlay_tier("angels-iron-pebbles", 1)
-- vgal.recipe.overlay_tier("angels-copper-pebbles", 1)

-- vgal.recipe.multiply_results("coolant-cool-steam", 2)

-- vgal.recipe.multiply_results("roll-iron-casting", 1.5)
-- vgal.recipe.multiply_results("roll-iron-casting-fast", 1.5)
-- fix_coolant("roll-iron-casting-fast")
-- vgal.recipe.bulkify("rod-stack-iron-casting", 2)
-- vgal.recipe.multiply_results("rod-stack-iron-casting", 1.5)
-- vgal.recipe.multiply_results("rod-stack-iron-casting-fast", 1.5)
-- fix_coolant("rod-stack-iron-casting-fast")
-- -- vgal.recipe.multiply_results("angels-plate-iron", 1.5)
-- -- vgal.recipe.multiply_results("angels-roll-iron-converting", 1.5)
-- -- vgal.recipe.multiply_results("angels-roll-steel-converting", 1.5)

-- -- vgal.recipe.set_energy_required("angels-roll-iron-converting", 2)

-- vgal.recipe.add_ingredient("ingot-iron-smelting", { "graphite", 6 })
-- vgal.recipe.add_ingredient("ingot-iron-smelting", { "solid-coke", 8 })
-- vgal.recipe.multiply_results("ingot-iron-smelting", 2)

-- -- -- vgal.recipe.set_category("powder-nickel", "ore-refining-t1")
-- -- vgal.recipe.multiply_results("angels-rod-stack-iron-converting", 1.5)


-- data.raw["recipe"]["iron-plate"] = {
--     type = "recipe",
--     name = "iron-plate",
--     category = "smelting",
--     energy_required = 3.2,
--     ingredients = vgal.build.table({
--         { "rocket-fuel",  1 },
--         { "uranium-235",  1 },
--         { "solid-carbon", 5 },
--     }),
--     result = "iron-plate"
-- }
-- data.raw["recipe"]["copper-plate"] = {
--     type = "recipe",
--     name = "copper-plate",
--     category = "smelting",
--     energy_required = 3.2,
--     ingredients = { { "copper-ore", 1 } },
--     result = "copper-plate"
-- }
-- -- vgal.recipe.set_ingredients("filter-coal", {
-- --     { type = "item", name = "filter-frame", amount = 5 },
-- --     { type = "item", name = "coal", amount = 1 },
-- -- })
-- vgal.recipe.set_ingredients("iron-processed-processing", {
--     { type = "item", name = "processed-iron", amount = 2 },
-- })
-- vgal.recipe.set_ingredients("copper-processed-processing", {
--     { type = "item", name = "processed-copper", amount = 2 },
-- })

-- vgal.recipe.multiply_results("wood-pellets", 3)
-- vgal.recipe.set_results("slag-processing-9", {
--     { type = "item", name = "uranium-ore", amount = 2 },
-- })
-- vgal.recipe.remove_result("angelsore1-chunk", "geode-blue")
-- vgal.recipe.remove_result("angelsore3-chunk", "geode-yellow")

-- vgal.recipe.bulkify("angelsore1-chunk", 3)
-- vgal.recipe.bulkify("angelsore3-chunk", 3)

-- vgal.recipe.set_energy_required("angelsore1-chunk", 2)
-- vgal.recipe.set_energy_required("angelsore3-chunk", 2)

-- vgal.recipe.bulkify("angelsore1-crystal", 3)
-- vgal.recipe.bulkify("angelsore3-crystal", 3)

-- vgal.recipe.set_energy_required("angelsore1-crystal", 2)
-- vgal.recipe.set_energy_required("angelsore3-crystal", 2)
-- -- vgal.recipe.set_ingredients("catalyst-metal-yellow", {
-- --     { type = "item", name = "catalyst-metal-carrier", amount = 10 },
-- --     { type = "item", name = "apm_coal_briquette", amount = 1 },
-- -- })
-- -- vgal.recipe.set_ingredients("catalyst-metal-blue", {
-- --     { type = "item", name = "catalyst-metal-carrier", amount = 10 },
-- --     { type = "item", name = "graphite", amount = 1 },
-- -- })

-- vgal.recipe.bulkify("slag-processing-stone", 10)

-- vgal.item.unhide("catalysator-brown")
-- vgal.recipe.unhide("catalysator-brown")
-- vgal.tech.add_recipe("advanced-ore-refining-2", "catalysator-brown")

-- -- I think apm is remove the washing tech and recipes, im just cleaning up a bit, dont mind me. \/\/\/

-- vgal.tech.remove_prerequisite("angels-composting", "water-washing-1")
-- vgal.tech.remove_prerequisite("angels-stone-smelting-1", "water-washing-1")
-- vgal.tech.remove_prerequisite("angels-iron-smelting-3", "water-washing-1")
-- vgal.tech.remove_prerequisite("geode-processing-1", "water-washing-2")

-- vgal.fluid.hide("water-heavy-mud")
-- vgal.fluid.hide("water-concentrated-mud")
-- vgal.fluid.hide("water-light-mud")
-- vgal.fluid.hide("water-thin-mud")

-- vgal.recipe.hide("solid-sand")
-- vgal.recipe.hide("washing-1")
-- vgal.recipe.hide("washing-2")
-- vgal.recipe.hide("washing-3")
-- vgal.recipe.hide("washing-4")
-- vgal.recipe.hide("washing-5")


-- vgal.tech.add_recipe("water-treatment", "seafloor-pump")
-- vgal.tech.add_recipe("water-treatment", "solid-limestone")
-- vgal.tech.add_recipe("water-treatment", "washing-plant")
-- vgal.tech.add_recipe("water-treatment-3", "washing-plant-2")
-- -- data.raw["recipe"]["solid-sand"].icons = vgal.icon.register({
-- --     vgal.icon.get("solid-sand"),
-- --     vgal.icon.get("water-purified", "fluid"),
-- -- })

-- vgal.recipe.hide_and_queue("wood-charcoal")
-- vgal.recipe.hide_and_queue("angels-clay-brick-raw")
-- vgal.recipe.hide_and_queue("angels-clay-brick")

-- vgal.recipe.hide_and_queue("green-waste-water-purification")

-- vgal.recipe.hide_and_queue("solid-geodes")
-- vgal.item.hide("geode-purple")
-- vgal.item.hide("geode-lightgreen")
-- vgal.item.hide("geode-cyan")
-- vgal.item.hide("geode-red")

-- vgal.recipe.bulkify("angelsore1-crushed", 4)
-- vgal.recipe.set_energy_required("angelsore1-crushed", 1)
-- vgal.recipe.bulkify("angelsore3-crushed", 4)
-- vgal.recipe.set_energy_required("angelsore3-crushed", 1)

-- vgal.tech.add_recipe("water-treatment", "clarifier")



-- data.raw.item["solid-sand"].subgroup = data.raw["recipe"]["solid-sand"].subgroup
-- data.raw.item["solid-sand"].order = data.raw["recipe"]["solid-sand"].order

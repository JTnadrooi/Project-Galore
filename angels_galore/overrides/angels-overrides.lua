-- vgal.recipe.unhide("thermal-water-purification")
-- vgal.tech.add_recipe("vgal-hydrochloric-intermediates", "thermal-water-purification")

data.raw.recipe["angels-iron-pebbles-smelting"].energy_required = 6.4
data.raw.recipe["angels-iron-nugget-smelting"].energy_required = 6.4
data.raw.recipe["angels-copper-pebbles-smelting"].energy_required = 6.4
data.raw.recipe["angels-copper-nugget-smelting"].energy_required = 6.4
data.raw.recipe["angelsore1-crushed-smelting"].energy_required = 6.4
data.raw.recipe["angelsore3-crushed-smelting"].energy_required = 6.4

-- vgal.recipe.set_energy_required("molten-iron-smelting-1", 2)
-- vgal.recipe.set_energy_required("molten-copper-smelting", 2)

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

vgal.recipe.set_icons("iron-ore-processing", vgal.icon.register({
    vgal.icon.get("processed-iron"),
    vgal.icon.get_in("iron-ore"),
}))
vgal.recipe.set_icons("copper-ore-processing", vgal.icon.register({
    vgal.icon.get("processed-copper"),
    vgal.icon.get_in("copper-ore"),
}))


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

-- data.raw["offshore-pump"]["ground-water-pump"].fluid = "apm_sea_water"
-- data.raw["offshore-pump"]["sea-pump-placeable"].fluid = "apm_sea_water"
-- data.raw["offshore-pump"]["sea-pump-placeable"].fluid = "apm_sea_water"
-- data.raw["resource"]["sea-pump-resource"].localised_name = { "fluid-name.apm_sea_water" }
-- data.raw["resource"]["sea-pump-resource"].minable.results[1].name = "apm_sea_water"
-- data.raw["resource"]["sea-pump-resource"].minable.results[1].name = "apm_sea_water"
-- data.raw["mining-drill"]["sea-pump"].output_fluid_box.filter = "apm_sea_water"

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

-- vgal.recipe.set_ingredients("catalyst-metal-red", {
--     { type = "item", name = "catalyst-metal-carrier", amount = 10 },
--     { type = "item", name = "angels-ore1",            amount = 1 },
-- })
-- vgal.recipe.set_ingredients("catalyst-metal-green", {
--     { type = "item", name = "catalyst-metal-carrier", amount = 10 },
--     { type = "item", name = "angels-ore3",            amount = 1 },
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
-- local plasticBuffCoefficient = 5

-- vgal.recipe.multiply_results("liquid-plastic-1", plasticBuffCoefficient)
-- vgal.recipe.multiply_results("liquid-plastic-2", plasticBuffCoefficient)
-- vgal.recipe.multiply_results("liquid-plastic-3", plasticBuffCoefficient)
-- vgal.recipe.multiply_results("bio-plastic-1", plasticBuffCoefficient)
-- vgal.recipe.multiply_results("bio-plastic-2", plasticBuffCoefficient)

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
-- data.raw["assembling-machine"]["bio-refugium-puffer"].crafting_speed = 1

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

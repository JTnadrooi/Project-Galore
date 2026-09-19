local tungsten_metal = vgal.defines.metal_tungsten

-- data.raw["item"][tungsten_metal.plate].icon = ""
-- data.raw["item"][tungsten_metal.plate].icon_size = 1

vgal.item.hide("angels-plate-tungsten")
vgal.item.hide("angels-tungsten-ore")
vgal.item.hide("angels-casting-powder-tungsten")
vgal.fluid.hide("angels-gas-tungsten-hexafluoride")
vgal.recipe.hide("angels-gas-tungsten-hexafluoride")
vgal.recipe.hide("angels-plate-tungsten")
vgal.recipe.hide("angels-casting-powder-tungsten")
vgal.recipe.hide("angels-casting-powder-tungsten-2")

-- do
--     local angels_tungsten_plate_recipe = data.raw["recipe"]["angels-plate-tungsten"]
--     local tungsten_plate_recipe = table.deepcopy(angels_tungsten_plate_recipe)

--     tungsten_plate_recipe.name = tungsten_metal.plate
--     vgal.recipe.replace_ingredient(tungsten_plate_recipe, "angels-casting-powder-tungsten", tungsten_metal.powder)
--     vgal.recipe.replace_result(tungsten_plate_recipe, "angels-plate-tungsten", tungsten_metal.plate)

--     data:extend({ tungsten_plate_recipe })

--     vgal.recipe.hide(angels_tungsten_plate_recipe)
-- end

do
    local tungsten_plate_recipe = data.raw["recipe"]["tungsten-plate"]

    tungsten_plate_recipe.energy_required = 5
    tungsten_plate_recipe.categories = { "angels-sintering" }
    tungsten_plate_recipe.ingredients = vgal.build.io({
        { tungsten_metal.powder, 1 },
    })
    tungsten_plate_recipe.results = vgal.build.io({
        { tungsten_metal.plate, 1 },
    })
end

do
    local tungsten_carbide_recipe = data.raw["recipe"]["tungsten-carbide"]
    -- vgal.recipe.replace_ingredient(tungsten_carbide_recipe, tungsten_metal.ore, tungsten_metal.powder)
    tungsten_carbide_recipe.ingredients = vgal.build.io({
        { tungsten_metal.powder, 1 },
        { "angels-gas-methane",  40 },
    })
end

do
    local tungsten_powder_recipe = data.raw["recipe"][tungsten_metal.powder]
    tungsten_powder_recipe.energy_required = 1
    tungsten_powder_recipe.ingredients = vgal.build.io({
        { "angels-solid-tungsten-oxide", 3 },
        { "angels-solid-carbon",         1 },
    })
    tungsten_powder_recipe.results = vgal.build.io({
        { tungsten_metal.powder, 3 },
    })
end

vgal.recipe.replace_ingredient("angels-solid-tungsten-oxide", "angels-tungsten-ore", tungsten_metal.ore)
vgal.recipe.replace_ingredient(tungsten_metal.processed, "angels-tungsten-ore", tungsten_metal.ore)
vgal.recipe.add_ingredient(tungsten_metal.pellet, "angels-solid-cement") -- different than clay bc its powder metallurgy or smth (cement can also be used as binder and clay isnt really obtainable here.)

-- icon fixes, uses asagal temporarily
for _, invalid_icon_item_name in ipairs({
    tungsten_metal.pellet,
    tungsten_metal.processed,
    -- tungsten_metal.plate,
    tungsten_metal.powder,
    "angels-solid-tungsten-oxide",
    "angels-solid-ammonium-paratungstate",
}) do
    local invalid_icon_item = data.raw["item"][invalid_icon_item_name]
    -- invalid_icon_item.icon = vgal.string.replace(invalid_icon_item.icon, "iron", "holmium")
    invalid_icon_item.icon = vgal.string.replace(invalid_icon_item.icon, "angelssmeltinggraphics", "angels_space_age_galore")
end

-- tech icon fixes
-- casting tech icons are a bit too advanced and big for me to edit :(
for _, invalid_icon_tech_name in ipairs({
    "angels-tungsten-smelting-1",
    "angels-tungsten-smelting-2",
    "angels-tungsten-smelting-3",
}) do
    local invalid_icon_tech = data.raw["technology"][invalid_icon_tech_name]
    -- invalid_icon_item.icon = vgal.string.replace(invalid_icon_item.icon, "iron", "holmium")
    invalid_icon_tech.icon = vgal.string.replace(invalid_icon_tech.icon, "tungsten", "nitinol")
end

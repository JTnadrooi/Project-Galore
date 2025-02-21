if mods["bzcarbon"] or mods["bztin"] then
    vgal.recipe.all.multiply_results("electronic-circuit", 2)
    -- vgal.recipe.multiply_results("vgal-wood-electronic-circuit", 0.5)
    -- vgal.recipe.multiply_results("vgal-wood-heavy-oil-electronic-circuit", 0.5)
end

if mods["bzcarbon"] then
    vgal.recipe.all.link_ingredient({ type = "item", name = "diamond", amount = 4 }, "assembling-machine-3")
    vgal.recipe.all.link_ingredient({ type = "item", name = "diamond", amount = 1 }, "low-density-structure")
    vgal.recipe.all.link_result({ type = "item", name = "diamond", amount = 1, probability = 0.5 },
        "low-density-structure")

    vgal.recipe.add_result("vgal-crude-oil-sulfur", { type = "item", name = "carbon-black", amount = 1 })
    vgal.recipe.add_result("vgal-steam-crude-oil-sulfur", { type = "item", name = "carbon-black", amount = 1 })
    vgal.recipe.add_result("vgal-steam-advanced-oil-processing", { type = "item", name = "carbon-black", amount = 1 })

    vgal.recipe.replace_ingredient("vgal-petroleum-gas-coal-heavy-oil", "coal", "carbon-black")
    vgal.recipe.replace_ingredient("vgal-copper-cable-plastic-bar", "coal", "carbon-black")

    vgal.recipe.all.link_ingredient({ type = "item", name = "graphite", amount = 1 }, "electronic-circuit", 0.5)
    -- vgal.recipe.all.link_ingredient({ type = "item", name = "graphite", amount = 1 }, "lubricant", 0.05)
    vgal.recipe.all.link_ingredient({ type = "item", name = "graphite", amount = 1 }, "battery")

    data.raw.recipe["vgal-coal-uranium-235-nuclear-fuel"].ingredients = vgal.build.table({
        { "rocket-fuel", 1 },
        { "uranium-235", 1 },
        { "graphite",    5 },
    })
    data.raw.recipe["vgal-coal-uranium-235-nuclear-fuel"].icons = vgal.icon.register {
        vgal.icon.get("nuclear-fuel"),
        vgal.icon.get_in("graphite"),
    }

    if mods["space-age"] then
        vgal.recipe.deep_hide("ammonia-from-spoilage")
        vgal.recipe.replace_ingredient("vgal-carbon-sulfur-lubricant", "carbon", "graphite")
        vgal.recipe.all.link_ingredient({ type = "item", name = "activated-carbon", amount = 10 }, "supercapacitor")
        vgal.recipe.all.link_ingredient({ type = "item", name = "polyacryonitrile", amount = 1 }, "carbon-fiber")
    end
end

if mods["bzsilicon"] then
    vgal.recipe.all.link_ingredient({ type = "item", name = "silicon", amount = 1 }, "advanced-circuit")
    vgal.recipe.all.link_ingredient({ type = "item", name = "silicon", amount = 2 }, "processing-unit")
    vgal.recipe.all.link_ingredient({ type = "item", name = "silicon", amount = 2 }, "solar-panel")

    vgal.recipe.all.replace_ingredient("stone-brick", { type = "item", name = "silica", amount = 5 }, "concrete")
    vgal.recipe.all.replace_ingredient("copper-cable", { type = "item", name = "optical-fiber", amount = 1 }, "beacon")
    if mods["bzcarbon"] then
        vgal.recipe.all.replace_ingredient("stone-brick", { type = "item", name = "crucible", amount = 1 },
            "electric-furnace", 0.1)
    end
end

if mods["bzlead"] then
    vgal.recipe.all.link_ingredient({ type = "item", name = "lead-plate", amount = 5 }, "solar-panel")
    vgal.recipe.all.link_ingredient({ type = "item", name = "lead-expansion-bolt", amount = 4 }, "assembling-machine-1")
    vgal.recipe.all.link_ingredient({ type = "item", name = "lead-expansion-bolt", amount = 4 }, "electric-furnace")
    vgal.recipe.all.link_ingredient({ type = "item", name = "lead-expansion-bolt", amount = 4 }, "substation")
    vgal.recipe.all.link_ingredient({ type = "item", name = "lead-expansion-bolt", amount = 4 }, "lab")
    vgal.recipe.all.link_ingredient({ type = "item", name = "lead-expansion-bolt", amount = 8 }, "gun-turret")
    vgal.recipe.all.link_ingredient({ type = "item", name = "lead-expansion-bolt", amount = 100 }, "centrifuge")

    vgal.recipe.all.replace_ingredient("iron-plate", { type = "item", name = "lead-plate", amount = 1 }, "battery")
    vgal.recipe.all.replace_ingredient("iron-plate", { type = "item", name = "lead-plate", amount = 1 }, "pipe")
    vgal.recipe.all.replace_ingredient("iron-plate", { type = "item", name = "lead-plate", amount = 1 }, "sulfuric-acid")
    vgal.recipe.all.replace_ingredient("iron-plate", { type = "item", name = "lead-plate", amount = 1 },
        "uranium-fuel-cell")

    vgal.recipe.deep_hide("vgal-steel-plate-uranium-fuel-cell")
end

if mods["bztin"] then
    vgal.recipe.all.link_ingredient({ type = "item", name = "tin-plate", amount = 5 }, "lab")
    vgal.recipe.all.link_ingredient({ type = "fluid", name = "organotins", amount = 2.5 }, "plastic-bar")
    vgal.recipe.all.link_ingredient({ type = "item", name = "solder", amount = 5 }, "assembling-machine-2")
    vgal.recipe.all.link_ingredient({ type = "item", name = "solder", amount = 1 }, "electronic-circuit", 0.5)
    vgal.recipe.all.link_ingredient({ type = "item", name = "solder", amount = 1 }, "advanced-circuit", 1)
    vgal.recipe.all.link_ingredient({ type = "item", name = "solder", amount = 2 }, "substation")
    vgal.recipe.all.link_ingredient({ type = "item", name = "solder", amount = 2 }, "accumulator")
    vgal.recipe.all.link_ingredient({ type = "item", name = "solder", amount = 20 }, "roboport")

    vgal.recipe.all.replace_ingredient("iron-plate", { type = "item", name = "solder", amount = 1 }, "pipe-to-ground",
        0.4)

    if mods["space-age"] then
        vgal.recipe.all.link_ingredient({ type = "item", name = "tin-plate", amount = 1 }, "superconductor")
    end
end

if mods["bztitanium"] then
    vgal.recipe.all.replace_ingredient("steel-plate", { type = "item", name = "titanium-plate", amount = 1 },
        "low-density-structure")
    vgal.recipe.all.replace_ingredient("steel-plate", { type = "item", name = "titanium-plate", amount = 1 },
        "flying-robot-frame")

    if mods["space-age"] then
        vgal.recipe.all.link_ingredient({ type = "item", name = "titanium-plate", amount = 2 },
            "space-platform-foundation")
        vgal.recipe.all.link_ingredient({ type = "fluid", name = "vacuum", amount = 10 },
            "low-density-structure")
    end
end

if mods["bzzirconium"] then
    vgal.recipe.all.link_ingredient({ type = "item", name = "zirconia", amount = 10 }, "low-density-structure")
    vgal.recipe.all.link_ingredient({ type = "item", name = "zirconia", amount = 6 }, "steel-furnace")
    vgal.recipe.all.link_ingredient({ type = "item", name = "zirconia", amount = 1 }, "explosives", 0.1)

    local ingredient = mods["bztin"] and "zircaloy-4" or "zirconium-plate"

    vgal.recipe.all.link_ingredient({ type = "item", name = ingredient, amount = 1 }, "nuclear-fuel")
    vgal.recipe.all.link_ingredient({ type = "item", name = ingredient, amount = 1 }, "uranium-fuel-cell", 0.5)
    vgal.recipe.all.link_ingredient({ type = "item", name = ingredient, amount = 100 }, "nuclear-reactor")
end

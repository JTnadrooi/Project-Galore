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

    -- vgal.recipe.all.link_ingredient({ type = "fluid", name = "organotins", amount = 2.5 }, "plastic-bar")
    vgal.recipe.all.link_ingredient({ type = "item", name = "graphite", amount = 1 }, "electronic-circuit", 0.5)
    -- vgal.recipe.all.link_ingredient({ type = "item", name = "graphite", amount = 1 }, "lubricant", 0.05)
    vgal.recipe.all.link_ingredient({ type = "item", name = "graphite", amount = 1 }, "battery")

    vgal.recipe.remove_ingredient("vgal-wood-electronic-circuit", "graphite")
    vgal.recipe.remove_ingredient("vgal-wood-heavy-oil-electronic-circuit", "graphite")
    -- vgal.recipe.remove_ingredient("vgal-copper-cable-plastic-bar", "petroleum-gas")
    data.raw.recipe["vgal-coal-uranium-235-nuclear-fuel"].ingredients = vgal.build.table({
        { "rocket-fuel", 1 },
        { "uranium-235", 1 },
        { "graphite",    5 },
    })
    data.raw.recipe["vgal-coal-uranium-235-nuclear-fuel"].icons = vgal.icon.register {
        vgal.icon.get("nuclear-fuel"),
        vgal.icon.get_in("graphite"),
    }
end

if mods["bzsilicon"] then
    vgal.recipe.all.link_ingredient({ type = "item", name = "silicon", amount = 1 }, "advanced-circuit")
    vgal.recipe.all.link_ingredient({ type = "item", name = "silicon", amount = 2 }, "processing-unit")

    vgal.recipe.all.replace_ingredient("stone-brick", { type = "item", name = "silica", amount = 5 }, "concrete")
    vgal.recipe.all.replace_ingredient("copper-cable", { type = "item", name = "optical-fiber", amount = 1 }, "beacon")
    vgal.recipe.all.replace_ingredient("stone-brick", { type = "item", name = "crucible", amount = 1 },
        "electric-furnace", 0.1)
end

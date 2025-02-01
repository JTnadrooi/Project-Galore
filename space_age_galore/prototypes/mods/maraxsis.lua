if mods["maraxsis"] then
    local packFluids = {
        ["automation-science-pack"] = { "maraxsis-saline-water", 50 },
        ["logistic-science-pack"] = { "maraxsis-brackish-water", 50 },
        ["military-science-pack"] = { "lava", 50 },
        ["chemical-science-pack"] = { "water", 50 },
        ["production-science-pack"] = { "maraxsis-oxygen", 30 },
        ["utility-science-pack"] = { "maraxsis-hydrogen", 60 },
    }
    local scienceRecipes = {}
    for _, recipe in pairs(data.raw["recipe"]) do
        if recipe.name:match("^vgal%-.+%-science%-pack$") then
            table.insert(scienceRecipes, table.deepcopy(recipe))
        end
    end

    for _, recipe in ipairs(scienceRecipes) do
        local resultPack = recipe.results[1].name
        if packFluids[resultPack] then
            ---@cast recipe data.RecipePrototype
            local resultAmount = recipe.results[1].amount
            table.insert(recipe.ingredients,
                { type = "fluid", name = packFluids[resultPack][1], amount = packFluids[resultPack][2] * resultAmount })

            recipe.results[1].amount = resultAmount * 2 -- double amounts
            recipe.category = "maraxsis-hydro-plant"
            recipe.surface_conditions = { {
                property = "pressure",
                min = 400000,
                max = 400000,
            } }
            recipe.order = "y"
            local fluid = data.raw["fluid"][packFluids[resultPack][1]]
            table.insert(recipe.icons,
                { icon = fluid.icon, icon_size = fluid.icon_size, scale = 0.4, shift = { 6, 6 } })

            recipe.name = "vgal-maraxsis-deepsea-research-" .. string.sub(recipe.name, 6)
            data:extend({ recipe })
            table.insert(data.raw["technology"]["maraxsis-deepsea-research"].effects,
                { type = "unlock-recipe", recipe = recipe.name })
        end
    end

    for key, _ in pairs(packFluids) do
        local recipe = data.raw["recipe"]["maraxsis-deepsea-research-" .. key]
        recipe.subgroup = "vgal-" .. key
        recipe.order = "x"
        recipe.main_product = key
    end
end

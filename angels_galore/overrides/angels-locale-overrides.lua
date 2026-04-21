for _, metal in pairs(vgal.defines.metals) do
    -- vgal.recipe.use_recipe_locale(metal.ingot)
    vgal.recipe.use_recipe_locale(metal.ingot .. "-2")
    vgal.recipe.use_recipe_locale(metal.ingot .. "-3")

    -- remove sorting descs referencing removes ores
    data.raw["item"][metal.base_ore].localised_description = { "item-description." .. metal.base_ore }
    for _, state in ipairs(metal.ore_states) do
        data.raw["item"][metal.base_ore .. "-" .. state].localised_description =
        {
            "item-description." .. metal.base_ore .. "-" .. state,
        }
    end
end

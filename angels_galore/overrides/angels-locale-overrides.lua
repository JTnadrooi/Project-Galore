for _, metal in pairs(vgal.defines.metals) do
    -- vgal.recipe.use_recipe_locale(metal.ingot)
    vgal.recipe.use_recipe_locale(metal.ingot .. "-2")
    vgal.recipe.use_recipe_locale(metal.ingot .. "-3")
end

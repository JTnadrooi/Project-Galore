function vgal.recipe.all.link_ingredient(ingredient, mainProductName, multiplier) -- vgal only
    -- local ingredient = {type = vgal.any(ingredientName).type, name = ingredientName}
    for _, recipe in pairs(vgal.recipes) do
        if recipe.main_product == mainProductName then
            vgal.recipe.add_ingredient(recipe.name, ingredient)
        end
    end
end

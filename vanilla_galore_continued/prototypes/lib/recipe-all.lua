function vgal.recipe.all.link_ingredient(ingredient, mainProductName, multiplier) -- vgal only
    multiplier = multiplier or 1
    for _, recipe in pairs(vgal.recipes) do
        if recipe.main_product == mainProductName then
            vgal.recipe.add_ingredient(recipe.name,
                vgal.table.get_multiplied(ingredient, multiplier * vgal.recipe.get_main_product_amount(recipe.name)))
            if recipe.category == "crafting" and ingredient.type == "fluid" then
                recipe.category = "crafting-with-fluid"
            end
        end
    end
end

function vgal.recipe.all.link_result(result, mainProductName, multiplier) -- vgal only
    multiplier = multiplier or 1
    for _, recipe in pairs(vgal.recipes) do
        if recipe.main_product == mainProductName then
            vgal.recipe.add_result(recipe.name,
                vgal.table.get_multiplied(result, multiplier * vgal.recipe.get_main_product_amount(recipe.name)))
        end
    end
end

function vgal.recipe.all.multiply_results(mainProductName, multiplier) -- vgal only
    multiplier = multiplier or 1
    for _, recipe in pairs(vgal.recipes) do
        if recipe.main_product == mainProductName then
            vgal.recipe.multiply_results(recipe.name, multiplier)
        end
    end
end

function vgal.recipe.all.replace_ingredient(sourceIngredientName, newIngredient, mainProductName, multiplier) -- vgal only
    multiplier = multiplier or 1
    for _, recipe in pairs(vgal.recipes) do
        if recipe.main_product == mainProductName then
            if vgal.recipe.has_ingredient(recipe.name, sourceIngredientName) then
                vgal.recipe.add_ingredient(recipe.name,
                    vgal.table.get_multiplied(newIngredient,
                        multiplier * vgal.recipe.get_ingredient_amount(recipe.name, sourceIngredientName)))
                vgal.recipe.remove_ingredient(recipe.name, sourceIngredientName)
            end
        end
    end
end

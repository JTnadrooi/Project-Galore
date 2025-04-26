function vgal.recipe.all.link_ingredient(ingredient, mainProductName, multiplier, search_table) -- vgal only
    search_table = search_table or data.raw["recipe"]
    multiplier = multiplier or 1
    for _, recipe in pairs(search_table) do
        if (mainProductName == nil) or recipe.main_product == mainProductName then
            vgal.recipe.add_ingredient(recipe.name,
                vgal.table.get_multiplied(ingredient, multiplier * vgal.recipe.get_main_product_amount(recipe.name)))
            if recipe.category == "crafting" and ingredient.type == "fluid" then
                recipe.category = "crafting-with-fluid"
            end
        end
    end
end

function vgal.recipe.all.link_result(result, mainProductName, multiplier, search_table) -- vgal only
    search_table = search_table or data.raw["recipe"]
    multiplier = multiplier or 1
    for _, recipe in pairs(search_table) do
        if (mainProductName == nil) or recipe.main_product == mainProductName then
            vgal.recipe.add_result(recipe.name,
                vgal.table.get_multiplied(result, multiplier * vgal.recipe.get_main_product_amount(recipe.name)))
        end
    end
end

function vgal.recipe.all.multiply_results(mainProductName, multiplier, search_table) -- vgal only
    search_table = search_table or data.raw["recipe"]
    multiplier = multiplier or 1
    for _, recipe in pairs(search_table) do
        if (mainProductName == nil) or recipe.main_product == mainProductName then
            vgal.recipe.multiply_results(recipe.name, multiplier)
        end
    end
end

function vgal.recipe.all.multiply_ingredients(mainProductName, multiplier, ingredientName, search_table) -- vgal only
    search_table = search_table or data.raw["recipe"]
    multiplier = multiplier or 1
    for _, recipe in pairs(search_table) do
        if (mainProductName == nil) or recipe.main_product == mainProductName then
            vgal.recipe.multiply_ingredients(recipe.name, multiplier, ingredientName)
        end
    end
end

function vgal.recipe.all.replace_ingredient(sourceIngredientName, newIngredient, mainProductName, multiplier, search_table)
    search_table = search_table or data.raw["recipe"]
    multiplier = multiplier or 1
    for _, recipe in pairs(search_table) do
        if (mainProductName == nil) or recipe.main_product == mainProductName then
            if vgal.recipe.has_ingredient(recipe.name, sourceIngredientName) then
                vgal.recipe.add_ingredient(recipe.name,
                    vgal.table.get_multiplied(newIngredient,
                        multiplier * vgal.recipe.get_ingredient_amount(recipe.name, sourceIngredientName)))
                vgal.recipe.remove_ingredient(recipe.name, sourceIngredientName)
            end
        end
    end
end

function vgal.recipe.all.link_ingredient(ingredient, main_product_name, multiplier, domain_name)
    multiplier = multiplier or 1
    local iterator, dom, start_key
    if domain_name then
        iterator, dom, start_key = vgal.data.domain_pairs(domain_name, "recipe")
    else
        iterator, dom, start_key = pairs(data.raw["recipe"])
    end -- THIS CANNOT BE DONE DIFFERENTLY.
    for _, recipe in iterator, dom, start_key do
        if (main_product_name == nil) or recipe.main_product == main_product_name then
            vgal.recipe.add_ingredient(recipe.name,
                vgal.table.get_multiplied(ingredient, multiplier * vgal.recipe.get_main_product_amount(recipe.name)))
            if recipe.category == "crafting" and ingredient.type == "fluid" then
                recipe.category = "crafting-with-fluid"
            end
        end
    end
end

function vgal.recipe.all.link_result(result, main_product_name, multiplier, domain_name)
    multiplier = multiplier or 1
    local iterator, dom, start_key
    if domain_name then
        iterator, dom, start_key = vgal.data.domain_pairs(domain_name, "recipe")
    else
        iterator, dom, start_key = pairs(data.raw["recipe"])
    end -- THIS CANNOT BE DONE DIFFERENTLY.
    for _, recipe in iterator, dom, start_key do
        if (main_product_name == nil) or recipe.main_product == main_product_name then
            vgal.recipe.add_result(recipe.name,
                vgal.table.get_multiplied(result, multiplier * vgal.recipe.get_main_product_amount(recipe.name)))
        end
    end
end

function vgal.recipe.all.multiply_results(main_product_name, multiplier, domain_name)
    multiplier = multiplier or 1
    local iterator, dom, start_key
    if domain_name then
        iterator, dom, start_key = vgal.data.domain_pairs(domain_name, "recipe")
    else
        iterator, dom, start_key = pairs(data.raw["recipe"])
    end -- THIS CANNOT BE DONE DIFFERENTLY.
    for _, recipe in iterator, dom, start_key do
        if (not main_product_name) or recipe.main_product == main_product_name then
            vgal.recipe.multiply_results(recipe.name, multiplier)
        end
    end
end

function vgal.recipe.all.multiply_ingredients(main_product_name, multiplier, ingredient_name, domain_name)
    multiplier = multiplier or 1
    local iterator, dom, start_key
    if domain_name then
        iterator, dom, start_key = vgal.data.domain_pairs(domain_name, "recipe")
    else
        iterator, dom, start_key = pairs(data.raw["recipe"])
    end -- THIS CANNOT BE DONE DIFFERENTLY.
    for _, recipe in iterator, dom, start_key do
        if (main_product_name == nil) or recipe.main_product == main_product_name then
            vgal.recipe.multiply_ingredients(recipe.name, multiplier, ingredient_name)
        end
    end
end

function vgal.recipe.all.replace_ingredient(source_ingredient_name, newIngredient, main_product_name, multiplier,
                                            domain_name)
    multiplier = multiplier or 1
    local iterator, dom, start_key
    if domain_name then
        iterator, dom, start_key = vgal.data.domain_pairs(domain_name, "recipe")
    else
        iterator, dom, start_key = pairs(data.raw["recipe"])
    end -- THIS CANNOT BE DONE DIFFERENTLY.
    for _, recipe in iterator, dom, start_key do
        if (main_product_name == nil) or recipe.main_product == main_product_name then
            if vgal.recipe.has_ingredient(recipe.name, source_ingredient_name) then
                vgal.recipe.add_ingredient(recipe.name,
                    vgal.table.get_multiplied(newIngredient,
                        multiplier * vgal.recipe.get_ingredient_amount(recipe.name, source_ingredient_name)))
                vgal.recipe.remove_ingredient(recipe.name, source_ingredient_name)
            end
        end
    end
end

function vgal.recipe.all.remove_ingredient(ingredient_name, main_product_name, domain_name)
    local iterator, dom, start_key
    if domain_name then
        iterator, dom, start_key = vgal.data.domain_pairs(domain_name, "recipe")
    else
        iterator, dom, start_key = pairs(data.raw["recipe"])
    end -- THIS CANNOT BE DONE DIFFERENTLY.
    for _, recipe in iterator, dom, start_key do
        if (main_product_name == nil) or recipe.main_product == main_product_name then
            vgal.recipe.remove_ingredient(recipe.name, ingredient_name)
        end
    end
end

function vgal.recipe.all.remove_result(result_name, main_product_name, domain_name)
    local iterator, dom, start_key
    if domain_name then
        iterator, dom, start_key = vgal.data.domain_pairs(domain_name, "recipe")
    else
        iterator, dom, start_key = pairs(data.raw["recipe"])
    end -- THIS CANNOT BE DONE DIFFERENTLY.
    for _, recipe in iterator, dom, start_key do
        if (main_product_name == nil) or recipe.main_product == main_product_name then
            vgal.recipe.remove_result(recipe.name, result_name)
        end
    end
end

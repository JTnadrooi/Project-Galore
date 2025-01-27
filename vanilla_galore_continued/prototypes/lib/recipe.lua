---@diagnostic disable: duplicate-set-field, param-type-mismatch

vgal.recipe.toclean = vgal.recipe.toclean or {}

function vgal.recipe.get_if_productivity(mainProduct)
    local validProducts = { "coal", "iron-ore", "copper-ore", "uranium-ore", "stone", "ammonia" }
    for _, product in ipairs(validProducts) do
        if product == mainProduct then return true end
    end
    local recipe = data.raw["recipe"][mainProduct]
    return recipe and (recipe.allow_productivity or false)
end

function vgal.recipe.get_ingredients(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    return recipe.ingredients or {}
end

function vgal.recipe.normalize_dublicates(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    local mem = {}
    local hasval = false
    if recipe.ingredients then
        for _, ingredient in ipairs(recipe.ingredients) do
            hasval = false
            for _, memVal in ipairs(mem) do
                if memVal.name == ingredient.name then
                    hasval = true
                    memVal.amount = ingredient.amount + memVal.amount
                end
            end
            if not hasval then
                table.insert(mem, ingredient)
            end
        end
    end
    mem = {}
    hasval = false
    if recipe.results then
        for _, result in ipairs(recipe.results) do
            hasval = false
            for _, memVal in ipairs(mem) do
                if memVal.name == result.name then
                    hasval = true
                    memVal.amount = result.amount + memVal.amount
                end
            end
            if not hasval then
                table.insert(mem, result)
            end
        end
    end
end

function vgal.recipe.hide_and_queue(recipeName)
    vgal.recipe.hide(recipeName)
    vgal.recipe.queue_to_clean(recipeName)
end

function vgal.recipe.hide(recipeName)
    data.raw["recipe"][recipeName].hidden = true
end

function vgal.recipe.unhide(recipeName)
    data.raw["recipe"][recipeName].hidden = false
end

function vgal.recipe.copy(recipeName)
    return util.table.deepcopy(data.raw["recipe"][recipeName])
end

function vgal.recipe.force_get_icons(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    if recipe.icons then
        return recipe.icons
    end
    if recipe.icon then
        return {
            {
                icon = recipe.icon,
                icon_size = recipe.icon_size,
            }
        }
    end
    if recipe.results then
        return data.raw["item"][recipe.results[1].name].icons or {
            {
                icon = data.raw["item"][recipe.results[1].name].icon,
                icon_size = data.raw["item"][recipe.results[1].name].icon_size,
            }
        }
    end
    error("")
end

function vgal.recipe.overlay_tier(recipeName, tier)
    local recipe = data.raw["recipe"][recipeName]
    recipe.icons = vgal.icon.register({ vgal.recipe.force_get_icons(recipe.name), vgal.icon.get("tier" .. tier, "raw") })
end

function vgal.recipe.replace_category(recipeName, old, new, force)
    local recipe = data.raw["recipe"][recipeName]
    if (not force) and new == "crafting" then
        if vgal.recipe.has_fluid_ingredient(recipeName) then
            new = "crafting-with-fluid"
        end
    end
    if recipe.category == old then
        recipe.category = new
    end
end

function vgal.recipe.has_fluid_ingredient(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    local toalter = recipe.ingredients
    for _, ingredient in ipairs(toalter) do
        if ingredient.type == "fluid" then
            return true
        end
    end
    return false
end

function vgal.recipe.replace_item(recipeName, old, new)
    vgal.recipe.replace_ingredient(recipeName, old, new)
    vgal.recipe.replace_result(recipeName, old, new)
end

function vgal.recipe.vanillize_number(number, numberType, ingredientName)
    numberType = numberType or "item"
    ingredientName = ingredientName or numberType
    local number = number or 1
    if numberType == "fluid" then
        if number < 10 then
            if string.find(ingredientName, "acid") and number < 5 then
                return 5
            else
                return 10
            end
        end
        if not math.fmod(number, 5) == 0 and number < 100 then
            number = math.floor(number / 10) * 10
        end
        if not math.fmod(number, 10) == 0 and number > 100 then
            number = math.floor(number / 10) * 10
        end
    end
    if numberType == "item" then
        if number > 12 then
            if not math.fmod(number, 5) == 0 then
                number = math.floor(number / 2) * 2
            end
        end
        if number == 11 then number = 10 end
        if number == 9 then number = 10 end
        if number == 7 then number = 8 end
        if number == 3 then number = 4 end
    end
    if numberType == "time" then
        if number > 12 then
            if not math.fmod(number, 5) == 0 then
                number = math.floor(number / 2) * 2
            end
        end
        if number == 11 then number = 10 end
        if number == 9 then number = 8 end
        if number == 7 then number = 8 end
    end
    return number
end

function vgal.recipe.copy_and_extend(recipeName, as)
    local newRecipe = util.table.deepcopy(data.raw["recipe"][recipeName])
    newRecipe.name = as
    data:extend({ newRecipe })
end

function vgal.recipe.replace_ingredient(recipeName, oldIngredient, newIngredient)
    local recipe = data.raw["recipe"][recipeName]
    local toalter = recipe.ingredients
    for _, ingredient in ipairs(toalter) do
        if ingredient.name == oldIngredient then
            if ingredient.name then
                ingredient.name = newIngredient
            end
        end
    end
end

function vgal.recipe.remove_ingredient(recipeName, ingredientName)
    local recipe = data.raw["recipe"][recipeName]
    local toalter = recipe.ingredients
    for i, ingredient in ipairs(toalter) do
        if ingredient.name == ingredientName then
            table.remove(toalter, i)
        end
    end
end

function vgal.recipe.remove_result(recipeName, resultName)
    local recipe = data.raw["recipe"][recipeName]
    if recipe.main_product == resultName then
        recipe.main_product = nil
    end
    if recipe.results then
        local toalter = recipe.results
        for i, result in ipairs(toalter) do
            if result.name == resultName then
                table.remove(toalter, i)
            end
        end
    end
end

function vgal.recipe.remove_item(recipeName, ingredientName)
    vgal.recipe.remove_ingredient(recipeName, ingredientName)
    vgal.recipe.remove_result(recipeName, ingredientName)
end

function vgal.recipe.replace_result(recipeName, oldResult, newResult)
    local recipe = data.raw["recipe"][recipeName]
    if recipe.main_product == oldResult then
        recipe.main_product = newResult
    end
    local toalter = recipe.results
    for _, result in ipairs(toalter) do
        if result.name == oldResult then
            if result.name then
                result.name = newResult
            else
                result[1] = newResult
            end
            return
        end
    end
end

function vgal.recipe.override_iron(recipeName, newIcons)
    local recipe = data.raw["recipe"][recipeName]
    if recipe then
        recipe.icons = newIcons
        recipe.icon = nil
        recipe.icon_size = nil
    end
end

function vgal.recipe.catagory_from_array()

end

function vgal.recipe.add_result(recipeName, newResult, recipeType)
    local recipe = data.raw["recipe"][recipeName]
    vgal.recipe.normalise(recipeName)
    if recipe.results then
        table.insert(recipe.results, newResult)
    else
        if not recipeType then
            error("can't add result to monoresulted recipe without a type. (recipeType = nil)")
        end
    end
end

function vgal.recipe.has_result(recipeName, result)
    local recipe = data.raw["recipe"][recipeName]
    if recipe and recipe.results then
        for _, item in ipairs(vgal.recipe.get_results(recipeName)) do
            if item.name == result then
                return true
            end
            if item[1] == result then
                return true
            end
        end
    end
    return false
end

function vgal.recipe.has_ingredient(recipeName, ingredientName)
    if not ingredientName then
        error()
    end
    for _, item in ipairs(vgal.recipe.get_ingredients(recipeName)) do
        if item.name == ingredientName then
            return true
        end
    end
    return false
end

function vgal.recipe.has_item(recipeName, itemName)
    return vgal.recipe.has_ingredient(recipeName, itemName) or vgal.recipe.has_result(recipeName, itemName)
end

function vgal.recipe.add_ingredients(recipeName, ingredients)
    for _, ingredient in ipairs(ingredients) do
        vgal.recipe.add_ingredient(recipeName, ingredient)
    end
end

function vgal.recipe.increment_results(recipeName, amount)
    amount = amount or 1
    local recipe = data.raw["recipe"][recipeName]
    if recipe.results then
        for _, result in ipairs(recipe.results) do
            result.amount = (result.amount or 1) + amount
        end
    end
end

function vgal.recipe.add_ingredient(recipeName, ingredient)
    local recipe = data.raw["recipe"][recipeName]
    if recipe.ingredients then
        table.insert(recipe.ingredients, ingredient)
    else
        recipe.ingredients = {
            ingredient,
        }
    end
end

function vgal.recipe.queue_to_clean(recipeName)
    table.insert(vgal.recipe.toclean, recipeName)
end

function vgal.recipe.clear_icon_data(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    recipe.icon = nil
    recipe.icon_size = nil
    recipe.icons = nil
end

-- function vgal.recipe.multiply_ingredients(recipeName, multiplier)
--     local recipe = data.raw["recipe"][recipeName]
--     if recipe and recipe.ingredients then
--         for _, item in ipairs(recipe.ingredients) do
--             item.amount = vgal.math.conserve_floor(item.amount * multiplier)
--         end
--     else
--         error("invalid recipe name and or composition")
--     end
-- end

-- function vgal.recipe.multiply_energy_required(recipeName, multiplier)
--     local recipe = data.raw["recipe"][recipeName]
--     recipe.energy_required = (recipe.energy_required or 1) * multiplier
-- end

-- function vgal.recipe.multiply_results(recipeName, multiplier)
--     local recipe = data.raw["recipe"][recipeName]
--     if recipe.results == nil then
--         error("can't perform function multiply_results on recipe without results.")
--     end
--     if recipe.results then
--         for _, item in ipairs(recipe.results) do
--             item.amount = vgal.math.conserve_floor(item.amount * multiplier)
--         end
--     else
--         recipe.result_count = vgal.math.conserve_floor((recipe.result_count or 1) * multiplier)
--     end
-- end

---@diagnostic disable: duplicate-set-field, param-type-mismatch

vgal.recipe.toclean = vgal.recipe.toclean or {}

function string:starts(start)
    return self:sub(1, string.len(start)) == start
end

function vgal.recipe.get_normalized_table_value(value)
    if value[1] then
        return { type = "item", name = value[1], amount = value[2] or 1 }
    else
        return value
    end
end

function vgal.recipe.get_ingredients(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    return recipe.ingredients or {}
end

function vgal.recipe.has_duplicates(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    local mem = {}
    if recipe.ingredients then
        for _, ingredient in ipairs(recipe.ingredients) do
            if vgal.table.slow_contains(mem, ingredient.name or ingredient[1]) then
                return true
            end
            table.insert(mem, ingredient.name)
        end
    end
    mem = {}
    if recipe.results then
        for _, result in ipairs(recipe.results) do
            if vgal.table.slow_contains(mem, result.name or result[1]) then
                return true
            end
            table.insert(mem, result.name)
        end
    end
end

function vgal.recipe.normalize_dublicates(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    local mem = {}
    local hasval = false
    if vgal.recipe.has_duplicates(recipe.name) then
        if recipe.ingredients then
            for _, ingredient in ipairs(recipe.ingredients) do
                vgal.recipe.normalize_table_value(ingredient)
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
                vgal.recipe.normalize_table_value(result)
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
end

function vgal.recipe.hide_and_queue(recipeName)
    vgal.recipe.hide(recipeName)
    vgal.recipe.queue_to_clean(recipeName)
end

function vgal.recipe.hide(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    recipe.hidden = true
end

function vgal.recipe.unhide(recipeName)
    data.raw["recipe"][recipeName].hidden = false
end

function vgal.recipe.copy(recipeName)
    return util.table.deepcopy(data.raw["recipe"][recipeName])
end

local function throw_nil_error(recipeName)
    -- data.raw["recipe"][recipeName].subgroup = "a"
    if not data.raw["recipe"][recipeName] then
        error("No recipe found with name: " .. recipeName)
    end
end
function vgal.recipe.throw_nil_error(recipeName)
    throw_nil_error(recipeName)
end

function vgal.recipe.regularize(recipeName)
    throw_nil_error(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    if recipe.result then
        recipe.results = {
            { type = "item", name = recipe.result, amount = recipe.result_count or 1 },
        }
        recipe.result = nil
        recipe.result_count = nil
        recipe.main_product = nil
    end
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
                icon_mipmaps = recipe.icon_mipmaps,
                icon_size = recipe.icon_size,
            }
        }
    end
    if recipe.results then
        return data.raw["item"][recipe.results[1].name].icons or {
            {
                icon = data.raw["item"][recipe.results[1].name].icon,
                icon_mipmaps = data.raw["item"][recipe.results[1].name].icon_mipmaps,
                icon_size = data.raw["item"][recipe.results[1].name].icon_size,
            }
        }
    end
    error("b")
end

function vgal.recipe.overlay_tier(recipeName, tier)
    local recipe = data.raw["recipe"][recipeName]

    recipe.icons = vgal.icon.register({ vgal.recipe.force_get_icons(recipe.name), vgal.icon.get("tier" .. tier, "raw") })
end

function vgal.recipe.normalize(recipeName)
    throw_nil_error(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    recipe.energy_required = recipe.energy_required or 1
    local normal = recipe.normal
    if normal then
        recipe.ingredients = normal.ingredients or recipe.ingredients
        recipe.results = normal.results or recipe.results
        recipe.result = normal.result or recipe.result
        recipe.result_count = normal.result_count or recipe.result_count
        recipe.energy_required = normal.energy_required or recipe.energy_required
    end
    if recipe.expensive and not normal then error("WHAT") end
    vgal.recipe.regularize(recipeName)
    recipe.normal = nil
    recipe.expensive = nil
end

function vgal.recipe.is_item_group(recipeName, itemGroupName)
    local subg = data.raw["recipe"][recipeName].subgroup
    if subg then
        local group = data.raw["item-subgroup"][subg].group
        return group == itemGroupName
    end
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

function vgal.recipe.set_subgroup(recipeName, subgroup)
    data.raw["recipe"][recipeName].subgroup = subgroup
end

function vgal.recipe.clear_subgroup_and_order(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    recipe.subgroup = nil
    recipe.order = nil
end

function vgal.recipe.sync_subgroups_and_order(recipeName1, recipeName2)
    data.raw["recipe"][recipeName1].subgroup = data.raw["recipe"][recipeName2].subgroup
    data.raw["recipe"][recipeName1].order = data.raw["recipe"][recipeName2].order
end

function vgal.recipe.replace_subgroup(recipeName, old, new)
    local recipe = data.raw["recipe"][recipeName]
    if recipe.subgroup == old then
        recipe.subgroup = new
    end
end

function vgal.recipe.has_fluid_ingredient(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    local toalter = recipe.ingredients
    for _, ingredient in ipairs(toalter) do
        local normalized = vgal.recipe.get_normalized_table_value(ingredient)
        if normalized.type == "fluid" then
            return true
        end
    end
    return false
end

function vgal.recipe.replace_item(recipeName, old, new)
    vgal.recipe.replace_ingredient(recipeName, old, new)
    vgal.recipe.replace_result(recipeName, old, new)
end

-- vgal["recipe"]["replace_item"]("amogusrecipe")
function vgal.recipe.get_bulk_score(recipeName)
    -- vgal.recipe.normalize(recipeName)
    -- local recipe = data.raw["recipe"][recipeName]
    -- local inval = 0
    -- local outval = 0
    -- for index, ingredient in ipairs(recipe.ingredients) do
    --     vgal.recipe.normalize_table_value(ingredient)
    --     if ingredient.type == "fluid" then
    --         inval = inval + ingredient.amount
    --     end
    -- end
    -- for index, result in ipairs(recipe.results) do
    --     vgal.recipe.normalize_table_value(result)
    --     if result.type == "fluid" then
    --         outval = outval + result.amount
    --     end
    -- end
    -- local score = 0
    -- if inval ~= 0 and outval ~= 0 then
    --    score = (outval / inval)
    -- else
    --     score = 1
    -- end
    -- if inval < 30 then
    --     score = score * inval * 0.5
    -- end
    -- if score < 1.1 then
    --     score = 1
    -- end
    -- if score ~= score then -- nan check
    --     error("AA")
    -- end
    -- return math.floor(score)
    return 1
end

function vgal.recipe.vanillize_number(number, numberType, ingredientName)
    numberType = numberType or "item"
    ingredientName = ingredientName or numberType
    local number = number or 1
    local isFluid = numberType == "fluid"
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

function vgal.recipe.copy_claim_extend(recipeName, as)
    local newRecipe = util.table.deepcopy(data.raw["recipe"][recipeName])
    newRecipe.name = as
    vgal.data.extend({ newRecipe })
    vgal.recipe.normalize(newRecipe.name)
    vgal.recipe.unhide(newRecipe.name)
end

function vgal.recipe.vanillize(recipeName)
    vgal.recipe.normalize(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    vgal.recipe.bulkify(recipeName, vgal.recipe.get_bulk_score(recipeName))
    vgal.recipe.normalize(recipeName)
    for index, ingredient in ipairs(recipe.ingredients) do
        vgal.recipe.normalize_table_value(ingredient)
        ingredient.amount = vgal.recipe.vanillize_number(ingredient.amount, ingredient.type, ingredient.name)
    end
    for index, result in ipairs(recipe.results) do
        vgal.recipe.normalize_table_value(result)
        result.amount = vgal.recipe.vanillize_number(result.amount, result.type, result.name)
    end
    -- for index, result in ipairs(recipe.results) do
    --     result = vgal.recipe.get_normalized_table_value(result)
    -- end
end

function vgal.recipe.normalize_table_value(value)
    value = vgal.recipe.get_normalized_table_value(value)
end

function vgal.recipe.replace_ingredient(recipeName, oldIngredient, newIngredient)
    -- if data.raw["recipe"][recipeName].ingredients[oldIngredient] then
    --     data.raw["recipe"][recipeName].ingredients[oldIngredient].name = newIngredient
    -- end
    local recipe = data.raw["recipe"][recipeName]
    -- if not recipe.ingredients then return end
    local toalter = recipe.ingredients
    for _, ingredient in ipairs(toalter) do
        local normalized = vgal.recipe.get_normalized_table_value(ingredient)
        if normalized.name == oldIngredient then
            if ingredient.name then
                ingredient.name = newIngredient
            else
                ingredient[1] = newIngredient
            end
            return
        end
    end
end

function vgal.recipe.remove_ingredient(recipeName, ingredientName)
    local recipe = data.raw["recipe"][recipeName]
    local toalter = recipe.ingredients
    for i, ingredient in ipairs(toalter) do
        local normalized = vgal.recipe.get_normalized_table_value(ingredient)
        if normalized.name == ingredientName then
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
            local normalized = vgal.recipe.get_normalized_table_value(result)
            if normalized.name == resultName then
                table.remove(toalter, i)
            end
        end
        -- else
        --     if recipe.result == resultName then
        --         recipe.result = nil
        --         recipe.result_count = nil
        --         recipe.results = {}
        --     end
        --     if recipe.normal and recipe.normal.result == resultName then
        --         error()
        --     end
        --     if recipe.expensive and recipe.expensive.result == resultName then
        --         error()
        --     end
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
    -- for _, result in ipairs(recipe.results) do
    --     local normalized = vgal.recipe.get_normalized_table_value(result)
    --     if normalized.name == oldResult then
    --         vgal.recipe.normalize(recipeName)
    --         if result.name then
    --             result.name = newResult
    --         else
    --             result[1] = newResult
    --         end
    --         if recipe.main_product == oldResult then
    --             recipe.main_product = newResult
    --         end

    --         return
    --     end
    -- end
    local toalter = recipe.results
    for _, result in ipairs(toalter) do
        local normalized = vgal.recipe.get_normalized_table_value(result)
        if normalized.name == oldResult then
            if result.name then
                result.name = newResult
            else
                result[1] = newResult
            end
            return
        end
    end
end

function vgal.recipe.add_result(recipeName, newResult, recipeType)
    local recipe = data.raw["recipe"][recipeName]
    vgal.recipe.normalize(recipeName)
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
    if recipe.result then return recipe.result == result end
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
    local recipe = data.raw["recipe"][recipeName]

    for _, item in ipairs(vgal.recipe.get_ingredients(recipeName)) do
        if item.name == ingredientName then
            return true
        end
        if item[1] == ingredientName then
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

function vgal.recipe.add_ingredient(recipeName, ingredient, amount)
    local recipe = data.raw["recipe"][recipeName]
    if not amount then
        amount = 1
    end
    if type(ingredient) == "string" then
        ingredient = { ingredient, 1 }
    end
    ingredient = vgal.recipe.get_normalized_table_value(ingredient)
    ingredient.amount = ingredient.amount * amount
    if recipe.ingredients then
        if ingredient.type and ingredient.type == "fluid" and recipe.category == "crafting" then
            recipe.category = "crafting-with-fluid"
        end
        table.insert(recipe.ingredients, ingredient)
    else
        return
    end
end

function vgal.recipe.get_result(recipeName, resultName)
    local recipe = data.raw["recipe"][recipeName]
    if recipe then
        if not resultName then
            return (recipe.results and recipe.results[1].name)
        else
            for _, result in ipairs(recipe.results) do
                if result.name == resultName then
                    return result
                end
                if (result[1] == resultName) then return { name = result[1], amount = result[2] } end
            end
        end
    end
    error("invalid result: " .. resultName .. " for recipe: " .. recipeName)
end

function vgal.recipe.bulkify(recipeName, multiplier)
    vgal.recipe.normalize(recipeName)
    local recipe = data.raw.recipe[recipeName]

    if recipe then
        recipe.energy_required = recipe.energy_required * multiplier

        for _, ingredient in pairs(recipe.ingredients) do
            if ingredient.name then
                ingredient.amount = ingredient.amount * multiplier
            end
            if ingredient[1] then
                if ingredient[2] then
                    ingredient[2] = ingredient[2] * multiplier
                else
                    ingredient = { ingredient[1], multiplier }
                end
            end
        end

        if recipe.results then
            for _, result in pairs(recipe.results) do
                if result.name then
                    result.amount = result.amount * multiplier
                else
                    if result[2] then
                        result[2] = result[2] * multiplier
                    else
                        result[2] = multiplier
                    end
                end
            end
        else
            if (recipe.result_count) then
                recipe.result_count = recipe.result_count * multiplier
            else
                recipe.result_count = multiplier
            end
        end
    else
        error("Recipe " .. recipeName .. " not found.")
    end
end

function vgal.recipe.to_poly_result(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    if recipe.results then
        return
    end
    recipe.results = {
        { type = "item", name = recipe.result, amount = recipe.result_count }
    }
    recipe.main_product = recipe.main_product or recipe.result
    recipe.result = nil
    recipe.result_count = nil
end

function vgal.recipe.sync_ingredient(recipeName, ingredient, result)
    local recipe = data.raw["recipe"][recipeName]
    vgal.recipe.to_poly_result(recipeName)
    local count = 1
    for i, re1 in ipairs(recipe.results) do
        vgal.recipe.normalize_table_value(re1)
        count = re1.amount or 1
    end
    for i, in1 in ipairs(recipe.ingredients) do
        vgal.recipe.normalize_table_value(in1)
        in1.amount = count
    end
end

function vgal.recipe.set_icons(recipeName, icons)
    local recipe = data.raw["recipe"][recipeName]
    recipe.icon = nil
    recipe.icon_mipmaps = nil
    recipe.icon_size = nil
    recipe.icons = icons
end

function vgal.recipe.is_modded(recipeName, modtag)
    if not data.raw["recipe"][recipeName] then
        error()
    end
    if modtag == "bitumen" then
        if string.find(recipeName, "-dl") then
            return true
        end
        local subg = data.raw["recipe"][recipeName].subgroup
        if not subg then
            if data.raw["recipe"][recipeName].result ~= nil then
                if data.raw["item"][data.raw["recipe"][recipeName].result] then
                    subg = data.raw["item"][data.raw["recipe"][recipeName].result].subgroup
                end
            end
        end
        if subg then
            local group = data.raw["item-subgroup"][subg].group
            return group == "tooling" or group == "precision-machining" or group == "bitumen"
        end
    end

    if data.raw["recipe"][recipeName].icon then
        return string.find(data.raw["recipe"][recipeName].icon, modtag)
    else
        return false
    end
end

---@param ingredients (data.IngredientPrototype[])
function vgal.recipe.set_ingredients(recipeName, ingredients)
    vgal.recipe.normalize(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    recipe.ingredients = ingredients
    for _, ingredient in ipairs(ingredients) do
        if ingredient.type and ingredient.type == "fluid" and recipe.category == "crafting" then
            recipe.category = "crafting-with-fluid"
        end
    end
end

-- function vgal.recipe.add_expensive_ingredients(recipeName, expensiveIngredients)
--     local recipe = data.raw["recipe"][recipeName]
--     recipe.normal = {
--         ingredients = recipe.ingredients
--     }
--     recipe.expensive = {
--         ingredients = expensiveIngredients,
--         results = recipe.results
--     }
--     recipe.normal.ingredients = recipe.ingredients
--     recipe.expensive.ingredients = expensiveIngredients

-- end
-- function vgal.recipe.force_poly_result(recipeName)
--     local recipe = data.raw["recipe"][recipeName]
--     if recipe.results then
--         return recipe.results

--     end
-- end

---@param results? (data.ProductPrototype[])
function vgal.recipe.set_results(recipeName, results)
    local recipe = data.raw["recipe"][recipeName]
    vgal.recipe.normalize(recipeName)
    recipe.result = nil
    recipe.result_count = nil
    recipe.results = results
end

---@param energy_required? (number)
function vgal.recipe.set_energy_required(recipeName, energy_required)
    local recipe = data.raw["recipe"][recipeName]
    recipe.energy_required = energy_required
end

function vgal.recipe.set_category(recipeName, category)
    data.raw["recipe"][recipeName].category = category
end

function vgal.recipe.queue_to_clean(recipeName)
    table.insert(vgal.recipe.toclean, recipeName)
end

function vgal.recipe.clear_icon_data(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    recipe.icon = nil
    recipe.icon_mipmaps = nil
    recipe.icon_size = nil
    recipe.icons = nil
end

function vgal.recipe.multiply_ingredients(recipeName, multiplier)
    local recipe = data.raw["recipe"][recipeName]
    vgal.recipe.normalize(recipeName)
    if recipe and recipe.ingredients then
        for _, item in ipairs(recipe.ingredients) do
            local normalized = vgal.recipe.get_normalized_table_value(item)
            item.amount = vgal.math.conserve_floor(normalized.amount * multiplier)
        end
    else
        error("invalid recipe name and or composition")
    end
end

function vgal.recipe.multiply_energy_required(recipeName, multiplier)
    local recipe = data.raw["recipe"][recipeName]
    vgal.recipe.normalize(recipeName)
    recipe.energy_required = (recipe.energy_required or 1) * multiplier
end

function vgal.recipe.multiply_results(recipeName, multiplier)
    local recipe = data.raw["recipe"][recipeName]
    vgal.recipe.normalize(recipeName)
    if recipe.results == nil then
        error("can't perform function multiply_results on recipe without results.")
    end
    if recipe.results then
        for _, item in ipairs(recipe.results) do
            local normalized = vgal.recipe.get_normalized_table_value(item)
            item.amount = vgal.math.conserve_floor(normalized.amount * multiplier)
        end
    else
        recipe.result_count = vgal.math.conserve_floor((recipe.result_count or 1) * multiplier)
    end
end

function vgal.recipe.ingredient_for_do(recipeName, forIngriedientName, doIngredientTable)
    local recipe = data.raw["recipe"][recipeName]
    -- if not vgal.recipe.is_normalized(recipeName) then
    --     error()
    -- end

    -- local toadd = table.deepcopy(doIngredientTable)
    -- for _, item in ipairs(recipe.ingredients) do
    --     local normalized = vgal.recipe.get_normalized_table_value(item)
    --     if normalized.name == forIngriedientName then
    --         toadd.count = toadd.count + doIngredientTable.count
    --     end
    -- end
    if vgal.recipe.has_result(recipe.name, forIngriedientName) and not vgal.recipe.has_ingredient(recipe.name, forIngriedientName) then
        vgal.recipe.add_ingredient(recipe.name, {
            type = doIngredientTable.type,
            name = doIngredientTable.name,
            amount = vgal.math.conserve_floor(vgal.recipe.get_result(recipe.name, forIngriedientName).amount *
                doIngredientTable.amount)
        })
    end
end

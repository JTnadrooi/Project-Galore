---@diagnostic disable: duplicate-set-field, param-type-mismatch


function vgal.recipe.get_if_productivity(main_product)
    local recipe = data.raw["recipe"][main_product]
    if recipe and recipe.allow_productivity then
        return true
    end
    if data.raw["fluid"][main_product] then
        return true
    end
    return vgal.productivity_entries[main_product] == true
end

function vgal.recipe.add_productivity_entry(entry_name)
    vgal.any(entry_name)
    vgal.productivity_entries[entry_name] = true
end

function vgal.recipe.unhide(recipe_name)
    local recipe = data.raw["recipe"][recipe_name]
    recipe.hidden = false
    recipe.hidden_in_factoriopedia = false
    recipe.hide_from_player_crafting = false
    recipe.hide_from_signal_gui = false
    recipe.hide_from_stats = false
end

function vgal.recipe.add_catalyst_entry(entry_name)
    vgal.any(entry_name)
    vgal.catalyst_entries[entry_name] = true
end

function vgal.recipe.smart_allow_productivity(recipe_name, ignore_catalysts, skip_entry_register)
    local recipe = data.raw["recipe"][recipe_name]
    local all_catalysts = true
    for _, result in ipairs(recipe.results) do
        if not vgal.catalyst_entries[result.name] then
            all_catalysts = false
            break
        end
    end
    if ignore_catalysts then
        all_catalysts = false
    end
    if (all_catalysts and #recipe.results == 1) then
        recipe.allow_productivity = true
        ignore_catalysts = true
    end
    if not all_catalysts then recipe.allow_productivity = true end


    for _, result in ipairs(recipe.results) do
        if (not ignore_catalysts) and vgal.catalyst_entries[result.name] then
            vgal.recipe.smart_disallow_productivity(recipe_name, result.name)
        end
        if (not skip_entry_register) and not vgal.recipe.get_if_productivity(result.name) then
            vgal.recipe.add_productivity_entry(result.name)
        end
    end

    return recipe.allow_productivity
end

function vgal.recipe.smart_disallow_productivity(recipe_name, result_name)
    local recipe = data.raw["recipe"][recipe_name]
    local done = false
    for _, result in ipairs(recipe.results) do
        if result.name == result_name then
            result.ignored_by_productivity = 15000
            done = true
        end
    end
    if not done then
        error(recipe_name .. ", searched for " .. result_name)
    end
end

function vgal.recipe.get_ingredients(recipe_name)
    local recipe = data.raw["recipe"][recipe_name]
    return recipe.ingredients or {}
end

function vgal.recipe.normalize_dublicates(recipe_name)
    local recipe = data.raw["recipe"][recipe_name]
    local mem = {}
    local has_value = false
    if recipe.ingredients then
        for _, ingredient in ipairs(recipe.ingredients) do
            has_value = false
            for _, memory_value in ipairs(mem) do
                if memory_value.name == ingredient.name then
                    has_value = true
                    memory_value.amount = ingredient.amount + memory_value.amount
                end
            end
            if not has_value then
                table.insert(mem, ingredient)
            end
        end
    end
    mem = {}
    has_value = false
    if recipe.results then
        for _, result in ipairs(recipe.results) do
            has_value = false
            for _, memVal in ipairs(mem) do
                if memVal.name == result.name then
                    has_value = true
                    memVal.amount = result.amount + memVal.amount
                end
            end
            if not has_value then
                table.insert(mem, result)
            end
        end
    end
end

-- function vgal.recipe.hide_and_queue(recipe_name)
--     vgal.recipe.hide(recipe_name)
--     vgal.recipe.queue_to_clean(recipe_name)
-- end

function vgal.recipe.deep_hide(recipe_name)
    local recipe = data.raw["recipe"][recipe_name]
    recipe.hidden = true
    recipe.hidden_in_factoriopedia = true
    recipe.hide_from_player_crafting = true
    recipe.hide_from_stats = true
    recipe.hide_from_signal_gui = true
end

function vgal.recipe.copy(recipe_name)
    return util.table.deepcopy(data.raw["recipe"][recipe_name])
end

function vgal.recipe.force_get_icons(recipe_name)
    local recipe = data.raw["recipe"][recipe_name]
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

function vgal.recipe.overlay_tier(recipe_name, tier)
    local recipe = data.raw["recipe"][recipe_name]
    recipe.icons = vgal.icon.register({ vgal.recipe.force_get_icons(recipe.name), vgal.icon.get("tier" .. tier, "raw") })
end

function vgal.recipe.replace_category(recipe_name, old, new, force)
    local recipe = data.raw["recipe"][recipe_name]
    if (not force) and new == "crafting" then
        if vgal.recipe.has_fluid_ingredient(recipe_name) then
            new = "crafting-with-fluid"
        end
    end
    if recipe.category == old then
        recipe.category = new
    end
end

function vgal.recipe.has_fluid_ingredient(recipe_name)
    local recipe = data.raw["recipe"][recipe_name]
    local to_alter = recipe.ingredients
    for _, ingredient in ipairs(to_alter) do
        if ingredient.type == "fluid" then
            return true
        end
    end
    return false
end

function vgal.recipe.replace_item(recipe_name, old, new)
    vgal.recipe.replace_ingredient(recipe_name, old, new)
    vgal.recipe.replace_result(recipe_name, old, new)
end

function vgal.recipe.vanillize_number(number, number_type, ingredient_name)
    number_type = number_type or "item"
    ingredient_name = ingredient_name or number_type
    if number_type == "fluid" then
        if number < 10 then
            return 5
        end
        if not math.fmod(number, 5) == 0 and number < 100 then
            number = math.floor(number / 10) * 10
        end
        if not math.fmod(number, 10) == 0 and number > 100 then
            number = math.floor(number / 10) * 10
        end
    end
    if number_type == "item" then
        if number > 12 then
            if not math.fmod(number, 5) == 0 then
                number = math.floor(number / 2) * 2
            end
        end
        if number == 11 then number = 10 end
        if number == 9 then number = 10 end
        if number == 7 then number = 8 end
    end
    if number_type == "time" then
        if number > 12 then
            if not math.fmod(number, 5) == 0 then
                number = math.floor(number / 2) * 2
            end
        end
        if number == 11 then number = 10 end
        if number == 7 then number = 8 end
    end
    return number
end

function vgal.recipe.copy_and_extend(recipe_name, as)
    local newRecipe = util.table.deepcopy(data.raw["recipe"][recipe_name])
    newRecipe.name = as
    ---@diagnostic disable-next-line: assign-type-mismatch
    data:extend({ newRecipe })
end

function vgal.recipe.replace_ingredient(recipe_name, oldingredient_name, newingredient_name)
    local recipe = data.raw["recipe"][recipe_name]
    local to_alter = recipe.ingredients or {}
    for _, ingredient in ipairs(to_alter) do
        if ingredient.name == oldingredient_name then
            if ingredient.name then
                ingredient.name = newingredient_name
            end
        end
    end
end

function vgal.recipe.remove_ingredient(recipe_name, ingredient_name)
    local recipe = data.raw["recipe"][recipe_name]
    for i, ingredient in ipairs(recipe.ingredients or {}) do
        if ingredient.name == ingredient_name then
            table.remove(recipe.ingredients, i)
            break
        end
    end
end

function vgal.recipe.remove_result(recipe_name, resultName)
    local recipe = data.raw["recipe"][recipe_name]
    if recipe.main_product == resultName then
        recipe.main_product = nil
    end
    if recipe.results then
        local to_alter = recipe.results
        for i, result in ipairs(to_alter) do
            if result.name == resultName then
                table.remove(to_alter, i)
            end
        end
    end
end

function vgal.recipe.remove_item(recipe_name, ingredient_name)
    vgal.recipe.remove_ingredient(recipe_name, ingredient_name)
    vgal.recipe.remove_result(recipe_name, ingredient_name)
end

function vgal.recipe.replace_result(recipe_name, oldResult, newResult)
    local recipe = data.raw["recipe"][recipe_name]
    if recipe.main_product == oldResult then
        recipe.main_product = newResult
    end
    local to_alter = recipe.results
    for _, result in ipairs(to_alter) do
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

function vgal.recipe.override_iron(recipe_name, newIcons)
    local recipe = data.raw["recipe"][recipe_name]
    if recipe then
        recipe.icons = newIcons
        recipe.icon = nil
        recipe.icon_size = nil
    end
end

function vgal.recipe.get_productivity_tech_name(main_product_name)
    if data.raw["technology"][main_product_name .. "-productivity"] then
        return main_product_name .. "-productivity"
    elseif data.raw["technology"][main_product_name .. "-productivity-wolf"] then
        return main_product_name .. "-productivity-wolf"
    end
    return nil
end

function vgal.recipe.catagory_from_array()

end

function vgal.recipe.add_result(recipe_name, newResult)
    local recipe = data.raw["recipe"][recipe_name]
    if not recipe.main_product then
        recipe.main_product = vgal.recipe.get_preferred_main_product(recipe)
    end
    table.insert(recipe.results, newResult)
end

function vgal.recipe.has_result(recipe_name, result)
    local recipe = data.raw["recipe"][recipe_name]
    if recipe and recipe.results then
        for _, item in ipairs(vgal.recipe.get_results(recipe_name)) do
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

function vgal.recipe.has_ingredient(recipe_name, ingredient_name)
    if not ingredient_name then
        error()
    end
    for _, item in ipairs(vgal.recipe.get_ingredients(recipe_name)) do
        if item.name == ingredient_name then
            return true
        end
    end
    return false
end

function vgal.recipe.has_item(recipe_name, itemName)
    return vgal.recipe.has_ingredient(recipe_name, itemName) or vgal.recipe.has_result(recipe_name, itemName)
end

function vgal.recipe.add_ingredients(recipe_name, ingredients)
    for _, ingredient in ipairs(ingredients) do
        vgal.recipe.add_ingredient(recipe_name, ingredient)
    end
end

function vgal.recipe.increment_results(recipe_name, amount)
    amount = amount or 1
    local recipe = data.raw["recipe"][recipe_name]
    if recipe.results then
        for _, result in ipairs(recipe.results) do
            result.amount = (result.amount or 1) + amount
        end
    end
end

function vgal.recipe.add_ingredient(recipe_name, ingredient)
    local recipe = data.raw["recipe"][recipe_name]
    if recipe.ingredients then
        table.insert(recipe.ingredients, ingredient)
    else
        recipe.ingredients = {
            ingredient,
        }
    end
end

function vgal.recipe.clear_icon_data(recipe_name)
    local recipe = data.raw["recipe"][recipe_name]
    recipe.icon = nil
    recipe.icon_size = nil
    recipe.icons = nil
end

function vgal.recipe.get_main_product_amount(recipe_name)
    return vgal.recipe.get_result_amount(recipe_name, data.raw["recipe"][recipe_name].main_product)
end

function vgal.recipe.get_result_amount(recipe_name, result)
    local recipe = data.raw["recipe"][recipe_name]
    for _, product in ipairs(recipe.results) do
        if product.name == result then
            local amount = 1

            if product.amount then
                amount = product.amount or 1
            elseif product.amount_min and product.amount_max then
                amount = (product.amount_min + product.amount_max) / 2
            end

            if product.probability then
                amount = amount * product.probability
            end
            -- log(amount .."retruned")
            return amount
        end
    end
    error()
end

function vgal.recipe.get_ingredient_amount(recipe_name, ingredient_name)
    local recipe = data.raw["recipe"][recipe_name]
    -- if recipe.main_product then
    -- else
    --     error("no source ingredient [ " .. ingredient .. " ] found for recipe of name: " .. recipe_name)
    -- end
    for _, ingredient in ipairs(recipe.ingredients) do
        if ingredient.name == ingredient_name then
            return ingredient.amount
        end
    end
end

function vgal.recipe.multiply(recipe_name, multiplier, entry_name, multiply_energy_required)
    local recipe = data.raw["recipe"][recipe_name]
    recipe.results = vgal.table.get_multiplied(recipe.results, multiplier, entry_name)
    recipe.ingredients = vgal.table.get_multiplied(recipe.ingredients, multiplier, entry_name)
    if multiply_energy_required then
        recipe.energy_required = recipe.energy_required * multiplier
    end
end

function vgal.recipe.multiply_results(recipe_name, multiplier)
    local recipe = data.raw["recipe"][recipe_name]
    recipe.results = vgal.table.get_multiplied(recipe.results, multiplier)
end

function vgal.recipe.set_result_amount(recipe_name, amount, result_name)
    local recipe = data.raw["recipe"][recipe_name]
    for i = #recipe.results, 1, -1 do
        local result = recipe.results[i]
        if (result_name == nil) or result.name == result_name then
            if amount == 0 then
                if not result_name then
                    error(result_name)
                end
                table.remove(recipe.results, i)
            else
                result.amount = amount
                result.amount_max = nil
                result.amount_min = nil
                result.probability = nil
            end
        end
    end
end

function vgal.recipe.set_ingredient_amount(recipe_name, amount, ingredient_name)
    local recipe = data.raw["recipe"][recipe_name]
    for i = #recipe.ingredients, 1, -1 do
        local ingredient = recipe.ingredients[i]
        local name = ingredient.name
        if (ingredient_name == nil) or name == ingredient_name then
            if amount == 0 then
                if not ingredient_name then
                    error(ingredient_name)
                end
                table.remove(recipe.ingredients, i)
            else
                ingredient.amount = amount
            end
        end
    end
end

function vgal.recipe.multiply_ingredients(recipe_name, multiplier, ingredient_name)
    local recipe = data.raw["recipe"][recipe_name]
    recipe.ingredients = vgal.table.get_multiplied(recipe.ingredients, multiplier, ingredient_name)
end

vgal.recipe.TINT_CATALOG = {
    ["light-oil"] = data.raw["recipe"]["light-oil-cracking"].crafting_machine_tint,
    ["heavy-oil"] = data.raw["recipe"]["heavy-oil-cracking"].crafting_machine_tint,
    ["petroleum-gas"] = data.raw["recipe"]["plastic-bar"].crafting_machine_tint,
    ["crude-oil"] = {
        primary = { r = 0.1, g = 0.05, b = 0.02, a = 1.000 },
        secondary = { r = 0.15, g = 0.1, b = 0.05, a = 1.000 },
        tertiary = { r = 0.2, g = 0.15, b = 0.1, a = 1.000 },
        quaternary = { r = 0.05, g = 0.03, b = 0.01, a = 1.000 }
    },
}
vgal.recipe.TINT_CATALOG["black"] = vgal.recipe.TINT_CATALOG["crude-oil"]

function vgal.recipe.get_preferred_crafting_machine_tint(recipe)
    local main_productRecipe = data.raw.recipe[recipe.main_product]
    local mainFluidProduct = data.raw["fluid"][recipe.main_product]
    local tint = nil

    tint = tint or main_productRecipe and main_productRecipe.crafting_machine_tint
    tint = tint or vgal.recipe.TINT_CATALOG[recipe.main_product]
    tint = tint or mainFluidProduct and vgal.fluid.get_tint(mainFluidProduct.name)

    return tint
end

function vgal.recipe.get_preferred_main_product(recipe)
    if recipe.main_product then
        return recipe.main_product
    end
    if recipe.results and recipe.results[1] then
        return recipe.results[1].name
    end
    if recipe.fluid_results and recipe.fluid_results[1] then
        return recipe.fluid_results[1].name
    end
    error(recipe.name)
end

function vgal.recipe.get_preferred_localised_name(recipe)
    if recipe then
        return recipe.localised_name or { "?",
            { "", { "recipe-name." .. recipe.name } },
            { "", vgal.locale.get_lazy(vgal.recipe.get_preferred_main_product(recipe)) },
        }
    else
        vgal.log("recipe not found for get_preferred.. localising: " + recipe.name)
    end
end

function vgal.recipe.get_preferred_localised_description(recipe)
    if recipe then
        return recipe.localised_description or { "recipe-description." .. recipe.name }
    else
        vgal.log("recipe not found for get_preferred.. localising: " + recipe.name)
    end
end

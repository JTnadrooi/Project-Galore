---@diagnostic disable: duplicate-set-field, param-type-mismatch
vgal.recipe = vgal.recipe or {}

---@param main_product string
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

---@param entry_name string
function vgal.recipe.add_productivity_entry(entry_name)
    vgal.get_recipeable(entry_name)
    vgal.productivity_entries[entry_name] = true
end

---@param entry_name string
function vgal.recipe.add_catalyst_entry(entry_name)
    vgal.get_recipeable(entry_name)
    vgal.catalyst_entries[entry_name] = true
end

---@param recipe_name string
---@param ignore_catalysts boolean?
---@param skip_entry_register boolean?
function vgal.recipe.smart_allow_productivity(recipe_name, ignore_catalysts, skip_entry_register)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
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

---@param recipe_name string
---@param result_name string
function vgal.recipe.smart_disallow_productivity(recipe_name, result_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
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

---@param recipe_name string
function vgal.recipe.normalize_dublicates(recipe_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
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

---@param recipe_name string
function vgal.recipe.deephide(recipe_name)
    if (not data.raw["recipe"][recipe_name]) then error("Recipe " .. recipe_name .. " not found.") end

    vgal.data.deephide(data.raw["recipe"][recipe_name])
end

---@param recipe_name string
---@return data.IconData[]
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
    error("Could not get icons for " .. recipe_name)
end

---@param number number
---@param number_type "item"|"fluid"|"time"
---@param ingredient_name string
---@return integer
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

---@param recipe_name string
---@param old_ingredient_name string
---@param new_ingredient_name string
function vgal.recipe.replace_ingredient(recipe_name, old_ingredient_name, new_ingredient_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    local to_alter = recipe.ingredients or {}
    for _, ingredient in ipairs(to_alter) do
        if ingredient.name == old_ingredient_name then
            ingredient.name = new_ingredient_name
            return
        end
    end
end

---@param recipe_name string
---@param ingredient_name string
function vgal.recipe.remove_ingredient(recipe_name, ingredient_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    for i, ingredient in ipairs(recipe.ingredients or {}) do
        if ingredient.name == ingredient_name then
            table.remove(recipe.ingredients, i)
            return
        end
    end
end

---@param recipe_name string
---@param result_name string
function vgal.recipe.remove_result(recipe_name, result_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    if recipe.main_product == result_name then
        recipe.main_product = nil
    end
    if recipe.results then
        for i = #recipe.results, 1, -1 do
            if recipe.results[i].name == result_name then
                table.remove(recipe.results, i)
            end
        end
    end
end

---@param recipe_name string
---@param old_result_name string
---@param new_result_name string
function vgal.recipe.replace_result(recipe_name, old_result_name, new_result_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    if recipe.main_product == old_result_name then
        recipe.main_product = new_result_name
    end
    for _, result in ipairs(recipe.results) do
        if result.name == old_result_name then
            if result.name then
                result.name = new_result_name
                return
            end
        end
    end
end

---@param recipe_name string
---@param new_icons data.IconData[]
function vgal.recipe.override_iron(recipe_name, new_icons)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    if recipe then
        recipe.icons = new_icons
        recipe.icon = nil
        recipe.icon_size = nil
    end
end

---@param main_product string
---@return string?
function vgal.recipe.get_productivity_tech_name(main_product)
    if data.raw["technology"][main_product .. "-productivity"] then
        return main_product .. "-productivity"
    elseif data.raw["technology"][main_product .. "-productivity-wolf"] then
        return main_product .. "-productivity-wolf"
    end
    return nil
end

---@param recipe_name string
---@param new_result data.ProductPrototype|string|vgal.ShorthandRecipeEntry
---@param result_type "item"|"fluid"|nil Sets the result type. Only used when new_result is a string or shorthand recipe entry.
function vgal.recipe.add_result(recipe_name, new_result, result_type)
    result_type = result_type or "item"

    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    if not recipe.main_product then
        recipe.main_product = vgal.recipe.get_preferred_main_product(recipe)
    end

    recipe.results = recipe.results or {}

    if type(new_result) == "string" then
        table.insert(recipe.results, { type = result_type, new_result, 1 })
        return
    elseif type(new_result) == "table" then
        if vgal.table.is_array(new_result) then
            table.insert(recipe.results, vgal.table.to_longform(new_result, result_type))
        else
            table.insert(recipe.results, new_result)
        end
    end
end

---@param recipe_name string
---@param result_name string
---@return boolean
function vgal.recipe.has_result(recipe_name, result_name)
    local recipe = data.raw["recipe"][recipe_name]
    if recipe and recipe.results then
        for _, result in ipairs(vgal.recipe.get_results(recipe_name)) do
            if result.name == result_name then
                return true
            end
        end
    end
    return false
end

---@param recipe_name string
---@param ingredient_name string
---@return boolean
function vgal.recipe.has_ingredient(recipe_name, ingredient_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    if recipe and recipe.ingredients then
        for _, ingredient in ipairs(recipe.ingredients or {}) do
            if ingredient.name == ingredient_name then
                return true
            end
        end
    end
    return false
end

---@param recipe_name string
---@param recipeable_name string
---@return boolean
function vgal.recipe.has_item(recipe_name, recipeable_name)
    return vgal.recipe.has_ingredient(recipe_name, recipeable_name) or
        vgal.recipe.has_result(recipe_name, recipeable_name)
end

---@param recipe_name string
---@param new_ingredient data.IngredientPrototype|string|vgal.ShorthandRecipeEntry
---@param ingredient_type "item"|"fluid"|nil Sets the ingredient type. Only used when new_ingredient is a string or shorthand recipe entry.
function vgal.recipe.add_ingredient(recipe_name, new_ingredient, ingredient_type)
    ingredient_type = ingredient_type or "item"

    local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    recipe.ingredients = recipe.ingredients or {}

    if type(new_ingredient) == "string" then
        table.insert(recipe.ingredients, { type = ingredient_type, new_ingredient, 1 })
        return
    elseif type(new_ingredient) == "table" then
        if vgal.table.is_array(new_ingredient) then
            table.insert(recipe.ingredients, vgal.table.to_longform(new_ingredient, ingredient_type))
        else
            table.insert(recipe.ingredients, new_ingredient)
        end
    end
end

---@param recipe_name string
function vgal.recipe.clear_icons(recipe_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    recipe.icon = nil
    recipe.icon_size = nil
    recipe.icons = nil
end

---@param recipe_name string
---@return number
function vgal.recipe.get_main_product_amount(recipe_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    if not recipe.main_product then
        error("Recipe '" .. recipe_name .. "' does not have a main product.")
    end
    return vgal.recipe.get_result_amount(recipe_name, recipe.main_product)
end

---@param recipe_name string
---@param result_name string
---@return number
function vgal.recipe.get_result_amount(recipe_name, result_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    for _, result in ipairs(recipe.results) do
        if result.name == result_name then
            local amount = 1

            if result.amount then
                amount = result.amount or 1
            elseif result.amount_min and result.amount_max then
                amount = (result.amount_min + result.amount_max) / 2
            end

            if result.probability then
                amount = amount * result.probability
            end
            return amount
        end
    end
    return 0
end

---@param recipe_name string
---@param ingredient_name string
---@return number
function vgal.recipe.get_ingredient_amount(recipe_name, ingredient_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    for _, ingredient in ipairs(recipe.ingredients) do
        if ingredient.name == ingredient_name then
            return ingredient.amount
        end
    end
    return 0
end

---@param recipe_name string
---@param multiplier number
---@param entry_name? string
---@param multiply_energy_required boolean?
function vgal.recipe.multiply(recipe_name, multiplier, entry_name, multiply_energy_required)
    local recipe = data.raw["recipe"][recipe_name]

    recipe.results = vgal.table.get_multiplied(recipe.results, multiplier, entry_name)
    recipe.ingredients = vgal.table.get_multiplied(recipe.ingredients, multiplier, entry_name)

    if multiply_energy_required then
        recipe.energy_required = recipe.energy_required * multiplier
    end
end

---@param recipe_name string
---@param multiplier number
function vgal.recipe.multiply_results(recipe_name, multiplier)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    recipe.results = vgal.table.get_multiplied(recipe.results, multiplier)
end

---@param recipe_name string
---@param amount number
---@param result_name string?
function vgal.recipe.set_result_amount(recipe_name, amount, result_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    local found = false
    for i = #recipe.results, 1, -1 do
        local result = recipe.results[i]
        if (result_name == nil) or result.name == result_name then
            found = true
            if amount == 0 then
                table.remove(recipe.results, i)
            else
                result.amount = amount
                result.amount_max = nil
                result.amount_min = nil
                result.probability = nil
            end
        end
    end

    if result_name ~= nil and not found then
        error("Result '" .. result_name .. "' not found in recipe '" .. recipe_name .. "'.")
    end
end

---@param recipe_name string
---@param amount number
---@param ingredient_name string?
function vgal.recipe.set_ingredient_amount(recipe_name, amount, ingredient_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    local found = false
    for i = #recipe.ingredients, 1, -1 do
        local ingredient = recipe.ingredients[i]
        if (ingredient_name == nil) or ingredient.name == ingredient_name then
            found = true
            if amount == 0 then
                table.remove(recipe.ingredients, i)
            else
                ingredient.amount = amount
            end
        end
    end

    if ingredient_name ~= nil and not found then -- I can't just add bc I need to know the type and im not guessing that.
        error("Ingredient '" .. ingredient_name .. "' not found in recipe '" .. recipe_name .. "'.")
    end
end

---@param recipe_name string
---@param multiplier number
---@param ingredient_name string
function vgal.recipe.multiply_ingredients(recipe_name, multiplier, ingredient_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    recipe.ingredients = vgal.table.get_multiplied(recipe.ingredients, multiplier, ingredient_name)
end

---@param recipe data.RecipePrototype
function vgal.recipe.get_preferred_crafting_machine_tint(recipe)
    local main_productRecipe = data.raw.recipe[recipe.main_product]
    local mainFluidProduct = data.raw["fluid"][recipe.main_product]
    local tint = nil

    tint = tint or main_productRecipe and main_productRecipe.crafting_machine_tint
    tint = tint or vgal.defines.tints[recipe.main_product]
    tint = tint or mainFluidProduct and vgal.fluid.get_recipe_tint(mainFluidProduct.name)

    return tint
end

---@param recipe data.RecipePrototype|vgal.VgalRecipePrototype
function vgal.recipe.get_preferred_main_product(recipe)
    if recipe.main_product then
        return recipe.main_product
    end
    if recipe.results and (#recipe.results > 0) then
        return recipe.results[1].name or recipe.results[1][1] or error("Invalid recipe results for recipe " ..
            recipe.name .. ", see: " .. serpent.block(recipe.results[1]))
    end
    if recipe.fluid_results and (#recipe.fluid_results > 0) then
        return recipe.fluid_results[1][1] or error("Invalid recipe results for recipe " .. recipe.name)
    end
    error("Could not get preferred main product for: " .. recipe)
end

---@param recipe data.RecipePrototype|vgal.VgalRecipePrototype
function vgal.recipe.get_preferred_localised_name(recipe)
    return recipe.localised_name or { "?",
        { "", { "recipe-name." .. recipe.name } },
        { "", vgal.locale.guess_locale(vgal.recipe.get_preferred_main_product(recipe)) },
    }
end

---@param recipe data.RecipePrototype|vgal.VgalRecipePrototype
function vgal.recipe.get_preferred_localised_description(recipe)
    return recipe.localised_description or { "recipe-description." .. recipe.name }
end

---@param domain_name string
function vgal.recipe.get_domain_or_all_pairs(domain_name)
    local iterator, dom, start_key
    if domain_name then
        iterator, dom, start_key = vgal.data.domain_pairs(domain_name, "recipe")
    else
        iterator, dom, start_key = pairs(data.raw["recipe"])
    end -- THIS CANNOT BE DONE DIFFERENTLY.
    return iterator, dom, start_key
end

function vgal.recipe.use_recipe_locale(recipe_name, keep_show_amount_in_title)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    recipe.localised_name = { "?", { "recipe-name." .. recipe.name }, vgal.locale
        .get_backup_locale_for_recipeable(
            recipe.name, "name") }
    recipe.localised_description = { "?", { "recipe-description." .. recipe.name }, vgal.locale
        .get_backup_locale_for_recipeable(
            recipe.name, "description") }

    if not keep_show_amount_in_title then
        recipe.show_amount_in_title = false
    end
end

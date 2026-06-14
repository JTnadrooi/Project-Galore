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

---Registers a catalyst entry. (In smart_allow_productivity()) Catalyst entries will not have productivity applied to them unless the recipe only outputs catalyst entries. In that case, the entire recipe gets productivity.
---@param entry_name string
function vgal.recipe.add_catalyst_entry(entry_name)
    vgal.get_recipeable(entry_name)
    vgal.catalyst_entries[entry_name] = true
end

---A entry is relevant for stats if its not easily refurbishable.
---@param entry_name any
function vgal.recipe.make_catalyst_entry_stat_relevant(entry_name)
    if not (vgal.catalyst_entries[entry_name] or vgal.catalyst_groups[entry_name]) then
        error("Entry not registerd: " .. entry_name)
    end
    vgal.entry_stat_relevant_catalysts[entry_name] = true
end

---@param entry_names string[]
function vgal.recipe.add_catalyst_group(entry_names)
    for _, entry_name in ipairs(entry_names) do
        vgal.get_recipeable(entry_name)
    end
    vgal.table.assign_keys_to_reference(vgal.catalyst_groups, entry_names, vgal.table.to_map(entry_names), true)
end

---@param recipe_name string
---@param skip_entry_register boolean?
function vgal.recipe.smart_allow_productivity(recipe_name, skip_entry_register)
    -- note; this system is suboptimal, better would be to have groups of items/fluids that are seen as one, if input is in group, output in group cannot get prod
    -- but thats for later maybe, it works fine with just the catalyst system
    -- I would need both systems anyways (looking at the waste waters rn)

    local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    -- early return if possible
    if (not recipe.results) or (recipe.results and #recipe.results == 0) then
        return
    end

    -- set prod to true, but this may change if all results disallow prod
    recipe.allow_productivity = true

    -- COLLECT DATA (productivity ignore map from ingredients and catalysts)
    ---@type table<string, number>
    local productivity_ignore_map = {}
    for _, ingredient in ipairs(recipe.ingredients) do
        productivity_ignore_map[ingredient.name] = (productivity_ignore_map[ingredient.name] or 0) + ingredient.amount

        local catalyst_group = vgal.catalyst_groups[ingredient.name]
        if catalyst_group then
            for catalyst_in_group, _ in pairs(catalyst_group) do
                productivity_ignore_map[catalyst_in_group] = (productivity_ignore_map[catalyst_in_group] or 0) + ingredient.amount
            end
        end
    end

    for _, result in ipairs(recipe.results) do
        if vgal.catalyst_entries[result.name] then
            productivity_ignore_map[result.name] = vgal.defines.ignored_by_productivity_max
        end
    end

    -- ACT
    local all_ignored = true
    for _, result in ipairs(recipe.results) do
        local normalized_amount = vgal.math.get_normalized_amount(result)
        result.ignored_by_productivity = productivity_ignore_map[result.name]

        if productivity_ignore_map[result.name] then
            productivity_ignore_map[result.name] = productivity_ignore_map[result.name] - normalized_amount
            if productivity_ignore_map[result.name] <= 0 then
                productivity_ignore_map[result.name] = nil
            end
        end

        if (not skip_entry_register) and not productivity_ignore_map[result.name] and not vgal.recipe.get_if_productivity(result.name) then
            vgal.recipe.add_productivity_entry(result.name)
        end

        if ((result.ignored_by_productivity or 0) < normalized_amount) then
            all_ignored = false
        end
    end

    if all_ignored then
        for _, result in ipairs(recipe.results) do
            result.ignored_by_productivity = nil
        end
        recipe.allow_productivity = nil
    end
end

---@param recipe_name string
function vgal.recipe.smart_fix_stats(recipe_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    -- early return if possible
    if (not recipe.results) or (recipe.results and #recipe.results == 0) then
        return
    end

    -- COLLECT DATA (stats ignore maps)
    ---@type table<string, number>
    local in_stats_ignore_map = {} -- from results -> for ingredients
    for _, result in ipairs(recipe.results) do
        local amount = vgal.math.get_normalized_amount(result)
        in_stats_ignore_map[result.name] = (in_stats_ignore_map[result.name] or 0) + amount

        local catalyst_group = vgal.catalyst_groups[result.name]
        if catalyst_group then
            for catalyst_in_group, _ in pairs(catalyst_group) do
                in_stats_ignore_map[catalyst_in_group] = (in_stats_ignore_map[catalyst_in_group] or 0) + amount
            end
        end
    end

    ---@type table<string, number>
    local out_stats_ignore_map = {} -- from ingredients -> for results
    for _, ingredient in ipairs(recipe.ingredients) do
        out_stats_ignore_map[ingredient.name] = (out_stats_ignore_map[ingredient.name] or 0) + ingredient.amount

        local catalyst_group = vgal.catalyst_groups[ingredient.name]
        if catalyst_group then
            for catalyst_in_group, _ in pairs(catalyst_group) do
                out_stats_ignore_map[catalyst_in_group] = (out_stats_ignore_map[catalyst_in_group] or 0) + ingredient.amount
            end
        end
    end

    -- apply specific stats handling
    for key, _ in pairs(in_stats_ignore_map) do
        in_stats_ignore_map[key] = math.ceil(in_stats_ignore_map[key])
        if vgal.entry_stat_relevant_catalysts[key] then
            in_stats_ignore_map[key] = nil
        end
    end

    for key, _ in pairs(out_stats_ignore_map) do
        if vgal.entry_stat_relevant_catalysts[key] then
            out_stats_ignore_map[key] = nil
        end
    end

    -- assign ignored_by_stats to ingredients and results
    for _, ingredient in ipairs(recipe.ingredients) do
        ingredient.ignored_by_stats = in_stats_ignore_map[ingredient.name]
    end

    for _, result in ipairs(recipe.results) do
        result.ignored_by_stats = out_stats_ignore_map[result.name]
    end
end

---@param recipe_name string
---@param result_name string
function vgal.recipe.allow_productivity_for_result(recipe_name, result_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    if not recipe.allow_productivity then
        error("Recipe does not allow productivity.")
    end

    local found = false
    for _, result in ipairs(recipe.results or {}) do
        if result.name == result_name then
            result.ignored_by_productivity = nil
            found = true
            break
        end
    end
    if not found then
        error("Recipe '" .. recipe_name .. "' does not have result '" .. result_name .. "'")
    end
end

---@param recipe_name string
---@param result_name string
function vgal.recipe.disallow_productivity_for_result(recipe_name, result_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    local found = false
    for _, result in ipairs(recipe.results or {}) do
        if result.name == result_name then
            result.ignored_by_productivity = vgal.defines.ignored_by_productivity_max
            found = true
            break
        end
    end
    if not found then
        error("Recipe '" .. recipe_name .. "' does not have result '" .. result_name .. "'")
    end
end

---@param recipe_name string
function vgal.recipe.allow_productivity_for_all_results(recipe_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    recipe.allow_productivity = true

    for _, result in ipairs(recipe.results or {}) do
        result.ignored_by_productivity = nil
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

---@param recipe_name string
---@param old_ingredient_name string
---@param new_ingredient_name string
---@param no_throw boolean?
function vgal.recipe.replace_ingredient(recipe_name, old_ingredient_name, new_ingredient_name, no_throw)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    for _, ingredient in ipairs(recipe.ingredients or {}) do
        if ingredient.name == old_ingredient_name then
            ingredient.name = new_ingredient_name
            return
        end
    end
    if (not no_throw) then
        error("Ingredient '" ..
            old_ingredient_name ..
            "' not found in recipe '" .. recipe_name .. "', ingredients: " .. serpent.block(recipe.ingredients))
    end
end

---@param recipe_name string
---@param ingredient_name string
---@param no_throw boolean?
function vgal.recipe.remove_ingredient(recipe_name, ingredient_name, no_throw)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    for i, ingredient in ipairs(recipe.ingredients or {}) do
        if ingredient.name == ingredient_name then
            table.remove(recipe.ingredients, i)
            return
        end
    end
    if (not no_throw) then
        error("Ingredient '" ..
            ingredient_name ..
            "' not found in recipe '" .. recipe_name .. "', ingredients: " .. serpent.block(recipe.ingredients))
    end
end

---@param recipe_name string
---@param result_name string
---@param no_throw boolean?
function vgal.recipe.remove_result(recipe_name, result_name, no_throw)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    local found = false -- for multiple same results
    if recipe.main_product == result_name then
        recipe.main_product = nil
    end
    if recipe.results then
        for i = #recipe.results, 1, -1 do
            if recipe.results[i].name == result_name then
                table.remove(recipe.results, i)
                found = true
            end
        end
    end
    if (not no_throw) and (not found) then
        error("Result '" ..
            result_name ..
            "' not found in recipe '" .. recipe_name .. "', results: " .. serpent.block(recipe.results))
    end
end

---@param recipe_name string
---@param old_result_name string
---@param new_result_name string
---@param no_throw boolean?
function vgal.recipe.replace_result(recipe_name, old_result_name, new_result_name, no_throw)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    local found = false -- for multiple same results
    if recipe.main_product == old_result_name then
        recipe.main_product = new_result_name
    end
    for _, result in ipairs(recipe.results) do
        if result.name == old_result_name then
            if result.name then
                result.name = new_result_name
                found = true
            end
        end
    end
    if (not no_throw) and (not found) then
        error("Result '" ..
            old_result_name ..
            "' not found in recipe '" .. recipe_name .. "', results: " .. serpent.block(recipe.results))
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
        table.insert(recipe.results, { type = result_type, name = new_result, amount = 1 })
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
        table.insert(recipe.ingredients, { type = ingredient_type, name = new_ingredient, amount = 1 })
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
---@param guess_main_product_if_not_specified boolean?
---@return number
function vgal.recipe.get_main_product_amount(recipe_name, guess_main_product_if_not_specified)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    local main_product = recipe.main_product

    if (not main_product) and guess_main_product_if_not_specified then
        main_product = vgal.recipe.get_preferred_main_product(recipe)
    end

    if not main_product then
        error("Recipe '" .. recipe_name .. "' does not have a main product.")
    end
    return vgal.recipe.get_result_amount(recipe_name, main_product)
end

---@param recipe_name string
---@param result_name string
---@return number
function vgal.recipe.get_result_amount(recipe_name, result_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    for _, result in ipairs(recipe.results) do
        if result.name == result_name then
            return vgal.math.get_normalized_amount(result)
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
                result.amount, result.probability, result.amount_min, result.amount_max = vgal.recipe.get_normalized_return_amounts(amount)
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

---@param domain_name string?
function vgal.recipe.get_domain_or_all_pairs(domain_name)
    local iterator, dom, start_key
    if domain_name then
        iterator, dom, start_key = vgal.data.domain_pairs(domain_name, "recipe")
    else
        iterator, dom, start_key = pairs(data.raw["recipe"])
    end -- THIS CANNOT BE DONE DIFFERENTLY.
    return iterator, dom, start_key
end

---@param recipe_name string
---@param show_amount_in_title boolean?
function vgal.recipe.use_recipe_locale(recipe_name, show_amount_in_title)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    recipe.localised_name = { "?", { "recipe-name." .. recipe.name }, vgal.locale
        .get_backup_locale_for_recipeable(
            recipe.name, "name") }
    recipe.localised_description = { "?", { "recipe-description." .. recipe.name }, vgal.locale
        .get_backup_locale_for_recipeable(
            recipe.name, "description") }

    if show_amount_in_title ~= nil then
        recipe.show_amount_in_title = show_amount_in_title
    end
end

---@param raw_amount number
---@param deviation number?
---@return integer? amount
---@return number? probablity
---@return integer? min_amount
---@return integer? max_amount
function vgal.recipe.get_normalized_return_amounts(raw_amount, deviation)
    if raw_amount == math.floor(raw_amount) then
        return raw_amount, nil, nil, nil
    end

    deviation = deviation or tonumber("1" .. string.rep("0", #tostring(raw_amount) - 1))

    if raw_amount < 1 then
        return 1, raw_amount, nil, nil
    else
        if deviation < 0 then
            error("Deviation cannot be less than 0.")
        end

        local amount_min = math.floor(raw_amount - deviation)
        local amount_max = math.ceil(raw_amount + deviation)

        return nil, nil, amount_min, amount_max
    end
end

---@param recipe_name string
---@param category_name string
---@return boolean
function vgal.recipe.has_category(recipe_name, category_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    return not not (recipe.category == category_name or
        (recipe.additional_categories and vgal.table.contains(recipe.additional_categories, category_name)))
end

---@param machine_names string[]
---@return table<string, string>
function vgal.recipe.get_category_map_for(machine_names)
    local result_map = {}

    for _, machine_name in ipairs(machine_names) do
        local machine = data.raw["assembling-machine"][machine_name] or data.raw["furnace"][machine_name] or
            error("Machine not found with name " .. machine_name)

        for _, category_name in ipairs(machine.crafting_categories or {}) do
            result_map[category_name] = machine_name
        end
    end

    return result_map
end

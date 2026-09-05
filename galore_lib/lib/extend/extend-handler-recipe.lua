---@param recipe vgal.VgalRecipePrototype
vgal.extend_handlers["recipe"] = function(recipe)
    recipe.domain = recipe.domain or recipe.prefix

    if recipe.complementairy_recipe then
        local complementairy_recipe = data.raw["recipe"][recipe.complementairy_recipe]
        recipe.order = recipe.order or complementairy_recipe.order
        recipe.subgroup = recipe.subgroup or complementairy_recipe.subgroup
        recipe.crafting_machine_tint = recipe.crafting_machine_tint or complementairy_recipe.crafting_machine_tint
    end

    recipe.tier = recipe.tier == 1 and nil or recipe.tier
    recipe.name = vgal.build.name(recipe.prefix, recipe.name, recipe.tier)

    recipe.technologies = vgal.table.ensure(recipe.technology, recipe.technologies)
    if recipe.enabled ~= nil and #recipe.technologies > 0 then -- entry cannot have `enabled` set if technolog(y/ies) is set.
        error()
    end

    if recipe.enabled == nil then
        recipe.enabled = #recipe.technologies == 0
    end

    if recipe.hide_from_signal_gui == nil then
        -- vgal auto algoritm (different than vanilla)
        if recipe.icon or recipe.icons then
            recipe.hide_from_signal_gui = false
        else
            recipe.hide_from_signal_gui = true
        end
    end

    -- prevent nils
    recipe.fluid_ingredients = recipe.fluid_ingredients or {}
    recipe.fluid_results = recipe.fluid_results or {}
    recipe.ingredients = recipe.ingredients or {}
    recipe.results = recipe.results or {}
    recipe.module_allows = recipe.module_allows or {}

    -- toggle group management
    recipe.groups = vgal.table.ensure(recipe.group, recipe.groups)
    local hidden = false
    for _, group in ipairs(recipe.groups) do
        if not vgal.groups[group] then
            error("Group with name " .. group .. " does not exist, recipe " .. recipe.name .. " tries to register to it.")
        end

        if not vgal.groups[group].enabled then
            hidden = true
            break
        end
    end

    -- group overrides
    if vgal.group_overrides[recipe.name] then
        hidden = vgal.group_overrides[recipe.name].hidden
    end

    if hidden then
        vgal.hide(recipe)
    end

    -- icon stuff
    if recipe.icon then
        if recipe.icons then
            error("Cannot have both icon and icons set for " .. recipe.name)
        end
        recipe.icons = {
            {
                icon = recipe.icon,
                icon_size = recipe.icon_size or 32,
            }
        }
        recipe.icon = nil
        recipe.icon_size = nil
    end

    -- prevent nil energy_required
    if not recipe.energy_required then
        error("Missing energy_required for " .. recipe.name)
    end

    -- in/output table building
    recipe.ingredients = recipe.raw_ingredients or vgal.build.table(recipe.ingredients, recipe.fluid_ingredients)
    recipe.results = recipe.raw_results or vgal.build.table(recipe.results, recipe.fluid_results)

    -- ensure categories
    recipe.categories = vgal.table.ensure(recipe.category, recipe.categories)
    recipe.category = nil
    recipe.categories = vgal.recipe.conform_categories_to_recipe(recipe, recipe.categories)

    if not recipe.main_product then
        ---@diagnostic disable-next-line: undefined-field
        recipe.main_product = recipe.results[1].name
    end

    recipe.crafting_machine_tint = recipe.crafting_machine_tint or vgal.recipe.get_crafting_machine_tint_or_guess(recipe)

    if recipe.locale_source then
        recipe.localised_name_source = recipe.locale_source
        recipe.localised_description_source = recipe.locale_source
    end
    if recipe.localised_name_source then
        recipe.localised_name = vgal.recipe.get_localised_name_or_guess(data.raw["recipe"][recipe.localised_name_source])
    end
    if recipe.localised_description_source then
        recipe.localised_description = vgal.recipe.get_localised_description_or_guess(data.raw["recipe"][recipe.localised_description_source])
    end
    recipe.localised_name = vgal.recipe.get_localised_name_or_guess(recipe)
    recipe.localised_description = vgal.recipe.get_localised_description_or_guess(recipe)

    recipe.auto_recycle = false
    recipe.allow_decomposition = false
    recipe.allow_as_intermediate = false

    if recipe.enable_smart_productivity == nil then
        local eligible_for_smart_prod = true
        for _, result in ipairs((recipe.results or {})) do
            --[[@cast result data.ProductPrototype]]
            if result.ignored_by_productivity then
                eligible_for_smart_prod = false
            end
        end

        recipe.enable_smart_productivity = eligible_for_smart_prod
    end
    if recipe.enable_smart_stats == nil then
        local eligible_for_smart_stats = true
        for _, result in ipairs((recipe.results or {})) do
            --[[@cast result data.ProductPrototype]]
            if result.ignored_by_stats then
                eligible_for_smart_stats = false
            end
        end
        for _, ingredient in ipairs((recipe.ingredients or {})) do
            --[[@cast ingredient data.IngredientPrototype]]
            if ingredient.ignored_by_stats then
                eligible_for_smart_stats = false
            end
        end

        recipe.enable_smart_stats = eligible_for_smart_stats
    end

    if recipe.allow_productivity == nil then
        recipe.allow_productivity = vgal.recipe.get_if_productivity(recipe.main_product)
    end

    vgal.log("registering: " .. recipe.name)

    ---@diagnostic disable-next-line: assign-type-mismatch
    data:extend({ recipe })

    if recipe.enable_smart_productivity and recipe.allow_productivity then
        vgal.recipe.smart_allow_productivity(recipe.name)
    end

    if recipe.enable_smart_stats then
        vgal.recipe.smart_fix_stats(recipe.name)
    end

    for i, tech_entry in ipairs(recipe.technologies) do
        if type(tech_entry) == "table" then
            vgal.tech.create_node(recipe, tech_entry, i, hidden)
        elseif type(tech_entry) == "string" then
            vgal.tech.add_recipe(tech_entry, recipe.name)
        else
            error("Invalid prototype technologies entry: " .. serpent.block(tech_entry))
        end
    end

    if recipe.productivity_technology ~= "" then -- so if "", no prod even when tech exists
        recipe.productivity_technology = recipe.productivity_technology or vgal.recipe.get_productivity_tech_name(
            recipe.main_product)
        if recipe.productivity_technology then
            if type(recipe.productivity_technology) == "string" then
                ---@type string
                vgal.tech.add_productivity_change(recipe.productivity_technology --[[@as string]], recipe.name, nil,
                    recipe.hidden)
            else
                vgal.tech.add_productivity_change(
                    recipe.productivity_technology[1],
                    recipe.name,
                    recipe.productivity_technology[2],
                    recipe.hidden
                )
            end
        end
    end

    return {
        entry_type = "recipe",
        entry_name = recipe.name,
        domain_name = recipe.domain
    }
end

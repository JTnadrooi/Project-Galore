---@param input_recipe vgal.VgalRecipePrototype
vgal.extend_handlers["recipe"] = function(input_recipe)
    ---@type data.RecipePrototype
    ---@diagnostic disable-next-line: missing-fields
    local output_recipe                 = { type = "recipe" }
    local domain                        = input_recipe.domain or input_recipe.prefix
    local groups                        = vgal.table.ensure(input_recipe.group, input_recipe.groups)
    local technologies                  = vgal.table.ensure(input_recipe.technology, input_recipe.technologies)
    local complementairy_recipe         = input_recipe.complementairy_recipe and (data.raw["recipe"][input_recipe.complementairy_recipe] or error("complementairy_recipe '" .. input_recipe.complementairy_recipe .. "' does not exist."))

    output_recipe.order                 = input_recipe.order or (complementairy_recipe and complementairy_recipe.order)
    output_recipe.subgroup              = input_recipe.subgroup or (complementairy_recipe and complementairy_recipe.subgroup)
    output_recipe.crafting_machine_tint = input_recipe.crafting_machine_tint or (complementairy_recipe and complementairy_recipe.crafting_machine_tint) or vgal.recipe.get_crafting_machine_tint_or_guess(output_recipe)

    if input_recipe.enabled == nil then
        output_recipe.enabled = #technologies == 0
    elseif #technologies > 0 then
        error("Entry cannot have `enabled` set if technolog(y/ies) is set.")
    else
        output_recipe.enabled = input_recipe.enabled
    end

    -- simple defaults
    do
        output_recipe.auto_recycle          = input_recipe.auto_recycle or false
        output_recipe.allow_decomposition   = input_recipe.allow_decomposition or false
        output_recipe.allow_as_intermediate = input_recipe.allow_as_intermediate or false
    end

    -- in/output table building
    local main_ingredient
    do
        output_recipe.ingredients = input_recipe.raw_ingredients or vgal.build.table(input_recipe.ingredients or {}, input_recipe.fluid_ingredients or {})
        output_recipe.results     = input_recipe.raw_results or vgal.build.table(input_recipe.results or {}, input_recipe.fluid_results or {})

        if #output_recipe.ingredients > 0 then
            main_ingredient = output_recipe.ingredients[1].name
        end
    end

    -- main product building
    do
        if input_recipe.main_product then
            output_recipe.main_product = input_recipe.main_product
        elseif #output_recipe.results > 0 then
            output_recipe.main_product = output_recipe.results[1].name
        end
    end

    -- ensure categories
    output_recipe.categories = vgal.recipe.conform_categories_to_recipe(output_recipe, vgal.table.ensure(input_recipe.category, input_recipe.categories))

    -- name building
    do
        output_recipe.name = vgal.build.name(input_recipe.prefix, input_recipe.name, input_recipe.tier == 1 and nil or input_recipe.tier)
        -- if input_recipe.name then
        --     output_recipe.name = vgal.build.name(input_recipe.prefix, input_recipe.name, input_recipe.tier == 1 and nil or input_recipe.tier)
        -- elseif main_ingredient and output_recipe.main_product then
        --     output_recipe.name = vgal.build.name(input_recipe.prefix, main_ingredient .. "-" .. output_recipe.main_product, input_recipe.tier == 1 and nil or input_recipe.tier)
        -- else
        --     error("Missing prototype name.")
        -- end
    end

    -- icon fixes
    do
        output_recipe.icons     = input_recipe.icons
        output_recipe.icon      = input_recipe.icon
        output_recipe.icon_size = input_recipe.icon_size

        vgal.icon.normalize_icon_fields(output_recipe --[[@as vgal.PrototypeWithIcons]])

        if (not output_recipe.icons) and output_recipe.name ~= output_recipe.main_product and output_recipe.main_product and main_ingredient then
            output_recipe.icons = vgal.icon.create({
                style = "default",
                inputs = { main_ingredient },
                outputs = { output_recipe.main_product },
            })
        end
    end

    output_recipe.hidden_in_factoriopedia = input_recipe.hidden_in_factoriopedia
    output_recipe.hide_from_bonus_gui = input_recipe.hide_from_bonus_gui
    output_recipe.hide_from_player_crafting = input_recipe.hide_from_player_crafting
    output_recipe.hide_from_stats = input_recipe.hide_from_stats

    -- toggle group management
    do
        local hidden = false
        for _, group in ipairs(groups) do
            if not vgal.groups[group] then
                error("Group with name " .. group .. " does not exist, recipe " .. input_recipe.name .. " tries to register to it.")
            end

            if not vgal.groups[group].enabled then
                hidden = true
                break
            end
        end

        -- group overrides
        if vgal.group_overrides[output_recipe.name] then
            hidden = vgal.group_overrides[output_recipe.name].hidden
        end

        if hidden or input_recipe.hidden then
            vgal.hide(output_recipe)
        end
    end

    -- prevent nil energy_required
    if not input_recipe.energy_required then
        error("Missing energy_required for " .. input_recipe.name)
    else
        output_recipe.energy_required = input_recipe.energy_required
    end

    if input_recipe.hide_from_signal_gui == nil then
        -- vgal auto algoritm (different than vanilla)
        if output_recipe.name == output_recipe.main_product then
            output_recipe.hide_from_signal_gui = true
        else
            output_recipe.hide_from_signal_gui = false
        end
    else
        output_recipe.hide_from_signal_gui = input_recipe.hide_from_signal_gui
    end

    -- locale building
    do
        output_recipe.localised_name = input_recipe.localised_name or vgal.recipe.get_localised_name_or_guess(output_recipe)
        output_recipe.localised_description = input_recipe.localised_description or vgal.recipe.get_localised_description_or_guess(output_recipe)
    end

    local enable_smart_productivity
    if input_recipe.enable_smart_productivity == nil then
        local eligible_for_smart_prod = true
        for _, result in ipairs((output_recipe.results or {})) do
            --[[@cast result data.ProductPrototype]]
            if result.ignored_by_productivity then
                eligible_for_smart_prod = false
            end
        end

        enable_smart_productivity = eligible_for_smart_prod
    end

    local enable_smart_stats
    if input_recipe.enable_smart_stats == nil then
        local eligible_for_smart_stats = true
        for _, result in ipairs((output_recipe.results or {})) do
            --[[@cast result data.ProductPrototype]]
            if result.ignored_by_stats then
                eligible_for_smart_stats = false
            end
        end
        for _, ingredient in ipairs((output_recipe.ingredients or {})) do
            --[[@cast ingredient data.IngredientPrototype]]
            if ingredient.ignored_by_stats then
                eligible_for_smart_stats = false
            end
        end

        enable_smart_stats = eligible_for_smart_stats
    end

    output_recipe.allow_productivity = (input_recipe.allow_productivity == nil) and vgal.recipe.get_if_productivity(output_recipe.main_product) or input_recipe.allow_productivity

    vgal.log("registering: " .. output_recipe.name)

    ---@diagnostic disable-next-line: assign-type-mismatch
    data:extend({ output_recipe })

    if enable_smart_productivity and output_recipe.allow_productivity then
        vgal.recipe.smart_allow_productivity(output_recipe)
    end

    if enable_smart_stats then
        vgal.recipe.smart_fix_stats(output_recipe)
    end

    for i, tech_entry in ipairs(technologies) do
        if type(tech_entry) == "table" then
            vgal.tech.create_node(output_recipe.name, tech_entry, i, output_recipe.hidden)
        elseif type(tech_entry) == "string" then
            vgal.tech.add_recipe(tech_entry, output_recipe.name)
        else
            error("Invalid prototype technologies entry: " .. serpent.block(tech_entry))
        end
    end

    local productivity_technology
    if input_recipe.productivity_technology ~= "" then -- so if "", no prod even when tech exists
        if (not input_recipe.productivity_technology) and output_recipe.main_product then
            productivity_technology = vgal.recipe.get_productivity_tech_name(output_recipe.main_product)
        else
            productivity_technology = input_recipe.productivity_technology
        end

        if productivity_technology then
            if type(productivity_technology) == "string" then
                ---@type string
                vgal.tech.add_productivity_change(productivity_technology --[[@as string]], output_recipe.name, nil, output_recipe.hidden)
            else
                vgal.tech.add_productivity_change(productivity_technology[1], output_recipe.name, productivity_technology[2], output_recipe.hidden)
            end
        end
    end

    return {
        entry_type  = "recipe",
        entry_name  = output_recipe.name,
        domain_name = domain
    }
end

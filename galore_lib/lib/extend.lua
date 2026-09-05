---Register a entry to the vgal ecosystem.
---@param entries vgal.VgalRecipePrototype[]|vgal.VgalToggleGroupPrototype[]
---@param fill_in_with? vgal.VgalRecipePrototype|vgal.VgalToggleGroupPrototype
function vgal.extend(entries, fill_in_with)
    fill_in_with = fill_in_with or {}

    -- fill_in_with.groups = vgal.table.ensure(fill_in_with.group, fill_in_with.groups)

    for _, entry in ipairs(entries) do
        entry.vgal = entry.vgal or {}
        entry = vgal.table.deep_merge_with_priority(entry, fill_in_with)

        entry.domain = entry.domain or entry.prefix

        local entry_name = vgal.build.name(entry.prefix, entry.name, entry.tier)

        if entry.domain then
            if not vgal.domain_exists(entry.domain) then
                vgal.create_domain(entry.domain)
            end
            vgal.domains[entry.domain].entries[entry_name] = {
                type = entry.type,
                name = entry_name,
            }
        end

        if entry.type == "recipe" then
            ---@cast entry vgal.VgalRecipePrototype

            if entry.complementairy_recipe then
                local complementairy_recipe = data.raw["recipe"][entry.complementairy_recipe]
                entry.order = entry.order or complementairy_recipe.order
                entry.subgroup = entry.subgroup or complementairy_recipe.subgroup
                entry.crafting_machine_tint = entry.crafting_machine_tint or complementairy_recipe.crafting_machine_tint
            end

            -- name components
            entry.tier = entry.tier == 1 and nil or entry.tier
            entry.name = vgal.build.name(entry.prefix, entry.name, entry.tier)

            -- tech kinda, real stuff happens later.
            entry.technologies = vgal.table.ensure(entry.technology, entry.technologies)
            if entry.enabled ~= nil and #entry.technologies > 0 then -- entry cannot have `enabled` set if technolog(y/ies) is set.
                error()
            end

            if entry.enabled == nil then
                entry.enabled = #entry.technologies == 0
            end

            if entry.hide_from_signal_gui == nil then
                -- vgal auto algoritm (different than vanilla)
                if entry.icon or entry.icons then
                    entry.hide_from_signal_gui = false
                else
                    entry.hide_from_signal_gui = true
                end
            end

            -- prevent nils
            entry.fluid_ingredients = entry.fluid_ingredients or {}
            entry.fluid_results = entry.fluid_results or {}
            entry.ingredients = entry.ingredients or {}
            entry.results = entry.results or {}
            entry.module_allows = entry.module_allows or {}

            -- toggle group management
            entry.groups = vgal.table.ensure(entry.group, entry.groups)
            local hidden = false
            for _, group in ipairs(entry.groups) do
                if not vgal.groups[group] then
                    error("Group with name " .. group .. " does not exist, recipe " .. entry.name .. " tries to register to it.")
                end

                if not vgal.groups[group].enabled then
                    hidden = true
                    break
                end
            end

            -- group overrides
            if vgal.group_overrides[entry.name] then
                hidden = vgal.group_overrides[entry.name].hidden
            end

            if hidden then
                vgal.recipe.hide(entry)
            end

            -- icon stuff
            if entry.icon then
                if entry.icons then
                    error("Cannot have both icon and icons set for " .. entry.name)
                end
                entry.icons = {
                    {
                        icon = entry.icon,
                        icon_size = entry.icon_size or 32,
                    }
                }
                entry.icon = nil
                entry.icon_size = nil
            end

            -- prevent nil energy_required
            if not entry.energy_required then
                error("Missing energy_required for " .. entry.name)
            end

            -- in/output table building
            entry.ingredients = entry.raw_ingredients or vgal.build.table(entry.ingredients, entry.fluid_ingredients)
            entry.results = entry.raw_results or vgal.build.table(entry.results, entry.fluid_results)

            -- ensure categories
            entry.categories = vgal.table.ensure(entry.category, entry.categories)
            entry.category = nil
            entry.categories = vgal.recipe.conform_categories_to_recipe(entry, entry.categories)

            if not entry.main_product then
                ---@diagnostic disable-next-line: undefined-field
                entry.main_product = entry.results[1].name
            end

            entry.crafting_machine_tint = entry.crafting_machine_tint or vgal.recipe.get_crafting_machine_tint_or_guess(entry)

            if entry.locale_source then
                entry.localised_name_source = entry.locale_source
                entry.localised_description_source = entry.locale_source
            end
            if entry.localised_name_source then
                entry.localised_name = vgal.recipe.get_localised_name_or_guess(data.raw["recipe"][entry.localised_name_source])
            end
            if entry.localised_description_source then
                entry.localised_description = vgal.recipe.get_localised_description_or_guess(data.raw["recipe"][entry.localised_description_source])
            end
            entry.localised_name = vgal.recipe.get_localised_name_or_guess(entry)
            entry.localised_description = vgal.recipe.get_localised_description_or_guess(entry)

            entry.auto_recycle = false
            entry.allow_decomposition = false
            entry.allow_as_intermediate = false

            if entry.enable_smart_productivity == nil then
                local eligible_for_smart_prod = true
                for _, result in ipairs((entry.results or {})) do
                    --[[@cast result data.ProductPrototype]]
                    if result.ignored_by_productivity then
                        eligible_for_smart_prod = false
                    end
                end

                entry.enable_smart_productivity = eligible_for_smart_prod
            end
            if entry.enable_smart_stats == nil then
                local eligible_for_smart_stats = true
                for _, result in ipairs((entry.results or {})) do
                    --[[@cast result data.ProductPrototype]]
                    if result.ignored_by_stats then
                        eligible_for_smart_stats = false
                    end
                end
                for _, ingredient in ipairs((entry.ingredients or {})) do
                    --[[@cast ingredient data.IngredientPrototype]]
                    if ingredient.ignored_by_stats then
                        eligible_for_smart_stats = false
                    end
                end

                entry.enable_smart_stats = eligible_for_smart_stats
            end

            if entry.allow_productivity == nil then
                entry.allow_productivity = vgal.recipe.get_if_productivity(entry.main_product)
            end

            vgal.log("registering: " .. entry.name)

            ---@diagnostic disable-next-line: assign-type-mismatch
            data:extend { entry }

            if entry.enable_smart_productivity and entry.allow_productivity then
                vgal.recipe.smart_allow_productivity(entry.name)
            end

            if entry.enable_smart_stats then
                vgal.recipe.smart_fix_stats(entry.name)
            end

            for i, tech_entry in ipairs(entry.technologies) do
                if type(tech_entry) == "table" then
                    vgal.tech.create_node(entry, tech_entry, i, hidden)
                elseif type(tech_entry) == "string" then
                    vgal.tech.add_recipe(tech_entry, entry.name)
                else
                    error("Invalid prototype technologies entry: " .. serpent.block(tech_entry))
                end
            end

            if entry.productivity_technology ~= "" then -- so if "", no prod even when tech exists
                entry.productivity_technology = entry.productivity_technology or vgal.recipe.get_productivity_tech_name(
                    entry.main_product)
                if entry.productivity_technology then
                    if type(entry.productivity_technology) == "string" then
                        ---@type string
                        vgal.tech.add_productivity_change(entry.productivity_technology --[[@as string]], entry.name, nil,
                            entry.hidden)
                    else
                        vgal.tech.add_productivity_change(
                            entry.productivity_technology[1],
                            entry.name,
                            entry.productivity_technology[2],
                            entry.hidden
                        )
                    end
                end
            end
        elseif entry.type == "toggle-group" then
            ---@cast entry vgal.VgalToggleGroupPrototype

            if entry.enabled == nil then
                if entry.enabled_setting then
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    entry.enabled = settings.startup[entry.enabled_setting].value
                else
                    ---@diagnostic disable-next-line: assign-type-mismatch
                    entry.enabled = settings.startup[entry.name].value
                end
            end

            vgal.groups[entry.name] = entry
        else
            error("Invalid prototype type " .. entry.type .. " for " .. entry.name)
        end
    end
end

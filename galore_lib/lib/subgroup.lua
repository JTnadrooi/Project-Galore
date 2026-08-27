vgal.subgroup = vgal.subgroup or {}

---@param name string
---@param entries string[]
---@param group string
---@param order data.Order
function vgal.subgroup.new(name, entries, group, order)
    data:extend({
        {
            type = "item-subgroup",
            name = name,
            group = group,
            order = order,
        }
    })
    for _, entry in ipairs(entries) do
        vgal.subgroup.set_for(entry, name)
    end
end

---@param name string
---@param subgroup_name string
function vgal.subgroup.set_for(name, subgroup_name)
    local recipeable = vgal.get_recipeable(name)
    recipeable.subgroup = subgroup_name

    local recipe = data.raw["recipe"][name]
    if recipe then
        vgal.subgroup.clean(recipe)
        -- if recipe.results and (#recipe.results > 1) then
        --     recipe.main_product = name
        -- end
        if #(recipe.results or {}) > 1 then
            recipe.main_product = name
        end
    end
end

---@param number integer
---@return data.Order
function vgal.subgroup.order_from_number(number)
    if number > 26 then
        error(number .. " is more than 26.")
    end
    return string.sub("abcdefghijklmnopqrstuvwxyz", number, number)
end

---@param recipe_name string
---@param force boolean?
function vgal.subgroup.restore(recipe_name, force)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)
    local main_product = vgal.recipe.get_main_product_or_guess(recipe)

    local recipeable = vgal.get_recipeable(main_product)

    if force then
        recipe.subgroup = recipeable.subgroup
        recipe.order = recipeable.order
    else
        recipe.subgroup = recipe.subgroup or recipeable.subgroup
        recipe.order = recipe.order or recipeable.order
    end
end

---@param recipe_name string
function vgal.subgroup.clean_recipe(recipe_name)
    local recipe = vgal.throw.if_recipe_not_found(recipe_name)

    vgal.subgroup.clean(recipe)
end

---@param prototype data.PrototypeBase
function vgal.subgroup.clean(prototype)
    prototype.order = nil
    prototype.subgroup = nil
end

---@param prototype data.PrototypeBase
---@return {order: data.Order?, subgroup: data.ItemSubGroupID?}
function vgal.subgroup.get_order_or_guess(prototype)
    local order = prototype.order
    local subgroup = prototype.subgroup

    if (not order) or (not subgroup) then
        if prototype.type == "recipe" then
            local recipe = prototype --[[@as data.RecipePrototype]]
            local main_product = vgal.recipe.get_main_product_or_guess(recipe)

            local main_product_order_data = vgal.subgroup.get_order_or_guess(vgal.get_recipeable(main_product))

            return { order = order or main_product_order_data.order, subgroup = subgroup or main_product_order_data.subgroup }
        end
    end

    return { order = order, subgroup = subgroup }
end

---@param subgroups vgal.SubgroupOverrideCollection[]
function vgal.subgroup.process_override_subgroups(subgroups)
    for _, subgroup in ipairs(subgroups) do
        if subgroup.when == nil then
            subgroup.when = true
        end

        for _, when_setting in ipairs(subgroup.when_settings or {}) do
            if not settings.startup[when_setting].value then
                subgroup.entries = {}
            end
        end

        if not subgroup.when then
            subgroup.entries = {}
        end

        if subgroup.should_reorder_entries then
            for i, entry in ipairs(subgroup.entries or {}) do
                local entry_name
                if type(entry) == "string" then
                    entry_name = entry
                else
                    entry_name = entry[1]
                end

                vgal.get_recipeable(entry_name).order = entry[2] or vgal.subgroup.order_from_number(i)
            end
        end

        vgal.subgroup.new("vgal-" .. subgroup.name, vgal.table.select(subgroup.entries or {}, function(e)
            return e[1] or e
        end), subgroup.group, subgroup.order)

        for i, recipe_entry in ipairs(subgroup.recipe_entries or {}) do
            if recipe_entry[1] then
                ---@cast recipe_entry {[1]: string, [2]: data.Order}

                local recipe = vgal.throw.if_recipe_not_found(recipe_entry[1])
                recipe.subgroup = "vgal-" .. subgroup.name

                if subgroup.should_reorder_entries then
                    recipe.order = recipe_entry[2]
                end
            else
                ---@cast recipe_entry string

                local recipe = vgal.throw.if_recipe_not_found(recipe_entry)
                recipe.subgroup = "vgal-" .. subgroup.name

                if subgroup.should_reorder_entries then
                    recipe.order = vgal.subgroup.order_from_number(i)
                end
            end
        end

        for _, cleaning_entry in ipairs(subgroup.cleaning_entries or {}) do
            if cleaning_entry[1] then
                ---@cast cleaning_entry {[1]: string, [2]: string}

                vgal.subgroup.clean_recipe(cleaning_entry[1])
                data.raw["recipe"][cleaning_entry[1]].main_product = cleaning_entry[2]
            else
                ---@cast cleaning_entry string

                vgal.subgroup.clean_recipe(cleaning_entry --[[@as string]])
            end
        end
    end
end

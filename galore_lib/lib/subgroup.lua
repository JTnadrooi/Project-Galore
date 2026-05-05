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
        recipe.main_product = name
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
    local main_product = vgal.recipe.get_preferred_main_product(recipe)

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
            for i, entry_name in ipairs(subgroup.entries or {}) do
                vgal.get_recipeable(entry_name).order = vgal.subgroup.order_from_number(i)
            end
        end

        vgal.subgroup.new("vgal-" .. subgroup.name, subgroup.entries or {}, subgroup.group, subgroup.order)

        for i, recipe_name in ipairs(subgroup.recipe_entries or {}) do
            local recipe = vgal.throw.if_recipe_not_found(recipe_name)
            recipe.subgroup = "vgal-" .. subgroup.name

            if subgroup.should_reorder_entries then
                recipe.order = vgal.subgroup.order_from_number(i)
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

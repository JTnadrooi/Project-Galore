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

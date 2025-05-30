function vgal.subgroup.replace(subgroup_name, old, new)
    local subgroup = data.raw["item-subgroup"][subgroup_name]
    if subgroup.group == old then
        subgroup.group = new
    end
end

function vgal.subgroup.new(name, entries, tab, order)
    data:extend({
        {
            type = "item-subgroup",
            name = name,
            group = tab,
            order = order,
        }
    })
    for _, entry in ipairs(entries) do
        vgal.subgroup.set_item_or_fluid(entry, name)
        -- vgal.any(entry).subgroup = name
        -- if data.raw["recipe"][entry] then
        --     data.raw["recipe"][entry].subgroup = nil
        --     -- data.raw["recipe"][entry].order = nil
        -- end
    end
end

function vgal.subgroup.set_item_or_fluid(name, subgroup_name)
    local anyMP = vgal.any(name)
    anyMP.subgroup = subgroup_name
    if data.raw["recipe"][name] then
        data.raw["recipe"][name].subgroup = subgroup_name
        data.raw["recipe"][name].order = anyMP.order
    end
end

function vgal.subgroup.order_from_number(number)
    if number > 26 then
        error(number .. " is more than 26.")
    end
    return string.sub("abcdefghijklmnopqrstuvwxyz", number, number)
end

function vgal.subgroup.restore(recipe_name, force)
    local recipe = data.raw["recipe"][recipe_name]
    local main_product = vgal.recipe.get_preferred_main_product(recipe)
    local anyMP = vgal.any(main_product)
    if force then
        recipe.subgroup = anyMP.subgroup
        recipe.order = anyMP.order
    else
        recipe.subgroup = recipe.subgroup or anyMP.subgroup
        recipe.order = recipe.order or anyMP.order
    end
end

function vgal.subgroup.clean(recipe_name)
    data.raw["recipe"][recipe_name].order = nil
    data.raw["recipe"][recipe_name].subgroup = nil
end

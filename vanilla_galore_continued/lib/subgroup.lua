function vgal.subgroup.replace(subgroupName, old, new)
    local subgroup = data.raw["item-subgroup"][subgroupName]
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

function vgal.subgroup.set_item_or_fluid(name, subgroupName)
    local anyMP = vgal.any(name)
    anyMP.subgroup = subgroupName
    if data.raw["recipe"][name] then
        data.raw["recipe"][name].subgroup = subgroupName
        data.raw["recipe"][name].order = anyMP.order
    end
end

function vgal.subgroup.restore(recipeName)
    local recipe = data.raw["recipe"][recipeName]
    local mainProduct = vgal.recipe.get_preferred_main_product(recipe)
    local anyMP = vgal.any(mainProduct)
    recipe.subgroup = recipe.subgroup or anyMP.subgroup
    recipe.order = recipe.order or anyMP.order
end

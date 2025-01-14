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
        vgal.any(entry).subgroup = name
        if data.raw["recipe"][entry] then
            data.raw["recipe"][entry].subgroup = nil
            data.raw["recipe"][entry].order = nil
        end
    end
end

function vgal.subgroup.set_item_or_fluid(name, subgroupName)
    vgal.any(name).subgroup = subgroupName;
    if data.raw["recipe"][name] then
        data.raw["recipe"][name].subgroup = nil
        data.raw["recipe"][name].order = nil
    end
end

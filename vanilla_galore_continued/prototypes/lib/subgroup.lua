function vgal.subgroup.replace_group(subgroupName, old, new)
    local subgroup = data.raw["item-subgroup"][subgroupName]
    if subgroup.group == old then
        subgroup.group = new
    end
end

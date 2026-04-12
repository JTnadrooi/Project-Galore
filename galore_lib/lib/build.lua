function vgal.build.name(prefix, name, tier)
    tier = tier == 1 and nil or tier
    return (prefix and (prefix .. "-") or "") .. name .. (tier and ("-" .. tier) or "")
end

function vgal.build.table(items, fluids)
    items = items or {}
    fluids = fluids or {}
    local i = vgal.table.get_shorthand(items, "item")
    local f = vgal.table.get_shorthand(fluids, "fluid")
    return vgal.table.merge(i, f)
end

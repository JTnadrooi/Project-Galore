function vgal.build.name(prefix, name, tier)
    tier = tier == 1 and nil or tier
    return (prefix and (prefix .. "-") or "") .. name .. (tier and ("-" .. tier) or "")
end

function vgal.build.table(in_items, in_fluids)
    in_items = in_items or {}
    in_fluids = in_fluids or {}
    local i = vgal.table.get_shorthand(in_items, "item")
    local f = vgal.table.get_shorthand(in_fluids, "fluid")
    return vgal.table.merge(i, f)
end

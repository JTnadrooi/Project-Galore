function vgal.build.name(prefix, name, tier)
    tier = tier == 1 and nil or tier
    return (prefix and (prefix .. "-") or "") .. name .. (tier and ("-" .. tier) or "")
end

function vgal.build.table(inItems, inFluids)
    inItems = inItems or {}
    inFluids = inFluids or {}
    local i = vgal.table.get_shorthand(inItems, "item")
    local f = vgal.table.get_shorthand(inFluids, "fluid")
    return vgal.table.merge(i, f)
end

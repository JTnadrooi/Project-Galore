for _, metal in pairs(vgal.constants.METALS) do
    metal.bacteria = metal.name .. "-bacteria"
    metal.molten = "molten-" .. metal.name
end

vgal.constants["quality-module"] = {
    name = "quality-module",
    tiers = { "quality-module", "quality-module-2", "quality-module-3" }
}

vgal.tech.units["space-science-pack"].value = 4
vgal.table.extend_single(vgal.tech.units, {
    name = "metallurgic-science-pack",
    value = 5,
})
vgal.table.extend_single(vgal.tech.units, {
    name = "electromagnetic-science-pack",
    value = 5,
})
vgal.table.extend_single(vgal.tech.units, {
    name = "agricultural-science-pack",
    value = 5,
})
vgal.table.extend_single(vgal.tech.units, {
    name = "cryogenic-science-pack",
    value = 8,
})
vgal.table.extend_single(vgal.tech.units, {
    name = "promethium-science-pack",
    value = 10,
})

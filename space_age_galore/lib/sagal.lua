for _, metal in pairs(vgal.constants.METALS) do
    metal.bacteria = metal.name .. "-bacteria"
    metal.molten = "molten-" .. metal.name
end

vgal.constants["quality-module"] = {
    name = "quality-module",
    tiers = { "quality-module", "quality-module-2", "quality-module-3" }
}

for _, metal in pairs(vgal.constants.METALS) do
    metal.bacteria = metal.name .. "-bacteria"
    metal.molten = "molten-" .. metal.name
end

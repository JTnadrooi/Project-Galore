if mods["angelsaddons-mobility"] then
    data.raw["item-subgroup"]["vgal-rolling-stock"].order = "z[angel-train]--b"
end

if mods["angelsaddons-bots"] then
    data.raw["item"]["roboport"].order = "--b"
    data.raw["item"]["roboport"].subgroup = "angels-cargo-ports"
    data.raw["item"]["construction-robot"].order = "--c"
    data.raw["item"]["construction-robot"].subgroup = "angels-cargo-bots"
    data.raw["item"]["logistic-robot"].order = "--b"
    data.raw["item"]["logistic-robot"].subgroup = "angels-cargo-bots"
end

if mods["angelsaddons-cab"] then
    data.raw["item-subgroup"]["vgal-rolling-stock"].order = "z[angel-train]--b"
    data.raw["item-subgroup"]["transport"].order = "z[angel-train]-x"
    data.raw["item-subgroup"]["angels-vehicle-equipment"].order = "gb"
    data.raw["item-subgroup"]["angels-vehicle-equipment"].group = "combat"

    data.raw["item"]["angels-cab-energy-interface-mk1"].order = "x"
    data.raw["item"]["angels-cab-energy-interface-mk1"].subgroup = "angels-vehicle-equipment"

    
end

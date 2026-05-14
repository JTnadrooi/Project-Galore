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

if mods["angelsaddons-storage"] then
    -- remove removed ore silos
    for _, removed_ore_index in ipairs(agal.defines.removed_ore_indexes) do
        local silo_name = "angels-silo-ore" .. removed_ore_index
        vgal.data.trim(silo_name)
        vgal.data.deephide(data.raw["item"][silo_name])
        vgal.data.deephide(data.raw["container"][silo_name])
    end

    -- make pressure tank more expensive and lategame
    data.raw["technology"]["angels-pressure-tanks"].prerequisites = { "angels-stone-smelting-2" }
    data.raw["technology"]["angels-pressure-tanks"].unit.count = 200
    vgal.tech.add_unit("angels-pressure-tanks", "chemical-science-pack")
    data.raw.recipe["angels-pressure-tank-1"].ingredients = vgal.build.table({
        { "angels-concrete-brick", 25 },
        { "steel-plate",           20 },
        { "pipe",                  60 },
    })
end

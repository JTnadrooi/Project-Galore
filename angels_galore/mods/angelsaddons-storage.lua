if not mods["angelsaddons-storage"] then return end

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

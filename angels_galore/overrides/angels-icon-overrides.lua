data.raw.recipe["angels-processed-iron"].icons = vgal.icon.register({
    vgal.icon.get("angels-processed-iron"),
    vgal.icon.get_in("iron-ore"),
})
data.raw.recipe["angels-processed-copper"].icons = vgal.icon.register({
    vgal.icon.get("angels-processed-copper"),
    vgal.icon.get_in("copper-ore"),
})

data.raw.recipe["angels-garden-cultivating"].icons = vgal.icon.register({
    vgal.icon.get("angels-paste-cellulose"),
    vgal.icon.get_out("angels-temperate-garden"),
    vgal.icon.get_out2("angels-desert-garden"),
    vgal.icon.get_out3("angels-swamp-garden"),
})

-- for _, ore_index in ipairs(agal.constants.ORE_INDEXES) do
--     data.raw["recipe"]["angels-ore" .. ore_index .. "-crushed-smelting"].icons = vgal.icon.register({
--         vgal.icon.get(ore_index == 2 and "iron-plate" or "copper-plate"),
--         vgal.icon.get_in("angels-ore" .. ore_index .. "-crushed"),
--     })
-- end
for _, metal in ipairs(vgal.constants.METALS) do
    local ore_index = (metal == "copper") and 2 or 3
    local nugget = "angels-" .. metal .. "-nugget"
    local slag = "angels-" .. metal .. "-slag"
    local pebbles = "angels-" .. metal .. "-pebbles"
    local ore = metal .. "-ore"
    local base_ore = "angels-ore" .. ore_index
    local plate = metal .. "-plate"

    data.raw["recipe"]["angels-plate-" .. metal].icons = vgal.icon.register({
        vgal.icon.get(metal .. "-plate"),
        vgal.icon.get_in("angels-liquid-molten-" .. metal),
    })
    -- data.raw["recipe"]["angels-roll-" .. metal .. "-2"].icons = vgal.icon.register({
    --     vgal.icon.get("angels-roll-" .. metal),
    --     vgal.icon.get_in("angels-liquid-coolant"),
    -- })
    -- data.raw["recipe"]["angels-roll-" .. metal].icons = vgal.icon.register({
    --     vgal.icon.get("angels-roll-" .. metal),
    --     vgal.icon.get_in("angels-liquid-coolant"),
    -- })
    data.raw["recipe"][metal .. "-plate"].icons = vgal.icon.register({
        vgal.icon.get(metal .. "-plate"),
        vgal.icon.get_in(base_ore),
    })
end
-- data.raw["recipe"]["angels-wire-coil-copper-2"].icons = vgal.icon.register({
--     vgal.icon.get("angels-wire-coil-copper"),
--     vgal.icon.get_in("angels-liquid-coolant"),
-- })
data.raw["recipe"]["copper-cable"].icons = vgal.icon.register({
    vgal.icon.get("copper-cable"),
    vgal.icon.get_in("copper-plate"),
})
data.raw["recipe"]["angels-plate-steel"].icons = vgal.icon.register({
    vgal.icon.get("steel-plate"),
    vgal.icon.get_in("angels-liquid-molten-steel"),
})
-- data.raw["recipe"]["solid-coke"].icons = vgal.icon.register({
--     vgal.icon.get("solid-coke"),
-- })
-- data.raw["recipe"]["solid-coke-sulfur"].icons = vgal.icon.register({
--     vgal.icon.get("solid-coke"),
--     vgal.icon.get_in("water-purified"),
-- })

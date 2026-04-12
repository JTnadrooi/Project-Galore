agal = agal or {}
agal.build = agal.build or {}

require("constants")

if (vgal and vgal.constants and vgal.constants.METALS) then -- for when loading constants in settings
    for _, metal in pairs(vgal.constants.METALS) do
        metal.ore_index = (metal.name == "copper") and 2 or 3
        metal.ore = metal.name .. "-ore"
        metal.base_ore = "angels-ore" .. metal.ore_index

        metal.nugget = "angels-" .. metal.name .. "-nugget"
        metal.slag = "angels-" .. metal.name .. "-slag"
        metal.pebbles = "angels-" .. metal.name .. "-pebbles"

        metal.molten = "angels-liquid-molten-" .. metal.name
        metal.ingot = "angels-ingot-" .. metal.name
        metal.processed = "angels-processed-" .. metal.name
        metal.pellet = "angels-pellet-" .. metal.name
        metal.roll = "angels-roll-" .. metal.name
        metal.angels_plate_recipe_name = "angels-plate-" .. metal.name

        for _, ore_state in ipairs(agal.constants.ORE_STATES) do
            metal[ore_state] = "angels-ore" .. metal.ore_index .. "-" .. ore_state
        end

        metal.ore_states = table.deepcopy(agal.constants.ORE_STATES)
    end
end

vgal.table.extend_single(vgal.tech.units, {
    name = "vgal-agricultural-science-pack",
    value = 2,
})

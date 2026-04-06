require("lib.agal") -- I kinda need my constants..

local function hide_and_force(name, forced_value)
    data.raw["bool-setting"][name].hidden = true
    data.raw["bool-setting"][name].forced_value = forced_value
end

hide_and_force("vgal-renewable-ores")
hide_and_force("vgal-oil-recipes")
hide_and_force("vgal-oil-recipes")

for _, ore_index in ipairs(agal.constants.REMOVED_ORE_INDEXES) do
    hide_and_force("angels-starting-resource-ore" .. ore_index, true) -- Dissabling is done in final fixes, I need a autoplace to copy it to ore2, if I say false, it wont show up in starter patch
end

for _, ore_index in ipairs(agal.constants.ORE_INDEXES) do
    hide_and_force("angels-starting-resource-ore" .. ore_index, true)
end

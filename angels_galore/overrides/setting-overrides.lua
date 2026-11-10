vgal.setting.hide_and_force("vgal-renewable-ores", false)
vgal.setting.hide_and_force("vgal-oil-recipes", false)

for _, ore_index in ipairs(vgal.defines.removed_ore_indexes) do
    vgal.setting.hide_and_force("angels-starting-resource-ore" .. ore_index, true) -- Disabling is done in final fixes, I need a autoplace to copy it to ore2, if I say false, it wont show up in starter patch
end

for _, ore_index in ipairs(vgal.defines.ore_indexes) do
    vgal.setting.hide_and_force("angels-starting-resource-ore" .. ore_index, true)
end

vgal.setting.hide_and_force("angels-enable-oresilos", true)
vgal.setting.hide_and_force("angels-enable-silos", true)
vgal.setting.hide_and_force("angels-enable-warehouses", true)
vgal.setting.hide_and_force("angels-enable-inline-tank", true)
vgal.setting.hide_and_force("angels-enable-pressure-tank", true)

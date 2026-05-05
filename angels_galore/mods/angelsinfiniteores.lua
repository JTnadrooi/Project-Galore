if not mods["angelsinfiniteores"] then return end

-- undo uranium tech changes and move fluid mining to electric mining drill

vgal.tech.add_unit("uranium-mining", "chemical-science-pack")
vgal.tech.remove_prerequisite("uranium-mining", "electric-mining-drill")

table.insert(data.raw["technology"]["electric-mining-drill"].effects, {
    type = "mining-with-fluid",
    modifier = true
})

for i, effect in pairs(data.raw["technology"]["uranium-mining"].effects) do
    if effect.type == "mining-with-fluid" then
        table.remove(data.raw["technology"]["uranium-mining"].effects, i)
        break
    end
end

-- hyjack autoplace
data.raw["resource"]["infinite-angels-ore2"].autoplace = data.raw["resource"]["infinite-angels-ore1"].autoplace

-- remove removed infinite ores
for _, ore_index in pairs(agal.defines.removed_ore_indexes) do
    local ore = "infinite-angels-ore" .. ore_index

    vgal.data.deephide(data.raw["resource"][ore])
    data.raw["autoplace-control"][ore] = nil
    data.raw["planet"]["nauvis"].map_gen_settings.autoplace_controls[ore] = nil
    data.raw["planet"]["nauvis"].map_gen_settings.autoplace_settings.entity.settings[ore] = nil

    for _, map_gen_preset in pairs(data.raw["map-gen-presets"]) do
        for key, value in pairs(map_gen_preset) do
            if key == "name" or key == "type" then
                goto continue
            end

            if value.basic_settings and value.basic_settings.autoplace_controls then
                value.basic_settings.autoplace_controls[ore] = nil
            end

            ::continue::
        end
    end
end

-- fix acid needed to mine ore2 (jiv)
data.raw["resource"]["infinite-angels-ore2"].minable.required_fluid = "angels-liquid-sulfuric-acid"

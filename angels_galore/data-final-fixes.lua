local TO_REMOVE = { "angels-ore2", "angels-ore4" }

for _, ore in pairs(TO_REMOVE) do
    data.raw["resource"][ore] = nil
    data.raw["autoplace-control"][ore] = nil
    data.raw["planet"]["nauvis"].map_gen_settings.autoplace_controls[ore] = nil
    data.raw["planet"]["nauvis"].map_gen_settings.autoplace_settings.entity.settings[ore] = nil
end

for _, preset in pairs(data.raw["map-gen-presets"].default) do
    if preset.basic_settings and preset.basic_settings.autoplace_controls then
        for _, ore in pairs(TO_REMOVE) do
            preset.basic_settings.autoplace_controls[ore] = nil
        end
    end
end

--- ore removal ---

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

--- wipe alien samples of the planet ---

local alien_sample_tech_names = {}
for _, tech in pairs(data.raw.technology) do
    if tech.unit and tech.unit.ingredients then
        for i, ingredient in ipairs(tech.unit.ingredients) do
            if ingredient[1] == "token-bio" then
                table.remove(tech.unit.ingredients, i)
                table.insert(alien_sample_tech_names, tech.name)
                break;
            end
        end
    end
end

for _, tech_name in ipairs(alien_sample_tech_names) do
    local tech = data.raw["technology"][tech_name]
    local multiplier = 1
    for _, ingredient in ipairs(tech.unit.ingredients) do
        if ingredient[2] ~= 1 then
            multiplier = ingredient[2]
            ingredient[2] = 1
        end
    end
    if multiplier ~= 1 then
        tech.unit.count = multiplier * 150
    end
end

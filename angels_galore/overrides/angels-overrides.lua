--- ore removal ---

for _, ore in pairs(agal.constants.REMOVED_ORE_INDEXES) do
    data.raw["resource"][ore] = nil
    data.raw["autoplace-control"][ore] = nil
    data.raw["planet"]["nauvis"].map_gen_settings.autoplace_controls[ore] = nil
    data.raw["planet"]["nauvis"].map_gen_settings.autoplace_settings.entity.settings[ore] = nil
end

for _, preset in pairs(data.raw["map-gen-presets"].default) do
    if preset.basic_settings and preset.basic_settings.autoplace_controls then
        for _, ore in pairs(agal.constants.REMOVED_ORE_INDEXES) do
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
        tech.unit.count = multiplier * 40
    end
end

vgal.data.deep_hide(data.raw["tool"]["token-bio"])

--- tech ---
data.raw["technology"]["basic-chemistry"].unit.count = 40
-- vgal.tech.add_prerequisite("ore-refining", "bio-processing-alien-1")

--- fuel ---
data.raw["item"]["coal-crushed"].fuel_value = "2.5MJ"
data.raw["item"]["solid-coke"].fuel_value = "3.5MJ"
data.raw["item"]["pellet-coke"].fuel_value = "18MJ"
data.raw["item"]["solid-fuel"].fuel_value = "12MJ" -- angels changes it
data.raw["item"]["red-cellulose-fiber"].fuel_category = "chemical"
data.raw["item"]["red-cellulose-fiber"].fuel_value = "0.25MJ"
data.raw["item"]["blue-cellulose-fiber"].fuel_category = "chemical"
data.raw["item"]["blue-cellulose-fiber"].fuel_value = "3MJ"

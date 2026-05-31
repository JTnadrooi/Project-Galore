-- wipe alien samples of the planet
local alien_sample_tech_names = {}
for _, tech in pairs(data.raw.technology) do
    if tech.unit and tech.unit.ingredients then
        for i, ingredient in ipairs(tech.unit.ingredients) do
            if ingredient[1] == "angels-token-bio" then
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

vgal.data.deephide(data.raw["tool"]["angels-token-bio"])

for _, lab in pairs(data.raw["lab"]) do
    vgal.table.remove(lab.inputs, "angels-token-bio")
end

-- make gardens only drop the garden itself
for _, environment in pairs(agal.defines.environments) do
    data.raw["tree"][environment.garden].minable.results = {
        { type = "item", name = environment.garden, amount = 1 },
    }
end
-- remove ore gen of removed ores.
for _, ore_index in pairs(agal.defines.removed_ore_indexes) do
    local ore = "angels-ore" .. ore_index

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

-- fix ore mining speeds
for _, metal in pairs(vgal.defines.metals --[[@as table<string, agal.Metal>]]) do
    data.raw["resource"][metal.base_ore].minable.mining_time = 1
end

-- steal autoplace
data.raw["resource"]["angels-ore2"].autoplace = table.deepcopy(data.raw["resource"]["angels-ore1"].autoplace)

-- make raw meat consumable (not too far fetched with how the engineer already eats raw fish but yea don't do this)
-- the desc says it tastes like chicken tho
-- update: capsule type would require me to "remove" the raw meat as "item" and I'm not doing that.. boo
-- maybe in final fixes

-- fuel tweaks
data.raw["item"]["angels-coal-crushed"].fuel_value = "2.5MJ"
data.raw["item"]["angels-solid-coke"].fuel_value = "3.5MJ"
data.raw["item"]["angels-pellet-coke"].fuel_value = "18MJ"
data.raw["item"]["solid-fuel"].fuel_value = "12MJ" -- angels changes it

data.raw["item"]["angels-rocket-fuel-capsule"].fuel_value = data.raw["item"]["rocket-fuel"].fuel_value
data.raw["item"]["angels-rocket-fuel-capsule"].fuel_acceleration_multiplier = data.raw["item"]["rocket-fuel"]
    .fuel_acceleration_multiplier
data.raw["item"]["angels-rocket-fuel-capsule"].fuel_acceleration_multiplier_quality_bonus = data.raw["item"]
    ["rocket-fuel"].fuel_acceleration_multiplier_quality_bonus
data.raw["item"]["angels-rocket-fuel-capsule"].fuel_category = data.raw["item"]["rocket-fuel"].fuel_category
data.raw["item"]["angels-rocket-fuel-capsule"].fuel_emissions_multiplier = data.raw["item"]["rocket-fuel"]
    .fuel_emissions_multiplier
data.raw["item"]["angels-rocket-fuel-capsule"].fuel_glow_color = data.raw["item"]["rocket-fuel"].fuel_glow_color
data.raw["item"]["angels-rocket-fuel-capsule"].fuel_top_speed_multiplier = data.raw["item"]["rocket-fuel"]
    .fuel_top_speed_multiplier
data.raw["item"]["angels-rocket-fuel-capsule"].fuel_top_speed_multiplier_quality_bonus = data.raw["item"]["rocket-fuel"]
    .fuel_top_speed_multiplier_quality_bonus

data.raw["item"]["angels-cellulose-fiber"].fuel_value = "0.5MJ"
data.raw["item"]["angels-wood-pellets"].fuel_value = "2.4MJ" -- +20%
data.raw["item"]["angels-wood-bricks"].fuel_value = "8MJ"    -- +60%
data.raw["item"]["angels-wood-charcoal"].fuel_value = "3MJ"
data.raw["item"]["angels-solid-oil-residual"].fuel_value = "3MJ"
data.raw["item"]["angels-solid-oil-residual"].fuel_category = "chemical"

data.raw["item"]["coal"].fuel_emissions_multiplier = 1.5
data.raw["item"]["angels-coal-crushed"].fuel_emissions_multiplier = 1.2
data.raw["item"]["angels-solid-carbon"].fuel_emissions_multiplier = 0.75
data.raw["item"]["solid-fuel"].fuel_emissions_multiplier = 0.8
data.raw["item"]["nuclear-fuel"].fuel_emissions_multiplier = 0.1
data.raw["item"]["angels-nuclear-fuel"].fuel_emissions_multiplier = 0.05
data.raw["item"]["angels-nuclear-fuel-2"].fuel_emissions_multiplier = 0.01

-- vgal.recipe.unhide("thermal-water-purification")
-- vgal.tech.add_recipe("vgal-hydrochloric-intermediates", "thermal-water-purification")

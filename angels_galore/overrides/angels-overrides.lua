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

-- remove bio related stuff from modules.
vgal.table.remove(data.raw["technology"]["modules"].prerequisites, "angels-bio-processing-crystal-splinter-1")
for _, module in pairs(vgal.defines.modules) do
    for tier, tiered_name in ipairs(module.tiers) do
        if tier == 2 then
            vgal.table.remove(data.raw["technology"][tiered_name].prerequisites, "angels-bio-processing-crystal-shard-1")
        elseif tier == 3 then
            vgal.table.remove(data.raw["technology"][tiered_name].prerequisites, "angels-bio-processing-crystal-full")
        end
    end
end

-- make gardens only drop the garden itself
for _, environment in pairs(agal.defines.environments) do
    data.raw["tree"][environment.garden].minable.results = {
        { type = "item", name = environment.garden, amount = 1 },
    }
end

-- align ores (ore2 is normally a tier 2 ore)
data.raw["resource"]["angels-ore2"].minable.mining_time = data.raw["resource"]["angels-ore3"].minable.mining_time
data.raw["resource"]["angels-ore2"].autoplace = data.raw["resource"]["angels-ore1"].autoplace

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

data.raw["item"]["coal"].fuel_emissions_multiplier = 1.5
data.raw["item"]["angels-coal-crushed"].fuel_emissions_multiplier = 1.2
data.raw["item"]["angels-solid-carbon"].fuel_emissions_multiplier = 0.75
data.raw["item"]["solid-fuel"].fuel_emissions_multiplier = 0.8
data.raw["item"]["nuclear-fuel"].fuel_emissions_multiplier = 0.1
data.raw["item"]["angels-nuclear-fuel"].fuel_emissions_multiplier = 0.05
data.raw["item"]["angels-nuclear-fuel-2"].fuel_emissions_multiplier = 0.01

-- vgal.recipe.unhide("thermal-water-purification")
-- vgal.tech.add_recipe("vgal-hydrochloric-intermediates", "thermal-water-purification")

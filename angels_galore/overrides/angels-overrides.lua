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
data.raw["item"]["angels-red-cellulose-fiber"].fuel_category = "chemical"
data.raw["item"]["angels-red-cellulose-fiber"].fuel_value = "0.25MJ"
data.raw["item"]["angels-blue-cellulose-fiber"].fuel_category = "chemical"
data.raw["item"]["angels-blue-cellulose-fiber"].fuel_value = "3MJ"
data.raw["item"]["angels-cellulose-fiber"].fuel_value = "0.5MJ" -- from 1

-- vgal.recipe.unhide("thermal-water-purification")
-- vgal.tech.add_recipe("vgal-hydrochloric-intermediates", "thermal-water-purification")

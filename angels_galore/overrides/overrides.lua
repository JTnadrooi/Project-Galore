-- increase underground belt distances (seems only fair with the huge new machines)
data.raw["underground-belt"]["underground-belt"].max_distance = 8
data.raw["underground-belt"]["fast-underground-belt"].max_distance = 10
data.raw["underground-belt"]["express-underground-belt"].max_distance = 12

-- increase power reach (huge machines, looking at sorting machine rn)
data.raw["electric-pole"]["small-electric-pole"].maximum_wire_distance = 8.5 -- 1 tile increase for the sorting machine. (also makes it reach past ec miner + belt + ec miner)
data.raw["electric-pole"]["medium-electric-pole"].maximum_wire_distance = 10.5

data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections[2].max_underground_distance = 14

-- increase inserter hand sizes (lots of new fast outputting recipes alsooooo)
for _, inserter in pairs(data.raw["inserter"]) do
    inserter.stack_size_bonus = (inserter.stack_size_bonus or 0) + 2
end

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

vgal.data.hide(data.raw["item"]["angels-token-bio"])

for _, lab in pairs(data.raw["lab"]) do
    vgal.table.remove(lab.inputs, "angels-token-bio")
end

-- make gardens only drop the garden itself
for _, environment in pairs(vgal.defines.environments) do
    data.raw["tree"][environment.garden].minable.results = {
        { type = "item", name = environment.garden, amount = 1 },
    }
end
-- remove ore gen of removed ores.
for _, ore_index in pairs(vgal.defines.removed_ore_indexes) do
    local ore = "angels-ore" .. ore_index

    vgal.data.hide(data.raw["resource"][ore])
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
for _, metal in pairs(vgal.defines.metals) do
    data.raw["resource"][metal.base_ore].minable.mining_time = 1
end

-- steal autoplace
data.raw["resource"]["angels-ore2"].autoplace = table.deepcopy(data.raw["resource"]["angels-ore1"].autoplace)

-- make raw meat consumable (not too far fetched with how the engineer already eats raw fish but yea don't do this)
-- the desc says it tastes like chicken tho
-- update: capsule type would require me to "remove" the raw meat as "item" and I'm not doing that.. boo
-- maybe in final fixes

-- vgal.recipe.unhide("thermal-water-purification")
-- vgal.tech.add_recipe("vgal-hydrochloric-intermediates", "thermal-water-purification")

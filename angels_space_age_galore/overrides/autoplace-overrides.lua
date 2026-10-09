-- move puffer nests to gleba
data.raw["planet"]["nauvis"].map_gen_settings.autoplace_settings.entity.settings["angels-puffer-nest"] = nil
data.raw["planet"]["gleba"].map_gen_settings.autoplace_settings.entity.settings["angels-puffer-nest"] = {}

-- maybe add fluorite to gleba?
-- might be fitting with how the puffers like it, but its already kinda aquilos thing
-- importing it might be funny? would require some recipes to be reworked to make fluorite less qauntative (?)

local gleba_garden_tiles = {
    "wetland-blue-slime",
    "wetland-light-green-slime",
    "wetland-green-slime",
    "wetland-light-dead-skin",
    "wetland-dead-skin",
    "wetland-pink-tentacle",
    "wetland-red-tentacle",
    "lowland-brown-blubber",
    "lowland-olive-blubber",
    "lowland-olive-blubber-2",
    "lowland-olive-blubber-3",
    "lowland-pale-green",
    "lowland-cream-cauliflower",
    "lowland-cream-cauliflower-2",
    "lowland-dead-skin",
    "lowland-dead-skin-2",
    "lowland-cream-red",
    "lowland-red-vein",
    "lowland-red-vein-2",
    "lowland-red-vein-3",
    "lowland-red-vein-4",
    "lowland-red-vein-dead",
    "lowland-red-infection",
    "midland-turquoise-bark",
    "midland-turquoise-bark-2",
    "midland-cracked-lichen",
    "midland-cracked-lichen-dull",
    "midland-cracked-lichen-dark",
    "midland-yellow-crust",
    "midland-yellow-crust-2",
    "midland-yellow-crust-3",
    "midland-yellow-crust-4",
}

for _, environment in pairs(vgal.defines.environments) do
    data.raw["planet"]["gleba"].map_gen_settings.autoplace_settings.entity.settings[environment.garden] = {}

    local garden_entity = data.raw["tree"][environment.garden]

    garden_entity.autoplace.tile_restriction = vgal.table.merge_array(garden_entity.autoplace.tile_restriction, gleba_garden_tiles)

    -- garden_entity.autoplace.tile_restriction
end


-- local function get_autoplaced_tiles(planet_name)
--     local result = {}

--     for tile_name, _ in pairs(data.raw.planet[planet_name].map_gen_settings.autoplace_settings["tile"].settings) do
--         table.insert(result, tile_name)
--     end

--     return result
-- end

-- error(serpent.block(get_autoplaced_tiles("gleba")))

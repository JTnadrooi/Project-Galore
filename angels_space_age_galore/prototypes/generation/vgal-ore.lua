local fissure_planet_names = { "gleba" }
local mineralized_water_fluid = data.raw["fluid"]["angels-water-mineralized"]

for _, planet_name in ipairs(fissure_planet_names) do
    angelsmods.functions.add_resource("make", {
        name = "vgal-" .. planet_name .. "-fissure",
        -- commentedbc; doesn't work, even without the overriden fields
        -- get = "angels-fissure",
        subgroup = "mineable-fluids",
        order = "c",
        sheet = 1,
        infinite = true,
        glow = true,
        var = 1,
        map_color = mineralized_water_fluid.base_color,
        tint = mineralized_water_fluid.flow_color,
        mining_time = 2.5,
        type = "fluid",
        category = "angels-fissure",
        -- normal = 10000,
        -- maximum = 50000,
        output_name = "angels-water-mineralized",
        output_min = 20,
        output_max = 20,
        icon = "__angelsrefininggraphics__/graphics/icons/fissure.png",
        icon_size = 64,
        autoplace = {
            starting_area = true, -- og; false
            base_density = 3,
            regular_rq_factor_multiplier = 1,
            starting_rq_factor_multiplier = 1,
            base_spots_per_km2 = 1.8,
            random_probability = 1 / 48,
            random_spot_size_minimum = 1,
            random_spot_size_maximum = 1,
            additional_richness = 2500,
        },

        planets = { planet_name }
    })
end

angelsmods.functions.make_resource()

-- after prototypes exist, override localisation
-- (get field) doesn't work
for _, planet_name in ipairs(fissure_planet_names) do
    local fissure_name = "vgal-" .. planet_name .. "-fissure"
    local resource = data.raw.resource[fissure_name]
    if resource then
        resource.localised_name = { "entity-name.angels-fissure" }
        resource.localised_description = { "entity-description.angels-fissure" }
    end

    data.raw["autoplace-control"][fissure_name].localised_name = { "", "[entity=angels-fissure] ", { "entity-name.angels-fissure" } }
end

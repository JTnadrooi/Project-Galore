vgal.data.extend({
    {
        type = "recipe",
        name = "sulfur-ammonia-nutrients", -- for nauvis / aquilo
        prefix = "vgal",
        icons = vgal.icon.register {
            -- vgal.icon.get_in("sulfur"),
            -- vgal.icon.get_overlay("nutrients"),
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/sulfur-ammonia-nutrients.png"),
        },
        category = "organic-or-assembling",
        energy_required = 1,
        technology = "agriculture",
        fluid_ingredients = {
            { "ammonia", 25 }, -- 50
        },
        ingredients = {
            { "sulfur", 1 }, -- 15 (20gb)
        },
        results = {
            { "nutrients", 10 }, -- 100
        },
    },
    {
        type = "recipe",
        name = "pentapod-egg-bioflux-stone",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("pentapod-egg"),
            vgal.icon.get_out_to("stone"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 45,
        technology = "biochamber",
        ingredients = {
            { "pentapod-egg", 1 }, -- 200
            { "bioflux",      2 }, -- 120
        },
        results = {
            { "stone", nil, { amount_min = 10, amount_max = 30 } }, -- 200 * 1.5 = 300
        },
        show_amount_in_title = false,
        surface_conditions =
        {
            {
                property = "pressure",
                min = 2000,
                max = 2000,
            }
        },
    },
    {
        type = "recipe",
        name = "raw-fish-bioflux",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("bioflux"),
            vgal.icon.get_in("raw-fish"),
        },
        category = "cryogenics",
        energy_required = 8,
        technology = "cryogenic-plant",
        fluid_ingredients = {
            { "fluoroketone-cold", 20 },
        },
        ingredients = {
            { "raw-fish",  1 },  -- 530
            { "nutrients", 20 }, -- 160
        },
        results = {
            { "bioflux", 5 },
        },
        fluid_results = {
            { "fluoroketone-hot", 15, { temperature = 180 } },
        },
        localised_name = { "", "5 \xC3\x97 ", { "recipe-name.vgal-raw-fish-bioflux" } },
    },
    {
        type = "recipe",
        name = "ammoniacal-solution-raw-fish",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("fish-breeding", "recipe"),
            vgal.icon.get_in_fluid("ammoniacal-solution"),
        },
        category = "organic",
        energy_required = 6,
        technology = "planet-discovery-aquilo",
        fluid_ingredients = {
            { "ammoniacal-solution", 100 },
        },
        ingredients = {
            { "nutrients", 30 },
            { "raw-fish",  2 },
        },
        results = {
            { "raw-fish", nil, { amount_min = 1, amount_max = 6, ignored_by_stats = 2, ignored_by_productivity = 2 } },
        },
        show_amount_in_title = false,
    },
    {
        type = "recipe",
        name = "spoilage-sulfuric-acid-carbon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("carbon"),
            vgal.icon.get_in("spoilage"),
            vgal.icon.get_in2("sulfuric-acid"),
        },
        category = "organic",
        energy_required = 12,
        technology = "biochamber",
        fluid_ingredients = {
            { "sulfuric-acid", 5 },
        },
        ingredients = {
            { "spoilage", 3 },
        },
        results = {
            { "carbon", 1 },
        },
        order = "b[chemistry]-f[carbon]-b",
        show_amount_in_title = false,
    },
    {
        type = "recipe",
        name = "wood-carbon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("wood"),
            vgal.icon.get_out_to("carbon"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 8,
        technology = "biochamber",
        ingredients = {
            { "wood", 6 },
        },
        results = {
            { "carbon", 1 }, -- 50 * 1.5 = 75
        },
        fluid_results = {
            { "water", 10 },
        },
        groups = { "vgal-wood-recipes" },
        order = "b[chemistry]-f[carbon]-c",
        show_amount_in_title = false,
    },
    {
        type = "recipe",
        name = "jelly-sulfur-lubricant",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("lubricant"),
            vgal.icon.get_in_fluid("sulfur"),
            vgal.icon.get_in_fluid2("jelly"),
        },
        category = "organic",
        energy_required = 1,
        technology = "bioflux-processing",
        fluid_ingredients = {
            { "water", 30 },
        },
        ingredients = {
            { "jelly",  12 }, -- 72
            { "sulfur", 1 },  -- 15
        },
        fluid_results = {
            { "lubricant", 20 }, -- (1.5)=60
        },
    },
    {
        name = "jelly-crude-oil-solid-fuel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("solid-fuel"),
            vgal.icon.get_in("jelly"),
            -- vgal.icon.get_in2("crude-oil"),
        },
        energy_required = 3,
        technology = "jellynut",
        fluid_ingredients = {
            { "crude-oil", 6 }, -- ~2
        },
        ingredients = {
            { "jelly", 4 }, -- 24
        },
        results = {
            { "solid-fuel", 1 }, -- 20 * 1.5 = 30
        },
        category = "organic",
    },
}, {
    type = "recipe",
})

for _, metal in ipairs(vgal.constants.METALS) do
    local bacteria = metal .. "-bacteria"
    local other_bacteria = (metal == "iron" and "copper" or "iron") .. "-bacteria"
    local order_base = metal == "iron" and "a" or "b"
    vgal.data.extend({
        {
            type = "recipe",
            name = other_bacteria .. "-" .. bacteria,
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get_in_to(other_bacteria),
                vgal.icon.get_out_to(bacteria),
                vgal.icon.get_overlay("to"),
            },
            category = "organic",
            energy_required = 60,
            technology = { "bacteria-cultivation", "uranium-processing" },
            ingredients = {
                { other_bacteria, 1 },
                { "uranium-235",  1, { ignored_by_stats = 1 } },
            },
            results = {
                { bacteria,      1 },
                { "uranium-235", 1, { probability = 0.6, ignored_by_stats = 1, show_details_in_recipe_tooltip = false } },
                { "uranium-238", 1, { probability = 0.4, show_details_in_recipe_tooltip = false } },
            },
            allow_productivity = false,
            show_amount_in_title = false,
            result_is_always_fresh = true,
            order = order_base .. "xb"
        },
        {
            type = "recipe",
            name = "uranium-235-" .. bacteria,
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get(bacteria .. "-cultivation", "recipe"),
                vgal.icon.get_in_fluid("uranium-235"),
            },
            category = "organic",
            energy_required = 8,
            technology = { "bacteria-cultivation", "uranium-processing" },
            ingredients = {
                { bacteria,      1, { ignored_by_stats = 1 } }, -- 12
                { "bioflux",     1 },                           -- 60
                { "uranium-235", 1, { ignored_by_stats = 1 } }, -- 700
            },
            results = {
                { bacteria,      10, { ignored_by_stats = 1 } },                                                                                          -- r180
                { "uranium-235", 1,  { probability = 0.98, ignored_by_stats = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false } }, -- 686
                { "uranium-238", 1,  { probability = 0.02, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false } },                       -- 4
            },
            show_amount_in_title = false,
            result_is_always_fresh = true,
            groups = { "vgal-unsure" },
            order = order_base .. "b",
            surface_conditions =
            {
                {
                    property = "pressure",
                    min = 2000,
                    max = 2000,
                }
            },
        },
        {
            type = "recipe",
            name = "ammoniacal-solution-" .. bacteria,
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get(bacteria .. "-cultivation", "recipe"),
                vgal.icon.get_in_fluid("ammoniacal-solution"),
            },
            category = "organic",
            energy_required = 8,
            technology = "planet-discovery-aquilo",
            fluid_ingredients = {
                { "ammoniacal-solution", 50 },
            },
            ingredients = {
                { bacteria,  1, { ignored_by_stats = 1 } },
                { "bioflux", 1 },
            },
            results = {
                { bacteria, 8, { ignored_by_stats = 1 } },
            },
            show_amount_in_title = false,
            result_is_always_fresh = true,
            groups = { "vgal-unsure" },
            order = order_base .. "c",
        },
    }, {
        type = "recipe",
    })
end

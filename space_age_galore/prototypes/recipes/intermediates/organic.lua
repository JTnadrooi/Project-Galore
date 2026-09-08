vgal.extend({
    {
        type = "recipe",
        name = "sulfur-ammonia-nutrients", -- for nauvis / aquilo
        prefix = "vgal",
        icons = vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/sulfur-ammonia-nutrients.png"),
        categories = { "crafting", "organic" },
        energy_required = 1,
        technology = "agriculture",
        ingredients = {
            { "ammonia", 25 }, -- 50
            { "sulfur",  1 },  -- 15 (20gb)
        },
        results = {
            { "nutrients", 10 }, -- 100
        },
    },
    {
        type = "recipe",
        name = "pentapod-egg-bioflux-stone",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "arrow",
            inputs = { "pentapod-egg" },
            outputs = { "stone" },
        }),
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
        icons = vgal.icon.merge_composites({
            vgal.icon.get("bioflux"),
            vgal.icon.get_in("raw-fish"),
        }),
        category = "cryogenics",
        energy_required = 8,
        technology = "cryogenic-plant",
        ingredients = {
            { "raw-fish",          1 },  -- 530
            { "nutrients",         20 }, -- 160
            { "fluoroketone-cold", 20 },
        },
        results = {
            { "bioflux",          5 },
            { "fluoroketone-hot", 15, { temperature = 180 } },
        },
    },
    {
        type = "recipe",
        name = "ammoniacal-solution-raw-fish",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("fish-breeding", "recipe"),
            vgal.icon.shift(vgal.icon.get("ammoniacal-solution"), 0.7, { 0, -6.5 })
        }),
        category = "organic",

        energy_required = 6,
        technology = "planet-discovery-aquilo",
        ingredients = {
            { "ammoniacal-solution", 100 },
            { "nutrients",           30 },
            { "raw-fish",            2 },
        },
        results = {
            { "raw-fish", nil, { amount_min = 1, amount_max = 6, reset_freshness_on_craft = true, } },
        },
    },
    {
        type = "recipe",
        name = "spoilage-sulfuric-acid-carbon",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("carbon"),
            vgal.icon.get_in("spoilage"),
            vgal.icon.get_in2("sulfuric-acid"),
        }),
        category = "organic",
        energy_required = 12,
        technology = "biochamber",
        ingredients = {
            { "sulfuric-acid", 5 },
            { "spoilage",      3 },
        },
        results = {
            { "carbon", 1 },
        },
        order = "b[chemistry]-f[carbon]-b",
    },
    {
        type = "recipe",
        name = "wood-carbon",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "arrow",
            inputs = { "wood" },
            outputs = { "carbon" },
        }),
        category = "organic",
        energy_required = 8,
        technology = "biochamber",
        ingredients = {
            { "wood", 6 },
        },
        results = {
            { "carbon", 1 }, -- 50 * 1.5 = 75
            { "water",  10 },
        },
        groups = { "vgal-wood-recipes" },
        order = "b[chemistry]-f[carbon]-c",
    },
    {
        type = "recipe",
        name = "jelly-sulfur-lubricant",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "fluid",
            inputs = { "sulfur", "jelly" },
            outputs = { "lubricant" },
        }),
        category = "organic",
        energy_required = 1,
        technology = "bioflux-processing",
        ingredients = {
            { "water",  30 },
            { "jelly",  12 }, -- 72
            { "sulfur", 1 },  -- 15
        },
        results = {
            { "lubricant", 20 }, -- (1.5)=60
        },
    },
    {
        name = "jelly-crude-oil-solid-fuel",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("solid-fuel"),
            vgal.icon.get_in("jelly"),
            -- vgal.icon.get_in2("crude-oil"),
        }),
        energy_required = 3,
        technology = "jellynut",
        ingredients = {
            { "crude-oil", 6 }, -- ~2
            { "jelly",     4 }, -- 24
        },
        results = {
            { "solid-fuel", 1 }, -- 20 * 1.5 = 30
        },
        category = "organic",
    },
}, {
    type = "recipe",
})

for _, metal in pairs(vgal.defines.metals) do
    local other_bacteria = (metal.name == "iron" and "copper" or "iron") .. "-bacteria"
    local order_base = metal.name == "iron" and "a" or "b"
    vgal.extend({
        {
            type = "recipe",
            name = other_bacteria .. "-" .. metal.bacteria,
            prefix = "vgal",
            icons = vgal.icon.create({
                style = "arrow",
                inputs = { other_bacteria },
                outputs = { metal.bacteria },
            }),
            category = "organic",
            energy_required = 60,
            technology = { "bacteria-cultivation", "uranium-processing" },
            ingredients = {
                { other_bacteria, 1 },
                { "uranium-235",  1, { ignored_by_stats = 1 } },
            },
            results = {
                { metal.bacteria, 1, { always_fresh = true } },
                { "uranium-235",  1, { independent_probability = 0.6, ignored_by_stats = 1, show_details_in_recipe_tooltip = false } },
                { "uranium-238",  1, { independent_probability = 0.4, show_details_in_recipe_tooltip = false } },
            },
            allow_productivity = false,
            show_amount_in_title = false,
            order = order_base .. "xba",
            groups = { "vgal-removed" }, -- I'm sorry for that one player using this for q5, I forgot about the internal prod boost..
        },
        {
            type = "recipe",
            name = other_bacteria .. "-" .. metal.bacteria .. "-centrifuging",
            prefix = "vgal",
            icons = vgal.icon.create({
                style = "arrow",
                inputs = { other_bacteria },
                outputs = { metal.bacteria },
            }),
            category = "centrifuging",
            energy_required = 30,
            technology = { "bacteria-cultivation", "uranium-processing" },
            ingredients = {
                { other_bacteria, 1 },
                { "uranium-235",  1, { ignored_by_stats = 1 } },
            },
            results = {
                { metal.bacteria, 1, { always_fresh = true } },
                { "uranium-235",  1, { independent_probability = 0.6, ignored_by_stats = 1, show_details_in_recipe_tooltip = false } },
                { "uranium-238",  1, { independent_probability = 0.4, show_details_in_recipe_tooltip = false } },
            },
            allow_productivity = false,
            show_amount_in_title = false,
            order = order_base .. "xbb",
        },
        {
            type = "recipe",
            name = "uranium-235-" .. metal.bacteria,
            prefix = "vgal",
            icons = vgal.icon.merge_composites({
                vgal.icon.get(metal.bacteria .. "-cultivation", "recipe"),
                vgal.icon.shift(vgal.icon.get("uranium-235"), 0.7, { 0, -6.5 }),
            }),
            category = "organic",
            energy_required = 8,
            technology = { "bacteria-cultivation", "uranium-processing" },
            ingredients = {
                { metal.bacteria, 1, { ignored_by_stats = 1 } }, -- 12
                { "bioflux",      1 },                           -- 60
                { "uranium-235",  1, { ignored_by_stats = 1 } }, -- 700
            },
            results = {
                { metal.bacteria, 10, { ignored_by_stats = 1, always_fresh = true } },                                                                                 -- r180
                { "uranium-235",  1,  { independent_probability = 0.98, ignored_by_stats = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false } }, -- 686
                { "uranium-238",  1,  { independent_probability = 0.02, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false } },                       -- 4
            },
            show_amount_in_title = false,
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
            name = "ammoniacal-solution-" .. metal.bacteria,
            prefix = "vgal",
            icons = vgal.icon.merge_composites({
                vgal.icon.get(metal.bacteria .. "-cultivation", "recipe"),
                vgal.icon.shift(vgal.icon.get("ammoniacal-solution"), 0.7, { 0, -6.5 }),
            }),
            category = "organic",
            energy_required = 8,
            technology = "planet-discovery-aquilo",
            ingredients = {
                { "ammoniacal-solution", 50 },
                { metal.bacteria,        1, { ignored_by_stats = 1 } },
                { "bioflux",             1 },
            },
            results = {
                { metal.bacteria, 8, { ignored_by_stats = 1, always_fresh = true } },
            },
            show_amount_in_title = false,
            groups = { "vgal-unsure" },
            order = order_base .. "c",
        },
    }, {
        type = "recipe",
    })
end

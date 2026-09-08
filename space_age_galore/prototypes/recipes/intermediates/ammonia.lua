vgal.extend({
    {
        type = "recipe",
        name = "iron-bacteria-ammonia",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "arrow",
            inputs = { "iron-bacteria" },
            outputs = { "ammonia" },
        }),
        category = "organic",
        energy_required = 6,
        technology = "bacteria-cultivation",
        ingredients = {
            { "iron-bacteria", 4 },  -- 120
            { "nutrients",     10 }, -- 100
        },
        results = {
            { "ammonia", 80 }, -- 160 * 1.5 = 240
        },
        surface_conditions =
        {
            {
                property = "pressure",
                min = 10,
            }
        },
    },
    {
        type = "recipe",
        name = "copper-bacteria-ammonia",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "arrow",
            inputs = { "copper-bacteria" },
            outputs = { "ammonia" },
        }),
        category = "organic",
        energy_required = 4,
        technology = "bacteria-cultivation",
        ingredients = {
            { "copper-bacteria", 2 }, -- 60
            { "nutrients",       8 }, -- 80
        },
        results = {
            { "ammonia", 50 }, -- 100 * 1.5 = 150
        },
        surface_conditions =
        {
            {
                property = "pressure",
                min = 10,
            }
        },
    },
    {
        type = "recipe",
        name = "biter-egg-ammonia",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "arrow",
            inputs = { "biter-egg" },
            outputs = { "ammonia" },
        }),
        category = "organic",
        energy_required = 10,
        technology = "captivity",
        ingredients = {
            { "biter-egg", 1 }, -- 80
            { "nutrients", 8 }, -- 80
        },
        results = {
            { "ammonia", 80 }, -- 160 * 1.5 = 240
        },
        surface_conditions =
        {
            {
                property = "pressure",
                min = 10,
            }
        },
    },
    {
        type = "recipe",
        name = "water-coal-ammonia",
        prefix = "vgal",
        icons = vgal.icon.get("ammonia"),
        categories = { "organic", "chemistry" },
        energy_required = 1,
        technology = "oil-processing",
        ingredients = {
            { "water", 100 }, -- 1 (50vn) so no vulcanus
            { "coal",  2 },   -- 20
        },
        results = {
            { "ammonia", 10 } -- 20 (50vn)
        },
        order = "b-e-bb",
        surface_conditions =
        {
            {
                property = "pressure",
                min = 10,
                -- max = 3999,
            }
        },
    },
    {
        name = "calcite-sulfuric-acid-ammonia",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "arrow",
            inputs = { "calcite", "sulfuric-acid" },
            outputs = { "ammonia" },
        }),
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            { "sulfuric-acid", 50 },
            { "calcite",       2 }, -- 20
            { "carbon",        5 }, -- 30
        },
        results = {
            { "ammonia", 20 }, -- 100vu
        },
        technology = "calcite-processing",
        surface_conditions =
        {
            {
                property = "pressure",
                min = 4000,
                max = 4000,
            }
        },
        groups = { "vgal-convoluted" },
    },
    {
        name = "ice-solid-fuel-ammonia",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "arrow",
            inputs = { "ice", "solid-fuel" },
            outputs = { "ammonia" },
        }),
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            { "solid-fuel", 1 },
            { "ice",        3 },
        },
        results = {
            { "ammonia", 20 },
            { "water",   10, { show_details_in_recipe_tooltip = false } },
        },
        technology = "planet-discovery-fulgora",
        surface_conditions =
        {
            {
                property = "pressure",
                min = 800,
                max = 800
            }
        },
        groups = { "vgal-convoluted" },
    },
}, {
    type = "recipe",
})

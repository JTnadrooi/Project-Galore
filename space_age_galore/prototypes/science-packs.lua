vgal.data.extend({
    -- SPACE
    {
        name = "uranium-235-space-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("space-science-pack"),
            vgal.icon.get_in("uranium-235"),
        },
        category = "crafting",
        energy_required = 100,
        technology = { "space-science-pack", "uranium-processing" },
        ingredients = {
            { "steel-plate", 2 }, -- 100
            { "ice",         2 }, -- 100
            { "carbon",      2 }, -- 100
            { "uranium-235", 1 }, -- 700
        },
        results = {
            { "space-science-pack", 50 },
        },
        surface_conditions =
        {
            {
                property = "gravity",
                min = 0,
                max = 0
            }
        },
        groups = { "vgal-unsure" },
    },

    -- AGRICULTURAL
    {
        name = "ammonia-agricultural-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("agricultural-science-pack"),
            vgal.icon.get_in("ammonia"),
        },
        category = "organic",
        energy_required = 8,
        technology = "agricultural-science-pack",
        ingredients = {
            { "pentapod-egg", 1 }, -- 200
            { "bioflux",      4 }, -- 240
        },
        fluid_ingredients = {
            { "ammonia", 80 }, -- 160
        },
        results = {
            { "agricultural-science-pack", 2 }, -- 400 * 1.5 = 600
        },
        surface_conditions =
        {
            {
                property = "pressure",
                min = 2000,
                max = 2000
            }
        },
    },

    -- METALLURGIC
    {
        name = "big-mining-drill-calcite-metallurgic-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("metallurgic-science-pack"),
            vgal.icon.get_in("big-mining-drill"),
        },
        category = "metallurgy",
        energy_required = 8,
        technology = "metallurgic-science-pack",
        ingredients = {
            { "big-mining-drill", 1 }, -- 2730
            { "tungsten-plate",   2 }, -- 120
            { "calcite",          5 }, -- 50
        },
        results = {
            { "metallurgic-science-pack", 8 }, -- 2880 * 1.5 = 4320
        },
        surface_conditions =
        {
            {
                property = "pressure",
                min = 4000,
                max = 4000
            }
        },
    },

    -- ELECTROMAGNETIC

    -- CRYOGENIC

    -- PROMETHIUM
}, {
    groups = { "vgal-science-packs" }
})

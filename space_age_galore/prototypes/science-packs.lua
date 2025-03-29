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
            { "bioflux",      3 }, -- 180
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
    {
        name = "sulfur-petroleum-gas-agricultural-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("agricultural-science-pack"),
            vgal.icon.get_in("sulfur"),
        },
        category = "organic",
        energy_required = 4,
        technology = "agricultural-science-pack",
        ingredients = {
            { "sulfur",    4 },  -- 80gb
            { "nutrients", 10 }, -- 100
        },
        fluid_ingredients = {
            { "petroleum-gas", 50 }, -- 50
        },
        results = {
            { "agricultural-science-pack", 1 }, -- 200 * 1.5 = 300
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
    -- {
    --     name = "carbon-fiber-agricultural-science-pack",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("agricultural-science-pack"),
    --         vgal.icon.get_in("carbon-fiber"),
    --     },
    --     category = "organic",
    --     energy_required = 5,
    --     technology = "carbon-fiber",
    --     ingredients = {
    --         { "carbon-fiber", 1 }, -- 120gb
    --         { "bioflux",      3 }, -- 180
    --     },
    --     results = {
    --         { "agricultural-science-pack", 1 }, -- 200 * 1.5 = 300
    --     },
    --     surface_conditions =
    --     {
    --         {
    --             property = "pressure",
    --             min = 2000,
    --             max = 2000
    --         }
    --     },
    -- },
    {
        name = "electronic-circuit-agricultural-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("agricultural-science-pack"),
            vgal.icon.get_in("electronic-circuit"),
        },
        category = "organic",
        energy_required = 4,
        technology = "carbon-fiber",
        ingredients = {
            { "pentapod-egg",       1 }, -- 200
            { "electronic-circuit", 4 }, -- 100
        },
        results = {
            { "agricultural-science-pack", 1 }, -- 200 * 1.5 = 300
        },
        surface_conditions =
        {
            {
                property = "pressure",
                min = 2000,
                max = 2000
            }
        },
        groups = { "vgal-unsure" },
    },
    {
        name = "biter-egg-agricultural-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("agricultural-science-pack"),
            vgal.icon.get_in("biter-egg"),
        },
        category = "organic",
        energy_required = 45,
        technology = "carbon-fiber",
        fluid_ingredients = {
            { "light-oil", 20 },
        },
        ingredients = {
            { "biter-egg",  1 }, -- 200
            { "explosives", 8 }, -- 920
        },
        results = {
            { "agricultural-science-pack", 10 }, -- 2000 * 1.5 = 3000
        },
        surface_conditions =
        {
            {
                property = "pressure",
                min = 2000,
                max = 2000
            }
        },
        groups = { "vgal-unsure" },
    },
    -- {
    --     name = "superconductor-agricultural-science-pack",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("agricultural-science-pack"),
    --         vgal.icon.get_in("superconductor"),
    --     },
    --     category = "organic",
    --     energy_required = 4,
    --     technology = "agricultural-science-pack",
    --     ingredients = {
    --         { "superconductor", 1 },  --
    --         { "jelly",          12 }, --
    --     },
    --     fluid_ingredients = {
    --         { "light-oil", 30 }, --
    --     },
    --     results = {
    --         { "agricultural-science-pack", 1 }, -- 200 * 1.5 = 300
    --     },
    --     surface_conditions =
    --     {
    --         {
    --             property = "pressure",
    --             min = 2000,
    --             max = 2000
    --         }
    --     },
    --     groups = { "vgal-unsure" }
    -- },

    -- METALLURGIC
    {
        name = "big-mining-drill-calcite-metallurgic-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("metallurgic-science-pack"),
            vgal.icon.get_in("big-mining-drill"),
        },
        category = "metallurgy",
        energy_required = 60,
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

    -- OTHER
    {
        name = "pentapod-egg-biter-egg-military-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("military-science-pack"),
            vgal.icon.get_in("biter-egg"),
            vgal.icon.get_in2("pentapod-egg"),
        },
        category = "crafting",
        energy_required = 30,
        technology = "captivity",
        ingredients = {
            { "biter-egg",    2 }, -- 200
            { "pentapod-egg", 1 }, -- 700
        },
        results = {
            { "military-science-pack", 6 }, -- 1260
        },
    },
}, {
    type = "recipe",
    groups = { "vgal-science-packs" }
})

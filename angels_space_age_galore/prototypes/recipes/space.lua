vgal.extend({
    -- {
    --     type = "recipe",
    --     name = "oxide-asteroid-chunk-angels-gas-nitrogen",
    --     prefix = "vgal",
    --     icons = vgal.icon.create({
    --         style   = "angels-gas",
    --         inputs  = { "oxide-asteroid-chunk" },
    --         outputs = { "angels-gas-nitrogen" },
    --         core    = "gas",
    --         palette = "NNN",
    --     }),
    --     category = "angels-liquifying",
    --     energy_required = 2,
    --     technology = "advanced-asteroid-processing",
    --     ingredients = {
    --         { "oxide-asteroid-chunk", 1 },
    --     },
    --     results = {
    --         { "angels-gas-nitrogen",  20 },
    --         { "oxide-asteroid-chunk", 1, { independent_probability = 0.3, ignored_by_stats = 1, } },
    --     },
    --     subgroup = "vgal-space-advanced",
    --     order = "g",
    --     productivity_technology = "asteroid-productivity",
    --     enable_smart_stats = false,
    --     enable_smart_productivity = false,
    --     allow_productivity = true,
    -- },
    {
        type = "recipe",
        name = "metallic-asteroid-chunk-angels-ore2-angels-ore3",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-sorting",
            inputs = { "metallic-asteroid-chunk", "angels-catalysator-brown" },
            outputs = { "angels-ore2", "angels-ore3" },
        }),
        category = "crushing",
        energy_required = 10,
        technology = "advanced-asteroid-processing",
        ingredients = {
            { "metallic-asteroid-chunk",  1 },
            { "angels-catalysator-brown", 1 },
        },
        results = {
            { "angels-ore3",             3 },
            { "angels-ore2",             3 },
            { "metallic-asteroid-chunk", 1, { independent_probability = 0.1, ignored_by_stats = 1, } },
        },
        subgroup = "vgal-space-advanced",
        order = "aa",
        productivity_technology = "asteroid-productivity",
        enable_smart_stats = false,
        enable_smart_productivity = false,
        allow_productivity = true,
    },
    -- {
    --     name = "angels-gas-fluorine-thruster-oxidizer",
    --     prefix = "vgal",
    --     energy_required = 5,
    --     technology = "cryogenic-plant",
    --     ingredients = {
    --         { "angels-gas-fluorine", 20 },
    --     },
    --     results = {
    --         { "thruster-oxidizer", 350 },
    --     },
    --     category = "chemistry",
    -- },
    -- {
    --     name = "angels-gas-ammonia-thruster-fuel",
    --     prefix = "vgal",
    --     energy_required = 6,
    --     technology = "advanced-asteroid-processing",
    --     ingredients = {
    --         { "angels-gas-ammonia", 20 },
    --         { "angels-gas-propene", 20 },
    --     },
    --     results = {
    --         { "thruster-fuel", 1500 },
    --     },
    --     category = "chemistry",
    -- },
    {
        name = "angels-gas-carbon-monoxide-thruster-fuel",
        prefix = "vgal",
        energy_required = 3,
        technology = "space-platform-thruster",
        ingredients = {
            { "angels-gas-carbon-monoxide", 20 },
        },
        results = {
            { "thruster-fuel", 150 },
        },
        order = "bab",
        category = "chemistry",
    },
    {
        name = "angels-gas-synthesis-thruster-fuel",
        prefix = "vgal",
        energy_required = 4,
        technology = "space-platform-thruster",
        ingredients = {
            { "angels-gas-synthesis", 20 },
        },
        results = {
            { "thruster-fuel", 350 },
        },
        order = "bac",
        category = "chemistry",
    },
    {
        name = "angels-gas-ammonia-thruster-fuel",
        prefix = "vgal",
        energy_required = 6,
        technology = "advanced-asteroid-processing",
        ingredients = {
            { "angels-gas-ammonia", 20 },
        },
        results = {
            { "thruster-fuel", 500 },
        },
        category = "chemistry",

        order = "bad"
    },
    {
        name = "angels-liquid-polyethylene-thruster-fuel",
        prefix = "vgal",
        energy_required = 25,
        technology = "advanced-asteroid-processing",
        ingredients = {
            { "angels-liquid-polyethylene", 20 },
            { "solid-fuel",                 1 }, -- acts as the paraffin wax
        },
        results = {
            { "thruster-fuel", 5000 },
        },
        category = "chemistry",

        order = "bae",
        groups = { "vgal-convoluted" },
    },
    -- {
    --     name = "angels-gas-methanol-thruster-fuel",
    --     prefix = "vgal",
    --     energy_required = 5,
    --     technology = "advanced-asteroid-processing",
    --     ingredients = {
    --         { "angels-gas-methanol", 20 },
    --     },
    --     results = {
    --         { "thruster-fuel", 350 },
    --     },
    --     category = "chemistry",
    -- },
    -- {
    --     name = "angels-gas-ethanol-thruster-fuel",
    --     prefix = "vgal",
    --     energy_required = 5,
    --     technology = "advanced-asteroid-processing",
    --     ingredients = {
    --         { "angels-gas-ethanol",    20 },
    --         { "angels-water-purified", 10 },
    --     },
    --     results = {
    --         { "thruster-fuel", 350 },
    --     },
    --     category = "chemistry",
    -- },
    -- {
    --     name = "angels-gas-propene-thruster-fuel",
    --     prefix = "vgal",
    --     energy_required = 5,
    --     technology = "advanced-asteroid-processing",
    --     ingredients = {
    --         { "angels-gas-propene", 20 },
    --     },
    --     results = {
    --         { "thruster-fuel", 350 },
    --     },
    --     category = "chemistry",
    -- },
    -- {
    --     name = "angels-gas-carbon-monoxide-thruster-fuel",
    --     prefix = "vgal",
    --     energy_required = 4,
    --     technology = "space-platform-thruster",
    --     ingredients = {
    --         { "angels-gas-carbon-monoxide", 20 },
    --         { "angels-gas-hydrogen",        10 },
    --     },
    --     results = {
    --         { "thruster-fuel", 250 },
    --     },
    --     category = "chemistry",
    -- },
    -- {
    --     name = "angels-gas-chlorine-angels-gas-oxygen-thruster-oxidizer",
    --     prefix = "vgal",
    --     energy_required = 5,
    --     technology = "advanced-asteroid-processing",
    --     ingredients = {
    --         { "angels-gas-chlorine", 20 },
    --         { "angels-gas-oxygen",   20 },
    --     },
    --     results = {
    --         { "thruster-oxidizer", 350 },
    --     },
    --     category = "chemistry",
    -- },
    -- {
    --     name = "angels-gas-ammonia-thruster-fuel",
    --     prefix = "vgal",
    --     energy_required = 5,
    --     technology = "advanced-asteroid-processing",
    --     ingredients = {
    --         { "angels-gas-ammonia", 20 },
    --     },
    --     results = {
    --         { "thruster-fuel", 350 },
    --     },
    --     category = "chemistry",
    -- },
    {
        name = "angels-gas-chlorine-thruster-oxidizer",
        prefix = "vgal",
        energy_required = 4,
        technology = "space-platform-thruster",
        ingredients = {
            { "angels-gas-chlorine", 20 },
        },
        results = {
            { "thruster-oxidizer", 250 },
        },
        order = "cab",
        category = "chemistry",
    },
}, {
    type = "recipe",
})

vgal.data.extend({
    -- {
    --     name = "copper-plate-inserter",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("inserter"),
    --         vgal.icon.get_in("copper-plate"),
    --     },
    --     technology = "electronics",
    --     energy_required = 1,
    --     ingredients = {
    --         { "electronic-circuit", 2 }, -- 50
    --         { "copper-cable",       6 }, -- 30
    --         { "copper-plate",       1 }, -- 10
    --     },
    --     results = {
    --         { "inserter", 2 }, -- 110
    --     },
    -- },
    -- {
    --     name = "advanced-circuit-fast-inserter",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("fast-inserter"),
    --         vgal.icon.get_in("advanced-circuit"),
    --     },
    --     technology = "advanced-circuit",
    --     energy_required = 1,
    --     ingredients = {
    --         { "advanced-circuit", 1 }, -- 100
    --         { "iron-gear-wheel",  1 }, -- 20
    --         { "inserter",         2 }, -- 110
    --     },
    --     results = {
    --         { "fast-inserter", 2 }, -- 230
    --     },
    -- },
    {
        name = "processing-unit-bulk-inserter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("bulk-inserter"),
            vgal.icon.get_in("processing-unit"),
        },
        technology = { "bulk-inserter", "processing-unit" },
        energy_required = 1,
        ingredients = {
            { "iron-gear-wheel", 2 }, -- 40
            { "fast-inserter",   1 }, -- 125
            { "processing-unit", 1 }, -- 710
        },
        results = {
            { "bulk-inserter", 1 }, -- 900
        },
    },
    {
        name = "engine-unit-burner-inserter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("burner-inserter"),
            vgal.icon.get_in("engine-unit"),
        },
        technology = "engine",
        energy_required = 2,
        ingredients = {
            { "engine-unit", 1 }, -- 90
            { "iron-plate",  2 }, -- 20
        },
        results = {
            { "burner-inserter", 4 }, -- 120
        },
        groups = { "vgal-convoluted" },
    },
}, {
    groups = { "vgal-buildings" }
})

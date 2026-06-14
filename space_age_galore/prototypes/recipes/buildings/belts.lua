vgal.data.extend({
    {
        name = "plastic-bar-turbo-transport-belt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("turbo-transport-belt"),
            vgal.icon.get_in("plastic-bar"),
        },
        energy_required = 1,
        technology = "turbo-transport-belt",
        ingredients = {
            { "plastic-bar",            8 }, -- 120
            { "tungsten-plate",         2 }, -- -180
            { "express-transport-belt", 1 },
        },
        fluid_ingredients = {
            { "lubricant", 25 }, -- +10
        },
        results = {
            { "turbo-transport-belt", 1 },
        },
        category = "metallurgy",
        order = "abb",
        surface_conditions =
        {
            {
                property = "pressure",
                min = 4000,
                max = 4000
            }
        },
    },
    {
        name = "low-density-structure-turbo-transport-belt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("turbo-transport-belt"),
            vgal.icon.get_in("low-density-structure"),
        },
        energy_required = 2,
        technology = "turbo-transport-belt",
        ingredients = {
            { "low-density-structure",  1 }, -- +365
            { "tungsten-plate",         2 }, -- -480
            { "express-transport-belt", 2 },
        },
        fluid_ingredients = {
            { "lubricant", 5 }, -- -30
        },
        results = {
            { "turbo-transport-belt", 2 },
        },
        category = "metallurgy",
        order = "abc",
        surface_conditions =
        {
            {
                property = "pressure",
                min = 4000,
                max = 4000
            }
        },
    },
    {
        name = "low-density-structure-turbo-underground-belt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("turbo-underground-belt"),
            vgal.icon.get_in("low-density-structure"),
        },
        energy_required = 4,
        technology = "turbo-transport-belt",
        ingredients = {
            { "low-density-structure",    5 },
            { "tungsten-plate",           10 },
            { "express-underground-belt", 2 },
        },
        fluid_ingredients = {
            { "lubricant", 40 },
        },
        results = {
            { "turbo-underground-belt", 2 },
        },
        category = "metallurgy",
        surface_conditions =
        {
            {
                property = "pressure",
                min = 4000,
                max = 4000
            }
        },
    },
    {
        name = "low-density-structure-turbo-splitter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("turbo-splitter"),
            vgal.icon.get_in("low-density-structure"),
        },
        energy_required = 4,
        technology = "turbo-transport-belt",
        ingredients = {
            { "tungsten-plate",        6 },
            { "low-density-structure", 1 },
            { "processing-unit",       2 },
            { "express-splitter",      1 },
        },
        fluid_ingredients = {
            { "lubricant", 80 },
        },
        results = {
            { "turbo-splitter", 1 },
        },
        category = "metallurgy",
        surface_conditions =
        {
            {
                property = "pressure",
                min = 4000,
                max = 4000
            }
        },
    },
    {
        name = "quantum-processor-splitter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("splitter"),
            vgal.icon.get_in("quantum-processor"),
        },
        energy_required = 120,
        technology = "quantum-processor",
        ingredients = {
            { "low-density-structure", 40 },  --
            { "superconductor",        35 },  -- 7000
            { "radar",                 1 },   --
            { "quantum-processor",     1 },   -- idk
            { "transport-belt",        800 }, -- 12000
        },
        results = {
            { "splitter", 200 }, -- 47000
        },
        groups = { "vgal-silly" },
        category = "pressing",
    },
}, {
    type = "recipe",
    groups = { "vgal-belts" }
})

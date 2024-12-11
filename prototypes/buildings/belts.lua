vgal.data.extend {
    {
        name = "steel-transport-belt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("transport-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 5,
        technology = "steel-processing",
        ingredients = {
            { "steel-plate",     1 },
            { "iron-gear-wheel", 1 },
        },
        results = {
            { "transport-belt", 5 },
        },
        category = "crafting",
    },
    {
        name = "steel-fast-transport-belt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("fast-transport-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 2,
        technology = { "logistics-2", "steel-processing" },
        ingredients = {
            { "steel-plate",     1 },
            { "iron-gear-wheel", 1 },
            { "transport-belt",  1 },
        },
        results = {
            { "fast-transport-belt", 1 },
        },
        category = "crafting",
    },
    {
        name = "steel-express-transport-belt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("express-transport-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 2,
        technology = { "logistics-3" },
        ingredients = {
            { "steel-plate",         3 },
            { "iron-gear-wheel",     2 },
            { "fast-transport-belt", 1 },
        },
        fluid_ingredients = {
            { "lubricant", 20 },
        },
        results = {
            { "express-transport-belt", 1 }
        },
        category = "crafting-with-fluid",
    },
    -- UNDERGROUND
    {
        name = "steel-underground-belt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("underground-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 2,
        technology = { "logistics", "steel-processing" },
        ingredients = {
            { "steel-plate",    1 },
            { "iron-plate",     3 },
            { "transport-belt", 5 },
        },
        results = {
            { "underground-belt", 5 },
        },
        category = "crafting",
    },
    {
        name = "steel-fast-underground-belt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("fast-underground-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 4,
        technology = { "logistics-2", "steel-processing" },
        ingredients = {
            { "steel-plate",      15 },
            { "iron-gear-wheel",  2 },
            { "underground-belt", 2 },
        },
        results = {
            { "fast-underground-belt", 2 },
        },
        category = "crafting",
    },
    {
        name = "steel-express-underground-belt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("express-underground-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 4,
        technology = { "logistics-3" },
        ingredients = {
            { "steel-plate",           28 },
            { "iron-gear-wheel",       10 },
            { "fast-underground-belt", 2 },
        },
        fluid_ingredients = {
            { "lubricant", 40 },
        },
        results = {
            { "express-underground-belt", 2 }
        },
        category = "crafting-with-fluid",
    },
    -- SPLITTER
    {
        name = "advanced-circuit-splitter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("splitter"),
            vgal.icon.get_in("advanced-circuit"),
        },
        energy_required = 2,
        technology = { "logistics", "steel-processing" },
        ingredients = {
            { "steel-plate",      1 },
            { "advanced-circuit", 1 },
            { "transport-belt",   4 },
        },
        results = {
            { "splitter", 1 },
        },
        category = "crafting",
    },
    {
        name = "processing-unit-splitter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("splitter"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 12,
        technology = "processing-unit",
        ingredients = {
            { "steel-plate",     6 },  -- 300
            { "processing-unit", 1 },  -- 710
            { "transport-belt",  24 }, -- 15x = 360
        },
        results = {
            { "splitter", 6 }, -- 235x = 1410
        },
        category = "crafting",
    },
    {
        name = "advanced-circuit-fast-splitter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("fast-splitter"),
            vgal.icon.get_in("advanced-circuit"),
        },
        energy_required = 4,
        technology = { "logistics-2", "steel-processing" },
        ingredients = {
            { "steel-plate",      4 }, -- 200
            { "advanced-circuit", 2 }, -- 200
            { "splitter",         1 }, -- 235
        },
        results = {
            { "fast-splitter", 1 }, -- 685
        },
        category = "crafting",
    },
    {
        name = "processing-unit-fast-splitter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("fast-splitter"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 8,
        technology = "processing-unit",
        ingredients = {
            { "steel-plate",     3 }, -- 200
            { "processing-unit", 1 }, -- 710
            { "splitter",        2 }, -- 235*2
        },
        results = {
            { "fast-splitter", 2 }, -- 685*2
        },
        category = "crafting",
    },
    {
        name = "advanced-circuit-express-splitter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("express-splitter"),
            vgal.icon.get_in("advanced-circuit"),
        },
        energy_required = 4,
        technology = { "logistics-3" },
        ingredients = {
            { "steel-plate",      2 },
            { "advanced-circuit", 10 },
            { "fast-splitter",    1 },
        },
        fluid_ingredients = {
            { "lubricant", 80 },
        },
        results = {
            { "express-splitter", 1 }
        },
        category = "crafting-with-fluid",
    },
    {
        name = "processing-unit-express-splitter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("express-splitter"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 4,
        technology = { "logistics-3", "processing-unit" },
        ingredients = {
            { "steel-plate",     4 }, -- 200
            { "processing-unit", 1 }, -- 710
            { "fast-splitter",   1 }, -- 685
        },
        fluid_ingredients = {
            { "lubricant", 80 }, -- 160
        },
        results = {
            { "express-splitter", 1 } -- 2045
        },
        category = "crafting-with-fluid",
    },
}

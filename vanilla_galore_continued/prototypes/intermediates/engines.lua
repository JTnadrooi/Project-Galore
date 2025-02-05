vgal.data.extend {
    {
        name = "low-density-structure-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("low-density-structure"),
        },
        technology = "low-density-structure",
        energy_required = 60,
        ingredients = {
            { "iron-gear-wheel",       4 },
            { "pipe",                  6 },
            { "low-density-structure", 1 },
        },
        results = {
            { "engine-unit", 6 },
        },
        category = "advanced-crafting",
    },
    {
        name = "lubricant-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("lubricant", "fluid"),
        },
        technology = "lubricant",
        energy_required = 10,
        ingredients = {
            { "iron-gear-wheel", 1 },
            { "pipe",            2 },
            { "iron-plate",      2 }
        },
        fluid_ingredients = {
            { "lubricant", 5 }
        },
        results = {
            { "engine-unit", 1 },
        },
        category = "crafting-with-fluid",
    },
    {
        name = "advanced-circuit-electric-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electric-engine-unit"),
            vgal.icon.get_in("advanced-circuit"),
        },
        technology = "electric-engine",
        energy_required = 10,
        ingredients = {
            { "engine-unit",      1 },
            { "advanced-circuit", 1 },
        },
        results = {
            { "electric-engine-unit", 1 },
        },
        category = "crafting",
    },
    {
        name = "plastic-bar-electric-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electric-engine-unit"),
            vgal.icon.get_in("plastic-bar"),
        },
        technology = "electric-engine",
        energy_required = 10,
        ingredients = {
            { "engine-unit",        1 },
            { "electronic-circuit", 2 },
            { "plastic-bar",        1 },
        },
        results = {
            { "electric-engine-unit", 1 },
        },
        category = "crafting",
    },
    -- {
    --     name = "plastic-bar-electric-engine-unit",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("electric-engine-unit"),
    --         vgal.icon.get_in("plastic-bar"),
    --     },
    --     technology = "electric-engine",
    --     energy_required = 10,
    --     ingredients = {
    --         { "electronic-circuit", 2 },  -- 50
    --         { "copper-cable",       15 }, -- 75
    --         { "plastic-bar",        2 },  -- 30
    --     },
    --     fluid_ingredients = {
    --         { "lubricant", 10 } -- 20
    --     },
    --     results = {
    --         { "electric-engine-unit", 1 }, -- 180
    --     },
    --     category = "crafting-with-fluid",
    -- },
}

vgal.data.extend {
    {
        name = "battery-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("battery"),
        },
        technology = "battery",
        energy_required = 10,
        ingredients = {
            { "iron-gear-wheel", 1 },
            { "copper-cable",    2 },
            { "battery",         1 }
        },
        results = {
            { "engine-unit", 1 },
        },
        category = "advanced-crafting",
    },
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
        name = "iron-stick-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("iron-stick"),
        },
        technology = "engine",
        energy_required = 8,
        ingredients = {
            { "iron-gear-wheel", 1 },
            { "iron-stick",      4 },
            { "steel-plate",     1 }
        },
        results = {
            { "engine-unit", 1 },
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
        energy_required = 20,
        ingredients = {
            { "engine-unit",      2 },
            { "advanced-circuit", 1 },
        },
        fluid_ingredients = {
            { "lubricant", 25 }
        },
        results = {
            { "electric-engine-unit", 2 },
        },
        category = "crafting-with-fluid",
    },
}

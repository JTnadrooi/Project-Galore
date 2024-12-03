vgal.data.extend {
    {
        name = "steel-express-transport-belt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("express-transport-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 0.5,
        technology = "logistics-3",
        ingredients = {
            { "steel-plate",         3 },
            { "fast-transport-belt", 1 }
        },
        fluid_ingredients = {
            { "lubricant", 20 },
        },
        results = {
            { "express-transport-belt", 1 }
        },
        category = "crafting-with-fluid",
    },
    {
        name = "steel-express-splitter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("express-splitter"),
            vgal.icon.get_in("steel-plate"),
        },
        technology = "logistics-3",
        energy_required = 2,
        ingredients = {
            { "steel-plate",            2 },
            { "express-transport-belt", 4 },
            { "advanced-circuit",       10 }
        },
        fluid_ingredients = {
            { "lubricant", 20 },
        },
        results = {
            { "express-splitter", 1 }
        },
        category = "crafting-with-fluid",
    },
    {
        name = "steel-express-underground-belt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("express-underground-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        technology = "logistics-3",
        energy_required = 2,
        ingredients = {
            { "steel-plate",            10 },
            { "express-transport-belt", 10 },
        },
        fluid_ingredients = {
            { "lubricant", 20 },
        },
        results = {
            { "express-underground-belt", 2 }
        },
        category = "crafting-with-fluid",
    },
    {
        name = "steel-transport-belt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("transport-belt"),
            vgal.icon.get_in("steel-plate")
        },
        technology = "steel-processing",
        energy_required = 6,
        ingredients = {
            { "steel-plate",     1 },
            { "iron-gear-wheel", 6 }
        },
        results = {
            { "transport-belt", 12 }
        },
        category = "crafting"
    },
    {
        name = "steel-underground-belt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("underground-belt"),
            vgal.icon.get_in("steel-plate")
        },
        energy_required = 3,
        technology = "steel-processing",
        ingredients = {
            { "steel-plate",    2 },
            { "transport-belt", 3 },
        },
        results = {
            { "underground-belt", 2 }
        },
        category = "crafting"
    },
    {
        name = "steel-splitter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("splitter"),
            vgal.icon.get_in("steel-plate"),
        },
        technology = "steel-processing",
        energy_required = 1,
        ingredients = {
            { "steel-plate",        1 },
            { "electronic-circuit", 5 },
            { "transport-belt",     2 },
        },
        results = {
            { "splitter", 1 }
        },
        category = "crafting",
    },
    {
        name = "steel-fast-splitter",
        prefix = "vgal",
        technology = {"steel-processing", "logistics-2"},
        icons = vgal.icon.register {
            vgal.icon.get("fast-splitter"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 2,
        ingredients = {
            { "steel-plate",         2 },
            { "electronic-circuit",  6 },
            { "fast-transport-belt", 4 }
        },
        results = {
            { "fast-splitter", 1 }
        },
        category = "crafting",
    },
    {
        name = "steel-fast-transport-belt",
        prefix = "vgal",
        technology = { "steel-processing", "logistics-2" },
        icons = vgal.icon.register {
            vgal.icon.get("fast-transport-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 2,
        ingredients = {
            { "steel-plate",    8 },
            { "transport-belt", 5 },
        },
        results = {
            { "fast-transport-belt", 5 }
        },
        category = "crafting",
    },
    {
        name = "steel-fast-underground-belt",
        prefix = "vgal",
        technology = { "steel-processing", "logistics-2" },
        icons = vgal.icon.register {
            vgal.icon.get("fast-underground-belt"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 2,
        ingredients = {
            { "steel-plate",         10 },
            { "fast-transport-belt", 5 }
        },
        results = {
            { "fast-underground-belt", 2 }
        },
        category = "crafting",
    },
    {
        name = "plastic-transport-belt",
        prefix = "vgal",
        technology = "plastics",
        icons = vgal.icon.register {
            vgal.icon.get("transport-belt"),
            vgal.icon.get_in("plastic-bar"),
        },
        ingredients = {
            { "plastic-bar",     2 },
            { "iron-gear-wheel", 1 }
        },
        results = {
            { "transport-belt", 4 },
        },
    },
    {
        name = "plastic-fast-transport-belt",
        prefix = "vgal",
        technology = { "plastics", "logistics-2" },
        icons = vgal.icon.register {
            vgal.icon.get("fast-transport-belt"),
            vgal.icon.get_in("plastic-bar"),
        },
        energy_required = 1,
        ingredients = {
            { "iron-gear-wheel", 5 },
            { "transport-belt",  2 },
            { "plastic-bar",     8 }
        },
        result = "fast-transport-belt",
        result_count = 2
    },
    {
        name = "plastic-express-transport-belt",
        prefix = "vgal",
        technology = "logistics-3",
        icons = vgal.icon.register {
            vgal.icon.get("express-transport-belt"),
            vgal.icon.get_in("plastic-bar"),
        },
        category = "crafting-with-fluid",
        energy_required = 2,
        ingredients = {
            { "iron-gear-wheel",     10 },
            { "fast-transport-belt", 2 },
            { "plastic-bar",         10 }
        },
        fluid_ingredients = {
            { "lubricant", 30 },
        },
        results = {
            { "express-transport-belt", 2 },
        },
    },
}

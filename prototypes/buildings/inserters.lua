vgal.data.extend {
    {
        name = "inserter-from-copper-plate",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("inserter"),
            vgal.icon.get_in("copper-plate"),
        },
        technology = "electronics",
        energy_required = 2,
        ingredients = {
            { "electronic-circuit", 2 },
            { "copper-cable",       6 },
            { "copper-plate",       1 },
        },
        results = {
            { "inserter", 2 },
        },
    },
    {
        name = "inserter-from-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("inserter"),
            vgal.icon.get_in("engine-unit"),
        },
        technology = "engine",
        energy_required = 1,
        ingredients = {
            { "engine-unit",        1 },
            { "iron-plate",         2 },
            { "electronic-circuit", 4 },
        },
        results = {
            { "inserter", 4 },
        },
    },
    {
        name = "burner-inserter-from-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("burner-inserter"),
            vgal.icon.get_in("engine-unit"),
        },
        technology = "engine",
        energy_required = 1,
        ingredients = {
            { "engine-unit", 1 },
            { "iron-plate",  2 },
        },
        results = {
            { "burner-inserter", 4 },
        },
    },
}
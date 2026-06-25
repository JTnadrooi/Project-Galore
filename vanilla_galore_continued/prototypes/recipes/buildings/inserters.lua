vgal.data.extend({
    {
        name = "burner-inserter-inserter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("inserter"),
            vgal.icon.get_in("burner-inserter"),
        },
        technology = "electronics",
        energy_required = 1,
        ingredients = {
            { "burner-inserter",    1 },
            { "electronic-circuit", 1 },
        },
        results = {
            { "inserter", 1 },
        },
        category = "crafting"
    },
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
        category = "crafting"
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
        category = "crafting"
    },
}, {
    type = "recipe",
    groups = { "vgal-buildings" }
})

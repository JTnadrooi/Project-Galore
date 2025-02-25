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
            { "plastic-bar",            10 }, -- 150
            { "tungsten-plate",         2 },  -- -180
            { "express-transport-belt", 1 },
        },
        fluid_ingredients = {
            { "lubricant", 25 }, -- +10
        },
        results = {
            { "turbo-transport-belt", 1 },
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
        surface_conditions =
        {
            {
                property = "pressure",
                min = 4000,
                max = 4000
            }
        },
    },
}, {
    groups = { "vgal-belts" }
})

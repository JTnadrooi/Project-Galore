vgal.data.extend({
    {
        name = "ammonia-crude-oil",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("crude-oil"),
            vgal.icon.get_in("ammonia"),
        },
        category = "oil-processing",
        energy_required = 3,
        fluid_ingredients = {
            { "ammonia", 10 }, -- 20
            { "water",   50 },
        },
        ingredients = {
            { "carbon", 1 }, -- 40
        },
        fluid_results = {
            { "crude-oil", 80 }, -- 40
        },
        technology = "bacteria-cultivation",
        show_amount_in_title = false,
    },
    {
        name = "ammonia-light-oil",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("crude-oil"),
            vgal.icon.get_in("ammonia"),
        },
        category = "oil-processing",
        energy_required = 3,
        fluid_ingredients = {
            { "ammonia", 10 }, -- 20
            { "water",   50 },
        },
        ingredients = {
            { "carbon", 1 }, -- 40
        },
        fluid_results = {
            { "crude-oil", 80 }, -- 40
        },
        technology = "bacteria-cultivation",
        show_amount_in_title = false,
    },
}, {
    groups = { "vgal-oil-recipes" }
})

vgal.data.extend({
    {
        name = "ammonia-crude-oil",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("crude-oil"),
            vgal.icon.get_in("ammonia"),
        },
        category = "organic",
        energy_required = 4,
        fluid_ingredients = {
            { "ammonia", 10 }, -- 20
            { "water",   50 },
        },
        ingredients = {
            { "carbon", 1 }, -- 40
        },
        fluid_results = {
            { "crude-oil", 60 }, -- 30 * 1.5 = 45
        },
        technology = "bacteria-cultivation",
        show_amount_in_title = false,
    },
    {
        name = "yumako-mash-light-oil",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__vanilla_galore_continued__/graphics/icons/recipe/yumako-mash-light-oil.png"),
        },
        category = "organic",
        energy_required = 3,
        fluid_ingredients = {
        },
        ingredients = {
            { "yumako-mash", 5 }, -- 50
        },
        fluid_results = {
            { "light-oil", 40 }, -- 60 * 1.5 = 90
        },
        show_amount_in_title = false,
        technology = "bacteria-cultivation",
    },
}, {
    groups = { "vgal-oil-recipes" }
})

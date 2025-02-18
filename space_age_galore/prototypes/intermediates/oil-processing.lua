vgal.data.extend({
    {
        name = "ammonia-water-crude-oil",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("crude-oil"),
            vgal.icon.get_in("ammonia"),
            vgal.icon.get_in2("water"),
        },
        category = "organic-or-chemistry",
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
        subgroup = "vgal-oil",
        order = "aaa",
        technology = "space-platform",
        show_amount_in_title = false,
    },
    {
        name = "yumako-mash-light-oil",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("yumako-mash"),
            vgal.icon.get_out_to("light-oil"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 3,
        ingredients = {
            { "yumako-mash", 6 }, -- 60
        },
        fluid_results = {
            { "light-oil", 40 }, -- 60 * 1.5 = 90
        },
        results = {
            { "yumako-seed", 1, { probability = 0.015 } },
        },
        show_amount_in_title = false,
        main_product = "light-oil",
        technology = "bacteria-cultivation",
    },
})

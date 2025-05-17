vgal.data.extend({
    {
        type = "recipe",
        name = "sulfur-ammonia-nutrients", -- for nauvis / aquilo
        prefix = "vgal",
        icons = vgal.icon.register {
            -- vgal.icon.get_in("sulfur"),
            -- vgal.icon.get_overlay("nutrients"),
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/sulfur-ammonia-nutrients.png"),
        },
        category = "organic-or-assembling",
        energy_required = 1,
        technology = "agriculture",
        fluid_ingredients = {
            { "ammonia", 25 }, -- 50
        },
        ingredients = {
            { "sulfur", 1 }, -- 15 (20gb)
        },
        results = {
            { "nutrients", 10 }, -- 100
        },
    },
    {
        type = "recipe",
        name = "pentapod-egg-bioflux-stone",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("pentapod-egg"),
            vgal.icon.get_out_to("stone"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 45,
        technology = "biochamber",
        ingredients = {
            { "pentapod-egg", 1 }, -- 200
            { "bioflux",      2 }, -- 120
        },
        results = {
            { "stone", nil, { amount_min = 10, amount_max = 30 } }, -- 200 * 1.5 = 300
        },
        show_amount_in_title = false,
        surface_conditions =
        {
            {
                property = "pressure",
                min = 2000,
                max = 2000,
            }
        },
    },
}, {
    type = "recipe",
})

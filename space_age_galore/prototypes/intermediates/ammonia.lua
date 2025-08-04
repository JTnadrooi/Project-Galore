vgal.data.extend({
    {
        type = "recipe",
        name = "iron-bacteria-ammonia",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("iron-bacteria"),
            vgal.icon.get_out_to("ammonia"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 6,
        technology = "bacteria-cultivation",
        ingredients = {
            { "iron-bacteria", 4 },  -- 120
            { "nutrients",     10 }, -- 100
        },
        fluid_results = {
            { "ammonia", 80 }, -- 160 * 1.5 = 240
        },
        show_amount_in_title = false,
        surface_conditions =
        {
            {
                property = "pressure",
                min = 10,
            }
        },
    },
    {
        type = "recipe",
        name = "copper-bacteria-ammonia",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("copper-bacteria"),
            vgal.icon.get_out_to("ammonia"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 4,
        technology = "bacteria-cultivation",
        ingredients = {
            { "copper-bacteria", 2 }, -- 60
            { "nutrients",       8 }, -- 80
        },
        fluid_results = {
            { "ammonia", 50 }, -- 100 * 1.5 = 150
        },
        show_amount_in_title = false,
        surface_conditions =
        {
            {
                property = "pressure",
                min = 10,
            }
        },
    },
    {
        type = "recipe",
        name = "biter-egg-ammonia",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("biter-egg"),
            vgal.icon.get_out_to("ammonia"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 10,
        technology = "captivity",
        ingredients = {
            { "biter-egg", 1 }, -- 80
            { "nutrients", 8 }, -- 80
        },
        fluid_results = {
            { "ammonia", 80 }, -- 160 * 1.5 = 240
        },
        show_amount_in_title = false,
        surface_conditions =
        {
            {
                property = "pressure",
                min = 10,
            }
        },
    },
    {
        type = "recipe",
        name = "water-coal-ammonia",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("ammonia"),
        },
        category = "organic-or-chemistry",
        energy_required = 1,
        technology = "oil-processing",
        fluid_ingredients = {
            { "water", 100 }, -- 1 (50vn)so pls dont use it on vulcanus ok?
        },
        ingredients = {
            { "coal", 2 }, -- 20
        },
        fluid_results = {
            { "ammonia", 10 } -- 20 (50vn)
        },
        surface_conditions =
        {
            {
                property = "pressure",
                min = 10,
                -- max = 3999,
            }
        },
    },
    {
        name = "calcite-sulfuric-acid-ammonia",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("calcite"),
            vgal.icon.get_out_to("ammonia"),
            vgal.icon.get_overlay("to"),

            vgal.icon.get_in2("sulfuric-acid"),
        },
        category = "chemistry",
        energy_required = 2,
        fluid_ingredients = {
            { "sulfuric-acid", 50 },
        },
        ingredients = {
            { "calcite", 2 }, -- 20
            { "carbon",  5 }, -- 30
        },
        fluid_results = {
            { "ammonia", 20 }, -- 100vu
        },
        technology = "calcite-processing",
        surface_conditions =
        {
            {
                property = "pressure",
                min = 4000,
                max = 4000,
            }
        },
        groups = { "vgal-convoluted" },
    },
    {
        name = "ice-solid-fuel-ammonia",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("ice"),
            vgal.icon.get_out_to("ammonia"),
            vgal.icon.get_overlay("to"),

            vgal.icon.get_in2("solid-fuel"),
        },
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            { "solid-fuel", 1 },
            { "ice",        3 },
        },
        fluid_results = {
            { "ammonia", 20 },
            { "water",   10, { ignored_by_productivity = 10, show_details_in_recipe_tooltip = false } },
        },
        technology = "planet-discovery-fulgora",
        show_amount_in_title = false,
        localised_name = { "", "20 \xC3\x97 ", { "recipe-name.vgal-ice-solid-fuel-ammonia" } },
        surface_conditions =
        {
            {
                property = "pressure",
                min = 800,
                max = 800
            }
        },
        groups = { "vgal-convoluted" },
    },
}, {
    type = "recipe",
})

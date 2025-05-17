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
    {
        type = "recipe",
        name = "copper-bacteria-iron-bacteria",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("copper-bacteria"),
            vgal.icon.get_out_to("iron-bacteria"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 60,
        technology = { "bacteria-cultivation", "uranium-processing" },
        ingredients = {
            { "copper-bacteria", 1 },
            { "uranium-235",     1, { ignored_by_stats = 1 } },
        },
        results = {
            { "iron-bacteria", 1 },
            { "uranium-235",   1, { probability = 0.6, ignored_by_stats = 1, show_details_in_recipe_tooltip = false } },
            { "uranium-238",   1, { probability = 0.4, show_details_in_recipe_tooltip = false } },
        },
        allow_productivity = false,
        show_amount_in_title = false,
        result_is_always_fresh = true,
        order = "axb"
    },
    {
        type = "recipe",
        name = "uranium-235-iron-bacteria",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("iron-bacteria-cultivation", "recipe"),
            vgal.icon.get_in("uranium-235"),
        },
        category = "organic",
        energy_required = 4,
        technology = { "bacteria-cultivation", "uranium-processing" },
        ingredients = {
            { "iron-bacteria", 1, { ignored_by_stats = 1 } },
            { "bioflux",       1 },
            { "uranium-235",   1, { ignored_by_stats = 1 } },
        },
        results = {
            { "iron-bacteria", 15, { ignored_by_stats = 1 } },
            { "uranium-235",   1,  { probability = 0.98, ignored_by_stats = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false } },
            { "uranium-238",   1,  { probability = 0.02, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false } },
        },
        show_amount_in_title = false,
        result_is_always_fresh = true,
        groups = { "vgal-unsure" },
        order = "ab",
        surface_conditions =
        {
            {
                property = "pressure",
                min = 2000,
                max = 2000,
            }
        },
    },
    {
        type = "recipe",
        name = "ammoniacal-solution-iron-bacteria",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("iron-bacteria-cultivation", "recipe"),
            vgal.icon.get_in("ammoniacal-solution"),
        },
        category = "organic",
        energy_required = 8,
        technology = "planet-discovery-aquilo",
        fluid_ingredients = {
            { "ammoniacal-solution", 50 },
        },
        ingredients = {
            { "iron-bacteria", 1, { ignored_by_stats = 1 } },
            { "bioflux",       1 },
        },
        results = {
            { "iron-bacteria", 8, { ignored_by_stats = 1 } },
        },
        fluid_results = {
            { "ammonia", 20 },
        },
        show_amount_in_title = false,
        result_is_always_fresh = true,
        groups = { "vgal-unsure" },
        order = "ac",
    },
    {
        type = "recipe",
        name = "iron-bacteria-copper-bacteria",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("iron-bacteria"),
            vgal.icon.get_out_to("copper-bacteria"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 60,
        technology = { "bacteria-cultivation", "uranium-processing" },
        ingredients = {
            { "iron-bacteria", 1 },
            { "uranium-235",   1, { ignored_by_stats = 1 } },
        },
        results = {
            { "copper-bacteria", 1 },
            { "uranium-235",     1, { probability = 0.6, ignored_by_stats = 1, show_details_in_recipe_tooltip = false } },
            { "uranium-238",     1, { probability = 0.4, show_details_in_recipe_tooltip = false } },
        },
        allow_productivity = false,
        show_amount_in_title = false,
        result_is_always_fresh = true,
        order = "bxb"
    },
    {
        type = "recipe",
        name = "uranium-235-copper-bacteria",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("copper-bacteria-cultivation", "recipe"),
            vgal.icon.get_in("uranium-235"),
        },
        category = "organic",
        energy_required = 4,
        technology = { "bacteria-cultivation", "uranium-processing" },
        ingredients = {
            { "copper-bacteria", 1, { ignored_by_stats = 1 } },
            { "bioflux",         1 },
            { "uranium-235",     1, { ignored_by_stats = 1 } },
        },
        results = {
            { "copper-bacteria", 15, { ignored_by_stats = 1 } },
            { "uranium-235",     1,  { probability = 0.98, ignored_by_stats = 1, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false } },
            { "uranium-238",     1,  { probability = 0.02, ignored_by_productivity = 1, show_details_in_recipe_tooltip = false } },
        },
        show_amount_in_title = false,
        result_is_always_fresh = true,
        groups = { "vgal-unsure" },
        order = "bb",
        surface_conditions =
        {
            {
                property = "pressure",
                min = 2000,
                max = 2000,
            }
        },
    },
    {
        type = "recipe",
        name = "ammoniacal-solution-copper-bacteria",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("copper-bacteria-cultivation", "recipe"),
            vgal.icon.get_in("ammoniacal-solution"),
        },
        category = "organic",
        energy_required = 8,
        technology = "planet-discovery-aquilo",
        fluid_ingredients = {
            { "ammoniacal-solution", 50 },
        },
        ingredients = {
            { "copper-bacteria", 1, { ignored_by_stats = 1 } },
            { "bioflux",         1 },
        },
        results = {
            { "copper-bacteria", 8, { ignored_by_stats = 1 } },
        },
        fluid_results = {
            { "ammonia", 20 },
        },
        show_amount_in_title = false,
        result_is_always_fresh = true,
        groups = { "vgal-unsure" },
        order = "bc",
    },
    {
        type = "recipe",
        name = "raw-fish-bioflux",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("bioflux"),
            vgal.icon.get_in("raw-fish"),
        },
        category = "cryogenics",
        energy_required = 8,
        technology = "cryogenic-plant",
        fluid_ingredients = {
            { "fluoroketone-cold", 20 },
        },
        ingredients = {
            { "raw-fish",  1 },  -- 530
            { "nutrients", 20 }, -- 160
        },
        results = {
            { "bioflux", 5 },
        },
        fluid_results = {
            { "fluoroketone-hot", 15, { temperature = 180 } },
        },
        groups = { "vgal-unsure" },
    },
    {
        type = "recipe",
        name = "ammoniacal-solution-raw-fish",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("bioflux"),
            vgal.icon.get_in("raw-fish"),
        },
        category = "organic",
        energy_required = 6,
        technology = "planet-discovery-aquilo",
        fluid_ingredients = {
            { "ammoniacal-solution", 100 },
        },
        ingredients = {
            { "nutrients", 30 },
            { "raw-fish",  2 },
        },
        results = {
            { "raw-fish", 3 },
        },
        groups = { "vgal-unsure" },
    },
}, {
    type = "recipe",
})

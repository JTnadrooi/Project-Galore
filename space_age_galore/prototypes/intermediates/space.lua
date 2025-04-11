vgal.data.extend({
    {
        name = "promethium-asteroid-chunk-crushing",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("promethium-asteroid-chunk"),
            vgal.icon.get_overlay("crushing"),
        },
        energy_required = 1,
        technology = "promethium-science-pack",
        ingredients = {
            { "promethium-asteroid-chunk", 1 },
        },
        results = {
            { "holmium-ore",               1, { probability = 0.005 } },
            { "promethium-asteroid-chunk", 1, { probability = 0.80, ignored_by_productivity = 1 } },
        },
        category = "crushing",
        order = "b-a-d", -- hey
        show_amount_in_title = false,
        complementairy_recipe = "metallic-asteroid-crushing",
        productivity_technology = "asteroid-productivity",
    },
    {
        name = "promethium-asteroid-chunk-reprocessing",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("promethium-asteroid-chunk"),
            vgal.icon.get_overlay("reprocessing"),
        },
        energy_required = 8,
        technology = "promethium-science-pack",
        ingredients = {
            { "promethium-asteroid-chunk", 1 },
        },
        results = {
            { "promethium-asteroid-chunk", 1, { probability = 0.20 } },
            { "oxide-asteroid-chunk",      1, { probability = 0.10 } },
            { "metallic-asteroid-chunk",   1, { probability = 0.10 } },
            { "carbonic-asteroid-chunk",   1, { probability = 0.10 } },
        },
        category = "crushing",
        show_amount_in_title = false,
        allow_productivity = false,
        complementairy_recipe = "oxide-asteroid-reprocessing",
    },
    {
        type = "recipe",
        name = "oxide-asteroid-chunk-ammoniacal-solution",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/oxide-asteroid-chunk-ammoniacal-solution.png"),
        },
        category = "cryogenics",
        energy_required = 10,
        technology = "cryogenic-plant",
        ingredients = {
            { "oxide-asteroid-chunk", 1 },
        },
        results = {
            { "ice",     2 },
            { "calcite", 1, { probability = 0.05 } },
        },
        fluid_results = {
            { "ammoniacal-solution", 20 },
        },
        subgroup = "vgal-space-advanced",
        order = "ac",
        productivity_technology = "asteroid-productivity",
    },
    {
        type = "recipe",
        name = "metallic-asteroid-chunk-tungsten-ore",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/metallic-asteroid-chunk-tungsten-ore.png"),
        },
        category = "crushing",
        energy_required = 10,
        technology = "tungsten-carbide",
        ingredients = {
            { "metallic-asteroid-chunk", 1 },
        },
        results = {
            { "iron-ore",                5 },
            { "tungsten-ore",            2 },
            { "metallic-asteroid-chunk", 1, { probability = 0.05 } },
        },
        subgroup = "vgal-space-advanced",
        order = "aa",
        productivity_technology = "asteroid-productivity",
        groups = { "vgal-unsure" },
    },
    -- {
    --     type = "recipe",
    --     name = "oxide-asteroid-chunk-stone",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get_placeholder(),
    --     },
    --     technology = "foundry",
    --     energy_required = 4,
    --     category = "crushing",
    --     ingredients = {
    --         { "oxide-asteroid-chunk", 1 },
    --     },
    --     results = {
    --         { "ice",                  6 },
    --         { "stone",                4 },
    --         { "oxide-asteroid-chunk", 1, { probability = 0.05 } },
    --     },
    --     complementairy_recipe = "advanced-oxide-asteroid-crushing",
    --     productivity_technology = "asteroid-productivity",
    -- },
    {
        name = "metallic-asteroid-chunk-lava", -- should be used for stone, for the other recipes this isn't that good
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/metallic-asteroid-chunk-lava.png"),
            -- vgal.icon.get("lava"),
            -- vgal.icon.get("metallic-asteroid-chunk"),
            -- vgal.icon.get_in_fluid("metallic-asteroid-chunk"),
            -- vgal.icon.get_in_fluid2("calcite"),
        },
        energy_required = 12,
        technology = "foundry",
        ingredients = {
            { "metallic-asteroid-chunk", 1 },
        },
        fluid_results = {
            { "lava", 50 }, -- .. lava = .. molten, ~ .. stone
        },
        results = {
            { "stone",                   2 },
            { "metallic-asteroid-chunk", 1, { probability = 0.05 } },
        },
        category = "metallurgy",
        subgroup = "vgal-space-advanced",
        main_product = "lava",
        order = "aa",
        productivity_technology = "asteroid-productivity",
    },
    {
        type = "recipe",
        name = "carbon-stone-thruster-fuel", -- ~ 80% less carbon usage, bit less water, 2x faster (adv is 4x faster)
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/carbon-stone-thruster-fuel.png"),
        },
        category = "chemistry",
        energy_required = 5,
        technology = "foundry",
        fluid_ingredients = {
            { "water", 40 },
        },
        ingredients = {
            { "carbon", 2 },
            { "stone",  1 },
        },
        fluid_results = {
            { "thruster-fuel", 350 },
        },
        order = "baa",
        surface_conditions =
        {
            {
                property = "gravity",
                min = 0,
                max = 0
            }
        },
        show_amount_in_title = false,
    },
    {
        type = "recipe",
        name = "iron-ore-stone-thruster-oxidizer", -- ~ 80% less iron usage, bit less water, 2x faster (adv is 4x faster)
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/iron-ore-stone-thruster-oxidizer.png"),
        },
        category = "chemistry",
        energy_required = 5,
        technology = "foundry",
        fluid_ingredients = {
            { "water", 40 },
        },
        ingredients = {
            { "iron-ore", 2 },
            { "stone",    1 },
        },
        fluid_results = {
            { "thruster-oxidizer", 350 },
        },
        order = "caa",
        surface_conditions =
        {
            {
                property = "gravity",
                min = 0,
                max = 0
            }
        },
        show_amount_in_title = false,
    },
    -- {
    --     type = "recipe",
    --     name = "carbonic-asteroid-chunk-uranium-ore",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         -- vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/carbonic-asteroid-chunk-uranium-ore.png"),
    --         vgal.icon.get_placeholder(),
    --     },
    --     category = "crushing",
    --     energy_required = 10,
    --     technology = "cryogenic-plant",
    --     ingredients = {
    --         { "carbonic-asteroid-chunk", 1 },
    --     },
    --     results = {
    --         { "carbon",                  5 },
    --         { "uranium-ore",             2 },
    --         { "carbonic-asteroid-chunk", 1, { probability = 0.05 } },
    --     },
    --     complementairy_recipe = "advanced-carbonic-asteroid-crushing",
    --     productivity_technology = "asteroid-productivity",
    --     groups = { "vgal-unsure" },
    -- },
    -- {
    --     name = "carbonic-asteroid-chunk-petroleum-gas", -- methane
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("petroleum-gas"),
    --         vgal.icon.get_in_fluid("carbonic-asteroid-chunk"),
    --         -- vgal.icon.get_in_fluid2("calcite"),
    --     },
    --     energy_required = 12,
    --     technology = "cryogenic-plant",
    --     category = "cryogenics",
    --     ingredients = {
    --         { "carbonic-asteroid-chunk", 1 },
    --     },
    --     results = {
    --         { "carbon", 2 },
    --         { "sulfur", 1, { probability = 0.05 } },
    --     },
    --     fluid_results = {
    --         { "petroleum-gas", 50 },
    --     },
    --     complementairy_recipe = "advanced-metallic-asteroid-crushing",
    --     productivity_technology = "asteroid-productivity",
    -- },
    -- {
    --     type = "recipe",
    --     name = "fluorine-steam-thruster-oxidizer",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         -- vgal.icon.get("thruster-oxidizer"),
    --         vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/fluorine-steam-thruster-oxidizer.png"),
    --     },
    --     category = "chemistry",
    --     energy_required = 12,
    --     technology = "planet-discovery-aquilo",
    --     fluid_ingredients = {
    --         { "fluorine", 5 },
    --         { "steam",    1500 },
    --     },
    --     ingredients = {
    --         { "calcite", 1 },
    --     },
    --     fluid_results = {
    --         { "thruster-oxidizer", 3000 },
    --     },
    -- },
    {
        type = "recipe",
        name = "thruster-oxidizer-thruster-fuel-steam",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/thruster-oxidizer-thruster-fuel-steam.png"),
        },
        category = "chemistry-or-cryogenics",
        energy_required = 5,
        technology = "space-platform",
        fluid_ingredients = {
            { "thruster-oxidizer", 1000 },
            { "thruster-fuel",     1000 },
        },
        ingredients = {
            { "solid-fuel", 1 },
        },
        fluid_results = {
            { "steam", 300, { temperature = 500 } },
        },
        surface_conditions =
        {
            {
                property = "gravity",
                min = 0,
                max = 0
            }
        },
        allow_productivity = false,
        show_amount_in_title = false,
        groups = { "vgal-unsure" },
    },
    {
        type = "recipe",
        name = "ammonia-thruster-oxidizer",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/ammonia-thruster-oxidizer.png"),
        },
        category = "cryogenics",
        energy_required = 10,
        technology = "cryogenic-plant",
        fluid_ingredients = {
            { "ammonia", 50 },
        },
        ingredients = {
            { "iron-ore", 1 },
        },
        fluid_results = {
            { "thruster-oxidizer", 3000 },
        },
        order = "cc",
        surface_conditions =
        {
            {
                property = "gravity",
                min = 0,
                max = 0
            }
        },
        show_amount_in_title = false,
    },
    {
        type = "recipe",
        name = "crude-oil-thruster-fuel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/crude-oil-thruster-fuel.png"),
        },
        category = "cryogenics",
        energy_required = 10,
        technology = "cryogenic-plant",
        fluid_ingredients = {
            { "crude-oil", 50 },
        },
        ingredients = {
            { "calcite", 1 },
        },
        fluid_results = {
            { "thruster-fuel", 3000 },
        },
        order = "bc",
        surface_conditions =
        {
            {
                property = "gravity",
                min = 0,
                max = 0
            }
        },
        show_amount_in_title = false,
    },
}, {
    type = "recipe",
})

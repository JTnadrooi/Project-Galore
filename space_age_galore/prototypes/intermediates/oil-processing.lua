vgal.data.extend({
    {
        name = "ammonia-water-crude-oil",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/ammonia-water-crude-oil.png"),
        },
        category = "organic-or-chemistry",
        energy_required = 4,
        fluid_ingredients = {
            { "ammonia", 10 }, -- 20
            { "water",   20 },
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
        crafting_machine_tint = {
            primary = { r = 0.0, g = 0.3, b = 1.0, a = 1.000 },
            secondary = { r = 0.1, g = 0.5, b = 1.0, a = 1.000 },
            tertiary = { r = 0.0, g = 0.2, b = 0.8, a = 1.000 },
            quaternary = { r = 0.0, g = 0.1, b = 0.6, a = 1.000 },
        },
    },
    {
        name = "spoilage-crude-oil", -- the number one least efficient recipe in all of Galore. (2.5%)
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/spoilage-crude-oil.png"),
        },
        category = "organic",
        energy_required = 5,
        ingredients = {
            { "spoilage", 20 }, -- 200
        },
        fluid_results = {
            { "crude-oil", 10 }, -- 5
        },
        subgroup = "vgal-oil",
        order = "aab",
        technology = "agriculture",
        show_amount_in_title = false,
    },
    {
        name = "yumako-mash-light-oil",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/yumako-mash-light-oil.png"),
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
        technology = "yumako",
    },
    -- {
    --     name = "solid-fuel-calcite-stone-brick-jelly",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("jelly"),
    --         vgal.icon.get_in("calcite"),
    --     },
    --     category = "oil-processing",
    --     energy_required = 3,
    --     ingredients = {
    --         { "stone-brick", 2 }, -- 40
    --         { "calcite",     1 }, -- 10
    --         { "solid-fuel",  5 }, -- 75
    --     },
    --     fluid_ingredients = {
    --         { "steam", 40 }, --
    --     },
    --     results = {
    --         { "jelly", 5 }, -- 40
    --     },
    --     technology = "jellynut",
    --     groups = { "vgal-convoluted", "vgal-unsure" },
    -- },
}, {
    type = "recipe",
})

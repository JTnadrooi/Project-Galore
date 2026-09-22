data:extend({
    -- vgal.tech.create_simple("vgal-puffer-atmosphere", { "agricultural-science-pack" }, vgal.icon.merge_composites({
    --     vgal.icon.get_placeholder(),
    -- }), { "angels-gas-puffer-atmosphere" }),
    {
        type = "technology",
        name = "vgal-puffer-atmosphere",
        icons = vgal.icon.merge_composites({
            vgal.icon.get_placeholder(),
        }),
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "angels-gas-puffer-atmosphere"
            }
        },
        prerequisites = { "agricultural-science-pack", "angels-bio-refugium-puffer-2" },
        unit =
        {
            count = 500,
            ingredients =
            {
                { "automation-science-pack",   1 },
                { "logistic-science-pack",     1 },
                { "chemical-science-pack",     1 },
                { "space-science-pack",        1 },
                { "agricultural-science-pack", 1 },
            },
            time = 60
        },
        upgrade = true
    },
    {
        type = "technology",
        name = "vgal-holmium-smelting-1",
        icon = "__angels_space_age_galore__/graphics/technology/smelting-holmium-tech.png",
        icon_size = 256,
        prerequisites = {
            "recycling",
        },
        effects = {},
        unit = {
            count = 250,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "space-science-pack",      1 },
            },
            time = 30,
        },
        order = "c-a",
    },
    {
        type = "technology",
        name = "vgal-holmium-smelting-2",
        icon = "__angels_space_age_galore__/graphics/technology/smelting-holmium-tech.png",
        icon_size = 256,
        prerequisites = {
            "vgal-holmium-smelting-1",
            "angels-ore-processing-1",
        },
        effects = {},
        unit = {
            count = 300,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "space-science-pack",      1 },
                { "production-science-pack", 1 },
            },
            time = 30,
        },
        order = "c-a",
    },
    {
        type = "technology",
        name = "vgal-holmium-smelting-3",
        icon = "__angels_space_age_galore__/graphics/technology/smelting-holmium-tech.png",
        icon_size = 256,
        prerequisites = {
            "vgal-holmium-smelting-2",
            "angels-ore-processing-2",
        },
        effects = {},
        unit = {
            count = 400,
            ingredients = {
                { "automation-science-pack",  1 },
                { "logistic-science-pack",    1 },
                { "chemical-science-pack",    1 },
                { "space-science-pack",       1 },
                { "production-science-pack",  1 },
                { "utility-science-pack",     1 },
                { "metallurgic-science-pack", 1 },
            },
            time = 30,
        },
        order = "c-a",
    },
})

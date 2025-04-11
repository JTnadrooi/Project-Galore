vgal.data.extend({
    {
        name = "carbon-uranium-ore",
        prefix = "vgal",
        icons = vgal.icon.register {
            -- vgal.icon.get("carbon"),
            -- vgal.icon.get_overlay("reprocessing"),

            vgal.icon.get_in_to("carbon"),
            vgal.icon.get_out_to("uranium-ore"),
            vgal.icon.get_overlay("to"),
        },
        energy_required = 25,
        technology = { "uranium-processing", "space-platform" },
        -- fluid_ingredients = {
        --     { "sulfuric-acid", 20 },
        -- },
        ingredients = {
            { "carbon", 15 },
        },
        results = {
            { "uranium-ore", nil, { amount_min = 2, amount_max = 8 } }, -- avg; 5
            { "carbon",      1,   { probability = 0.70 } },
        },
        category = "centrifuging",
        show_amount_in_title = false,
    },
    {
        name = "fluorine-uranium-ore-uranium-238-uranium-235",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_placeholder(),
        },
        energy_required = 10,
        technology = { "uranium-processing", "cryogenic-plant" },
        fluid_ingredients = {
            { "fluorine", 25 },
        },
        ingredients = {
            { "uranium-ore", 10 },
        },
        results = {
            { "uranium-235", 1, { probability = 0.033 } }, -- ~5 times as much U235!!!
            { "uranium-238", 1, { probability = 0.967 } },
        },
        category = "centrifuging",
        show_amount_in_title = false,
    },
    {
        name = "fluorine-kovarex-enrichment-process",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_placeholder(),
        },
        energy_required = 30,
        technology = { "kovarex-enrichment-process", "cryogenic-plant" },
        fluid_ingredients = {
            { "fluorine", 50 },
        },
        ingredients = {
            { "uranium-235", 10, { ignored_by_stats = 10 } },
            { "uranium-238", 7,  { ignored_by_stats = 6 } },
        },
        results = {
            { "uranium-235", 11, { ignored_by_stats = 10, ignored_by_productivity = 10 } },
            { "uranium-238", 6,  { ignored_by_stats = 6, ignored_by_productivity = 6 } },
        },
        category = "centrifuging",
        show_amount_in_title = false,
    },
}, {
    type = "recipe",
})

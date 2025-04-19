vgal.data.extend({
    {
        name = "carbon-uranium-ore",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("carbon"),
            vgal.icon.get_out_to("uranium-ore"),
            vgal.icon.get_overlay("to"),
        },
        energy_required = 25,
        technology = { "uranium-processing", "space-platform" },
        ingredients = {
            { "carbon", 15 },
        },
        results = {
            { "uranium-ore", nil, { amount_min = 1, amount_max = 4 } }, -- avg; 2.5
            { "carbon",      1,   { amount_min = 1, amount_max = 2 } },
        },
        category = "centrifuging",
        show_amount_in_title = false,
    },
    -- {
    --     name = "fluorine-uranium-ore-uranium-238-uranium-235",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get_placeholder(),
    --     },
    --     energy_required = 10,
    --     technology = { "uranium-processing", "cryogenic-plant" },
    --     fluid_ingredients = {
    --         { "fluorine", 25 },
    --     },
    --     ingredients = {
    --         { "uranium-ore", 10 },
    --     },
    --     results = {
    --         { "uranium-235", 1, { probability = 0.056 } }, -- ~8 times as much U235!!!
    --         { "uranium-238", 1, { probability = 0.944 } },
    --     },
    --     category = "centrifuging",
    --     show_amount_in_title = false,
    -- },
    {
        name = "fluorine-kovarex-enrichment-process",
        prefix = "vgal",
        icons = vgal.icon.register {
            -- vgal.icon.get("kovarex-enrichment-process", "recipe"),
            -- vgal.icon.get_overlay("plus"),
            -- vgal.icon.get_placeholder(),
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/fluorine-kovarex-enrichment-process.png"),
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
        allow_quality = false,
        order = "bcb",
    },
    {
        name = "lithium-plate-uranium-fuel-cell",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("uranium-fuel-cell"),
            vgal.icon.get_in("lithium-plate"),
        },
        technology = { "nuclear-power", "lithium-processing" },
        ingredients = {
            { "lithium-plate", 1 },
            { "uranium-235",   1 },
            { "uranium-238",   9 },
        },
        results = {
            { "uranium-fuel-cell", 10 },
        },
        energy_required = 8,
        category = "crafting",
    },
}, {
    type = "recipe",
})

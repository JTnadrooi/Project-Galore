vgal.extend({
    {
        name = "lithium-plate-angels-uranium-fuel-cell",
        prefix = "vgal",
        energy_required = 700,
        technology = { "nuclear-power", "lithium-processing" },
        ingredients = {
            { "uranium-238",        99 },
            { "angels-uranium-234", 1 },
            { "lithium-plate",      20 },
        },
        results = {
            { "angels-uranium-fuel-cell", 100 },
        },
        category = "centrifuging",

        main_ingredient = "lithium-plate",
        allow_productivity = true,
    },
    {
        name = "lithium-plate-angels-mixed-oxide-cell",
        prefix = "vgal",
        energy_required = 80,
        technology = { "nuclear-power", "lithium-processing" },
        ingredients = {
            { "uranium-238",          15 },
            { "angels-plutonium-239", 2 },
            { "lithium-plate",        5 },
        },
        results = {
            { "angels-mixed-oxide-cell", 20 },
        },
        category = "centrifuging",

        main_ingredient = "lithium-plate",
        allow_productivity = true,
    },
    {
        name = "lithium-plate-angels-thorium-fuel-cell",
        prefix = "vgal",
        energy_required = 500,
        technology = { "nuclear-power", "lithium-processing" },
        ingredients = {
            { "angels-thorium-232",   17 },
            { "angels-plutonium-239", 8 },
            { "angels-curium-245",    1 },
            { "lithium-plate",        5 },
        },
        results = {
            { "angels-thorium-fuel-cell", 15 },
        },
        category = "centrifuging",

        main_ingredient = "lithium-plate",
        allow_productivity = true,
    },
}, {
    type = "recipe",
})

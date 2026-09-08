vgal.extend({
    {
        name = "coal-uranium-235-nuclear-fuel",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("nuclear-fuel"),
            vgal.icon.get_in("coal"),
        }),
        technology = "kovarex-enrichment-process",
        energy_required = 45,
        ingredients = {
            { "rocket-fuel", 1 },
            { "uranium-235", 1 },
            { "coal",        10 },
        },
        results = {
            { "nuclear-fuel", 1 },
        },
        category = "centrifuging",
    },
    {
        name = "uranium-235-uranium-238",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "arrow",
            inputs = { "uranium-235" },
            outputs = { "uranium-238" },
        }),
        technology = "uranium-processing",
        energy_required = 30,
        ingredients = {
            { "uranium-235", 1 },
        },
        results = {
            { "uranium-238", 1, { independent_probability = 0.25, } },
        },
        allow_productivity = false,
        category = "centrifuging",
    },
    {
        name = "low-density-structure-uranium-fuel-cell",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("uranium-fuel-cell"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
            vgal.icon.get_in2("low-density-structure"),
        }),
        technology = { "nuclear-power", "low-density-structure" },
        ingredients = {
            { "low-density-structure", 1 },
            { "uranium-235",           1 },
            { "uranium-238",           29 },
            { "sulfuric-acid",         20 },
        },
        results = {
            { "uranium-fuel-cell", 15 },
        },
        energy_required = 25,
        category = "crafting",
    },
}, {
    type = "recipe",
})

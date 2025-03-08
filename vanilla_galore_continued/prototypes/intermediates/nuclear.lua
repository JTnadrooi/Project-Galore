vgal.data.extend({
    {
        name = "coal-uranium-235-nuclear-fuel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("nuclear-fuel"),
            vgal.icon.get_in("coal"),
        },
        technology = "kovarex-enrichment-process",
        energy_required = 50,
        ingredients = {
            { "rocket-fuel", 1 },
            { "uranium-235",  1 },
            { "coal",        10 },
        },
        results = {
            { "nuclear-fuel", 1 },
        },
        category = "advanced-crafting",
    },
}, {
    type = "recipe",
})


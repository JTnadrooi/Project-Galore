vgal.data.extend({
    {
        type = "recipe",
        name = "carbon-lubricant",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("lubricant"),
            vgal.icon.get_in_fluid("carbon"),
        },
        category = "chemistry",
        energy_required = 1,
        technology = "space-platform",
        fluid_ingredients = {
            { "water", 30 },
        },
        ingredients = {
            { "carbon", 3 }, -- 100
        },
        fluid_results = {
            { "lubricant", 20 }, -- 60
        },
    },
}, {
    groups = { "vgal-removed" },
})

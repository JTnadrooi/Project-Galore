vgal.extend({
    {
        name = "vgal-tungsten-steel-powder",
        domain = "vgal",
        energy_required = 2,
        technology = "tungsten-steel",
        ingredients = {
            { "angels-powder-tungsten", 6 },
            { "angels-powder-steel",    6 },
        },
        results = {
            { "vgal-tungsten-steel-powder", 12 },
        },
        category = "angels-powder-mixing",

        main_recipe = true,
        allow_productivity = true,
    },
}, {
    type = "recipe",
})

vgal.data.extend({
    {
        name = "angels-catalysator-brown-iron-ore",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels_sorting", "raw"),
            vgal.icon.get_out2("iron-ore"),
        },
        energy_required = 1.5,
        technology = "angels-advanced-ore-refining-1",
        ingredients = {
            { "iron-plate", 3 },
        },
        results = {
            { "iron-ore", 6 },
        },
        category = "angels-ore-sorting",
    },
}, {
    type = "recipe",
})

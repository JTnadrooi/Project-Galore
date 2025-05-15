vgal.data.extend({
    {
        name = "angels-iron-pebbles-angels-iron-nugget",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-iron-nugget"),
            vgal.icon.get_overlay("angels-iron-pebbles"),
        },
        energy_required = 1.5,
        technology = "advanced-ore-refining-1",
        ingredients = {
            { "angels-iron-nugget", 3 },
        },
        results = {
            { "angels-iron-pebbles", 6 },
        },
        category = "ore-refining-t1",
    },
    {
        name = "angels-copper-pebbles-angels-copper-nugget",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-copper-nugget"),
            vgal.icon.get_overlay("angels-copper-pebbles"),
        },
        energy_required = 1.5,
        technology = "advanced-ore-refining-1",
        ingredients = {
            { "angels-copper-nugget", 3 },
        },
        results = {
            { "angels-copper-pebbles", 6 },
        },
        category = "ore-refining-t1",
    },
}, {
    type = "recipe",
})

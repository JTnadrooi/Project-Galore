vgal.data.extend({
    {
        name = "sulfuric-acid-angels-solid-carbon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-carbon"),
            vgal.icon.get_in("sulfuric-acid"),
        },
        energy_required = 1,
        technology = "angels-sulfur-processing-1",
        fluid_ingredients = {
            { "sulfuric-acid", 5 },
        },
        ingredients = {
            { "angels-solid-coke", 2 },
        },
        fluid_results = {
            { "angels-water-yellow-waste", 5 },
        },
        results = {
            { "angels-solid-carbon", 3 },
        },
        category = "angels-liquifying",
    }
}, {
    type = "recipe",
})

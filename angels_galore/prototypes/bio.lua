vgal.data.extend({
    {
        name = "angels-solid-leafs-angels-cellulose-fiber",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-cellulose-fiber"),
            vgal.icon.get_in("angels-solid-leafs"),
        },
        energy_required = 1,
        technology = "angels-bio-arboretum-1",
        ingredients = {
            { "angels-solid-leafs", 10 },
        },
        results = {
            { "angels-cellulose-fiber", 2 },
        },
        category = "crafting",
    },
    { -- meat void
        name = "angels-bio-raw-meat-angels-liquid-nutrient-pulp",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-liquid-nutrient-pulp"),
            vgal.icon.get_in("angels-bio-raw-meat"),
        },
        energy_required = 2,
        technology = "angels-bio-refugium-butchery-1",
        ingredients = {
            { "angels-bio-raw-meat", 5 },
        },
        fluid_results = {
            { "angels-liquid-nutrient-pulp", 20 },
        },
        order = "a[nutrient-extraction]-g",
        category = "angels-nutrient-extractor",
    },
}, {
    type = "recipe",
})

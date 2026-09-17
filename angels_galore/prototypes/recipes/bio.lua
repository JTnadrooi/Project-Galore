vgal.extend({
    {
        name = "angels-solid-leafs-angels-cellulose-fiber",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("angels-cellulose-fiber"),
            vgal.icon.get_in("angels-solid-leafs"),
        }),
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
    {
        name = "angels-tree-seed-angels-cellulose-fiber",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("angels-cellulose-fiber"),
            vgal.icon.get_in("angels-tree-seed"),
        }),
        energy_required = 1,
        technology = "angels-bio-arboretum-1",
        ingredients = {
            { "angels-tree-seed", 6 },
        },
        results = {
            { "angels-cellulose-fiber", 1 },
        },
        category = "crafting",
    },
    { -- meat void
        name = "angels-bio-raw-meat-angels-liquid-nutrient-pulp",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("angels-liquid-nutrient-pulp"),
            vgal.icon.get_in("angels-bio-raw-meat"),
        }),
        energy_required = 2,
        technology = "angels-bio-refugium-butchery-1",
        ingredients = {
            { "angels-bio-raw-meat", 5 },
        },
        results = {
            { "angels-liquid-nutrient-pulp", 20 },
        },
        order = "a[nutrient-extraction]-g",
        category = "angels-nutrient-extractor",
    },
    {
        name = "angels-liquid-nutrient-pulp-angels-liquid-glycerol-angels-liquid-propionic-acid",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-liquid",
            inputs = {},
            outputs = { "angels-liquid-propionic-acid", "angels-gas-propene" },
            palette = { { 214, 146, 040 }, { 169, 130, 039 }, { 120, 083, 004 } },
        }),
        energy_required = 2,
        technology = { "angels-bio-plastic-2", "angels-explosives-2", "angels-advanced-gas-processing" },
        ingredients = {
            { "angels-liquid-nutrient-pulp", 100 },
            { "angels-liquid-glycerol",      15 },
        },
        results = {
            { "angels-liquid-propionic-acid", 45 },
            { "angels-gas-propene",           30 },
        },
        category = "angels-advanced-gas-refining",

        allow_productivity = false,

        subgroup = "vgal-bio-nutrient-chemistry",
        order = "e",
    },
}, {
    type = "recipe",
})

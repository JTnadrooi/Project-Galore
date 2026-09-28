vgal.extend({
    {
        name = "angels-electrode-used-angels-solid-carbon-angels-electrode",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("angels-electrode"),
            vgal.icon.get_in("angels-solid-carbon"),
        }),
        energy_required = 1,
        technology = "angels-basic-chemistry-3",
        ingredients = {
            { "angels-solid-carbon",   1 },
            { "angels-electrode-used", 1 },
        },
        results = {
            { "angels-electrode", 1 },
        },
        category = "crafting",

        order = "ab",
        allow_productivity = false,
    },
    {
        name = "angels-water-mineralized-lubricant",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-liquid",
            inputs = { "angels-water-mineralized" },
            outputs = { "lubricant" },
            palette = { { 063, 189, 063 }, { 058, 173, 58 }, { 053, 159, 053 } },
        }),
        energy_required = 4,
        technology = "lubricant",
        ingredients = {
            { "angels-liquid-mineral-oil", 40 },
            { "angels-water-mineralized",  10 },
        },
        results = {
            { "lubricant", 30 },
        },
        category = "chemistry",

        -- order = "gb",
        allow_productivity = true,
    },
    {
        name = "angels-liquid-phenol-lubricant",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-liquid",
            inputs = { "angels-liquid-phenol" },
            outputs = { "lubricant" },
            palette = { { 063, 189, 063 }, { 058, 173, 58 }, { 053, 159, 053 } },
        }),
        energy_required = 4,
        technology = { "lubricant", "angels-advanced-chemistry-3" },
        ingredients = {
            { "angels-liquid-mineral-oil", 40 },
            { "angels-liquid-phenol",      10 },
        },
        results = {
            { "lubricant", 50 },
        },
        category = "chemistry",

        -- order = "gb",
        allow_productivity = true,
    },
    {
        name = "angels-liquid-concrete-refined-concrete",
        prefix = "vgal",
        energy_required = 15,
        technology = "angels-stone-smelting-2",
        ingredients = {
            { "angels-liquid-concrete", 200 },
            { "steel-plate",            1 },
            { "iron-stick",             5 },
        },
        results = {
            { "refined-concrete", 10 },
        },
        category = "crafting-with-fluid",
    },
}, {
    type = "recipe",
})

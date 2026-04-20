vgal.data.extend({
    {
        name = "angels-gas-propene-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("propene", "molecule"),
        },
        energy_required = 2,
        technology = "angels-plastic-1",
        fluid_ingredients = {
            { "angels-gas-propene", 40 },
        },
        results = {
            { "plastic-bar", 5 },
        },
        category = "angels-liquifying",
        order = "aa"
    },
    {
        name = "angels-liquid-naphtha-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("angels-liquid-naphtha"),
        },
        energy_required = 4,
        technology = "angels-plastic-2",
        fluid_ingredients = {
            { "angels-liquid-naphtha",      20 },
            { "angels-liquid-polyethylene", 20 },
        },
        results = {
            { "plastic-bar", 10 },
        },
        category = "chemistry",
        order = "ab"
    },
    {
        name = "angels-liquid-phenol-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("phenol", "molecule"),
        },
        energy_required = 2,
        technology = "angels-plastic-3",
        fluid_ingredients = {
            { "angels-liquid-phenol", 10 },
            { "angels-gas-methanol",  15 },
        },
        results = {
            { "plastic-bar", 6 },
        },
        category = "chemistry",
        order = "ac"
    },
    {
        name = "angels-liquid-cellulose-acetate-mixture-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("acetone", "molecule"),
        },
        energy_required = 4,
        technology = "angels-bio-plastic-1",
        fluid_ingredients = {
            { "angels-liquid-cellulose-acetate-mixture", 20 },
            { "angels-gas-acetone",                      25 },
        },
        results = {
            { "plastic-bar", 8 },
        },
        category = "chemistry",
        order = "ba"
    },
    {
        name = "angels-liquid-propionic-acid-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("propionic-acid", "molecule"),
            vgal.icon.get_in2("angels-cellulose-fiber"),
        },
        energy_required = 6,
        technology = "angels-bio-plastic-2",
        ingredients = {
            { "angels-cellulose-fiber", 5 },
        },
        fluid_ingredients = {
            { "angels-liquid-propionic-acid", 25 },
            { "angels-liquid-acetic-acid",    20 },
        },
        results = {
            { "plastic-bar", 12 },
        },
        category = "chemistry",
        order = "bb"
    },
}, {
    type = "recipe",
})

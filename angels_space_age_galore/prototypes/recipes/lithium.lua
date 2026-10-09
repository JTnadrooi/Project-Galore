local lithium = vgal.defines.metal_lithium

vgal.extend({
    {
        name = lithium.molten,
        domain = "vgal",
        energy_required = 1,
        technology = "lithium-processing",
        ingredients = {
            { lithium.ingot, 12 },
        },
        results = {
            { lithium.molten, 120 },
        },
        category = "angels-induction-smelting",

        main_recipe = true,
        allow_productivity = true,
    },
    {
        name = lithium.roll,
        domain = "vgal",
        energy_required = 2,
        technology = "lithium-processing",
        ingredients = {
            { lithium.molten,          160 },
            { "angels-liquid-coolant", 40 },
        },
        results = {
            { lithium.roll,                 4 },
            { "angels-liquid-coolant-used", 40, { temperature = 300, allow_productivity = false } },
        },
        category = "angels-strand-casting",

        main_recipe = true,
        allow_productivity = true,
    },
    {
        name = "vgal-concentrated-lithium-brine",
        domain = "vgal",
        energy_required = 600,
        technology = "lithium-processing",
        ingredients = {
            { "lithium-brine", 500 }, -- about 50 lithium in vanilla, should mirror in ASAGAL
        },
        results = {
            { "vgal-concentrated-lithium-brine", 100 },
        },
        category = "angels-salination-plant",

        main_recipe = true,
        allow_productivity = true,
    },
    {
        name = "vgal-lithium-carbonate",
        domain = "vgal",
        energy_required = 4,
        technology = "lithium-processing",
        ingredients = {
            { "vgal-concentrated-lithium-brine", 20 },
            { "angels-gas-ammonia",              20 },
            { "angels-solid-sodium-carbonate",   1 },
            { "vgal-powder-holmium",             10 },
        },
        results = {
            { "vgal-lithium-carbonate", 6 },
        },
        category = "chemistry",

        main_recipe = true,
        allow_productivity = false,
    },
    {
        name = "vgal-lithium-chloride",
        domain = "vgal",
        energy_required = 4,
        technology = "lithium-processing",
        ingredients = {
            { "vgal-lithium-carbonate",       6 },
            { "angels-gas-hydrogen-chloride", 250 },
        },
        results = {
            { "vgal-lithium-chloride", 5 },
        },
        category = "chemistry",

        main_recipe = true,
        allow_productivity = false,
    },
    {
        name = lithium.ingot,
        domain = "vgal",
        energy_required = 4,
        technology = "lithium-processing",
        ingredients = {
            { lithium.ore,                 12 },
            { "angels-liquid-mineral-oil", 50 },
        },
        results = {
            { lithium.ingot, 12 },
        },
        categories = { "angels-chemical-smelting", "metallurgy" },

        main_recipe = true,
        allow_productivity = true,
    },
    {
        name = "vgal-roll-lithium-holmium-plate",
        prefix = "vgal",
        energy_required = 0.5,
        technology = "lithium-processing",
        ingredients = {
            { "vgal-roll-lithium", 1 },
        },
        results = {
            { lithium.plate, 4 },
        },
        category = "crafting",
    },
}, {
    type = "recipe",
})

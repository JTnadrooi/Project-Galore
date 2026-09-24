local holmium = vgal.defines.metal_holmium

-- main recipes
vgal.extend({
    {
        name = holmium.processed,
        domain = "vgal",
        energy_required = 2,
        technology = "vgal-holmium-smelting-2",
        ingredients = {
            { holmium.ore, 4 },
        },
        results = {
            { holmium.processed, 2 },
        },
        category = "angels-ore-processing",

        main_recipe = true,
        allow_productivity = true,
    },
    {
        name = holmium.pellet,
        domain = "vgal",
        energy_required = 2,
        technology = "vgal-holmium-smelting-3",
        ingredients = {
            { holmium.processed,     3 },
            { "angels-solid-cement", 1 },
        },
        results = {
            { holmium.pellet, 4 },
        },
        category = "angels-pellet-pressing",

        main_recipe = true,
        allow_productivity = true,
    },
    {
        name = holmium.molten,
        domain = "vgal",
        energy_required = 1,
        technology = "vgal-holmium-smelting-1",
        ingredients = {
            { holmium.ingot, 12 },
        },
        results = {
            { holmium.molten, 120 },
        },
        category = "angels-induction-smelting",

        main_recipe = true,
        allow_productivity = true,
    },
    {
        name = holmium.roll,
        domain = "vgal",
        energy_required = 1,
        technology = "vgal-holmium-smelting-2",
        ingredients = {
            { holmium.molten, 80 },
            { "water",        40 },
        },
        results = {
            { holmium.roll, 2 },
        },
        category = "angels-strand-casting",

        main_recipe = true,
        allow_productivity = true,
    },
    {
        name = holmium.powder,
        domain = "vgal",
        energy_required = 1,
        technology = "vgal-holmium-smelting-3",
        ingredients = {
            { holmium.ingot, 1 },
        },
        results = {
            { holmium.powder, 1 },
        },
        category = "angels-powderizing-1",

        main_recipe = true,
    },
    {
        name = "vgal-holmium-oxide",
        domain = "vgal",
        energy_required = 2,
        technology = "vgal-holmium-smelting-2",
        ingredients = {
            { holmium.processed,   4 },
            { "angels-gas-oxygen", 30 },
        },
        results = {
            { "vgal-holmium-oxide", 12 },
        },
        category = "vgal-blast-chemistry",

        main_recipe = true,
        allow_productivity = true,
    },
    {
        name = "vgal-holmium-chloride",
        domain = "vgal",
        energy_required = 4,
        technology = "vgal-holmium-smelting-1",
        ingredients = {
            { "holmium-solution",             120 },
            { "angels-gas-hydrogen-chloride", 20 },
        },
        results = {
            { "vgal-holmium-chloride", 6 },
        },
        category = "chemistry",

        main_recipe = true,
        allow_productivity = true,
    },
    {
        name = "vgal-holmium-fluoride",
        domain = "vgal",
        energy_required = 4,
        technology = "vgal-holmium-smelting-3",
        ingredients = {
            { holmium.pellet, 4 },
            { "fluorine",     20 },
        },
        results = {
            { "vgal-holmium-fluoride", 12 },
        },
        category = "vgal-blast-chemistry",

        main_recipe = true,
        allow_productivity = true,
    },
    {
        name = "vgal-holmium-fluoride-vgal-holmium-oxide",
        prefix = "vgal",
        energy_required = 2,
        technology = "vgal-holmium-smelting-3",
        ingredients = {
            { "vgal-holmium-fluoride", 12 },
            { "steam",                 60 },
        },
        results = {
            { "vgal-holmium-oxide",           12 },
            { "angels-gas-hydrogen-fluoride", 30, { allow_productivity = false } },
        },
        category = "chemistry",

        order = "cab",
        allow_productivity = true,
    },
    {
        name = "vgal-holmium-oxide-holmium-solution",
        prefix = "vgal",
        energy_required = 2,
        technology = "vgal-holmium-smelting-2",
        ingredients = {
            { "vgal-holmium-oxide",    1 },
            { "angels-water-purified", 10 },
            { "angels-gas-chlorine",   15 },
            -- { "angels-liquid-hydrochloric-acid", 20 },
        },
        results = {
            { "holmium-solution", 60 },
        },
        category = "chemistry",

        allow_productivity = true,
    },
    {
        name = holmium.ingot,
        domain = "vgal",
        energy_required = 4,
        technology = "vgal-holmium-smelting-1",
        ingredients = {
            { "vgal-holmium-chloride", 8 },
            { "angels-stone-crushed",  2 },
        },
        results = {
            { holmium.ingot,                   12 },
            { "angels-solid-calcium-chloride", 1, { allow_productivity = false } },
        },
        category = "angels-blast-smelting",

        allow_productivity = true,
    },
    {
        name = "vgal-roll-holmium-holmium-plate",
        prefix = "vgal",
        energy_required = 0.5,
        technology = "vgal-holmium-smelting-2",
        ingredients = {
            { "vgal-roll-holmium", 1 },
        },
        results = {
            { holmium.plate, 4 },
        },
        category = "crafting",
    },
}, {
    type = "recipe",
})

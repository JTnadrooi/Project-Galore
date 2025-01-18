vgal.data.extend
{
    {
        name = "sulfuric-acid-advanced-circuit",
        prefix = "vgal",
        technology = "advanced-circuit",
        icons = vgal.icon.register {
            vgal.icon.get("advanced-circuit"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
        },
        energy_required = 32,
        ingredients = {
            { "copper-cable",       8 }, -- 40
            { "electronic-circuit", 6 }, -- 150
            { "plastic-bar",        8 }, -- 120
        },
        fluid_ingredients = {
            { "sulfuric-acid", 40 }, -- 60
        },
        results = {
            { "advanced-circuit", 4 } -- 400
        },
        category = "crafting-with-fluid",
    },
    {
        name = "wood-electronic-circuit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("wood"),
        },
        technology = "electronics",
        energy_required = 0.5,
        ingredients = {
            { "wood",         1 },
            { "copper-cable", 3 },
        },
        results = {
            { "electronic-circuit", 1 }
        },
        category = "crafting",
        groups = { "wood-recipe" },
    },
    {
        name = "wood-heavy-oil-electronic-circuit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("wood"),
            vgal.icon.get_in2("heavy-oil", "fluid"),
        },
        technology = "advanced-oil-processing",
        energy_required = 1,
        ingredients = {
            { "wood",         1 },
            { "copper-cable", 6 },
        },
        fluid_ingredients = {
            { "heavy-oil", 5 },
        },
        results = {
            { "electronic-circuit", 2 }
        },
        category = "crafting-with-fluid",
        groups = { "wood-recipe" },
    },
    {
        name = "plastic-bar-electronic-circuit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("plastic-bar"),
        },
        technology = "plastics",
        energy_required = 0.5,
        ingredients = {
            { "plastic-bar",  1 }, -- 15
            { "copper-cable", 2 }, -- 10
        },
        results = {
            { "electronic-circuit", 1 }, -- 25
        },
    },
    {
        name = "plastic-bar-processing-unit",
        prefix = "vgal",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("processing-unit"),
            vgal.icon.get_in("plastic-bar")
        },
        technology = "processing-unit",
        energy_required = 10,
        ingredients = {
            { "plastic-bar",        6 }, -- 90
            { "electronic-circuit", 6 }, -- 150
            { "advanced-circuit",   4 }, -- 400
        },
        fluid_ingredients = {
            { "sulfuric-acid", 5 }, -- 10
        },
        results = {
            { "processing-unit", 1 }, -- 710
        },
    },
    {
        name = "low-density-structure-processing-unit",
        prefix = "vgal",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("processing-unit"),
            vgal.icon.get_in("low-density-structure")
        },
        technology = { "low-density-structure", "processing-unit" },
        energy_required = 8,
        ingredients = {
            { "low-density-structure", 1 }, -- 375
            { "advanced-circuit",      2 }, -- 200
            { "electronic-circuit",    4 }, -- 100
        },
        fluid_ingredients = {
            { "sulfuric-acid", 5 }, -- 10
        },
        results = {
            { "processing-unit", 1 }, -- 710
        },
    },
}

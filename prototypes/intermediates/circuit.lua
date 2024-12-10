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
        category = "crafting-with-fluid"
    },
    {
        name = "iron-gear-wheel-advanced-circuit", -- analog
        prefix = "vgal",
        technology = { "advanced-circuit", "sulfur-processing" },
        icons = vgal.icon.register {
            vgal.icon.get("advanced-circuit"),
            vgal.icon.get_in("iron-gear-wheel"),
            vgal.icon.get_in2("sulfur"),
        },
        energy_required = 18,
        ingredients = {
            { "copper-cable",    4 }, -- 20
            { "iron-gear-wheel", 8 }, -- 160
            { "iron-stick",      4 }, -- 20
            { "steel-plate",     2 }, -- 100
        },
        results = {
            { "advanced-circuit", 3 }, -- 300
        },
        category = "crafting",
        auto_localise = false,
    },
    {
        name = "iron-gear-wheel-lubricant-advanced-circuit", -- analog
        prefix = "vgal",
        technology = "lubricant",
        icons = vgal.icon.register {
            vgal.icon.get("advanced-circuit"),
            vgal.icon.get_in("iron-gear-wheel"),
            vgal.icon.get_in2("lubricant", "fluid"),
        },
        energy_required = 18,
        ingredients = {
            { "copper-cable",    2 }, -- 10
            { "iron-gear-wheel", 6 }, -- 120
            { "iron-stick",      4 }, -- 20
            { "steel-plate",     2 }, -- 100
        },
        fluid_ingredients = {
            { "lubricant", 20 }, -- 50
        },
        results = {
            { "advanced-circuit", 3 }
        },
        category = "crafting-with-fluid",
        auto_localise = false,
    },
    {
        name = "iron-gear-wheel-lubricant-electronic-circuit", -- analog
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("iron-gear-wheel"),
            vgal.icon.get_in2("lubricant", "fluid"),
        },
        technology = "lubricant",
        energy_required = 0.5,
        ingredients = {
            { "iron-gear-wheel", 1 },
            { "iron-stick",      1 }
        },
        fluid_ingredients = {
            { "lubricant", 1 },
        },
        results = {
            { "electronic-circuit", 1 }
        },
        category = "crafting-with-fluid",
        auto_localise = false,
    },
    {
        name = "iron-gear-wheel-electronic-circuit", -- analog
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("iron-gear-wheel"),
        },
        technology = "electronics",
        energy_required = 0.5,
        ingredients = {
            { "iron-gear-wheel", 1 }, -- 20
            { "iron-stick",      2 }, -- 10
        },
        results = {
            { "electronic-circuit", 1 }
        },
        category = "crafting",
        auto_localise = false,
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
        name = "sulfuric-electronic-circuit",
        prefix = "vgal",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
        },
        technology = "sulfur-processing",
        energy_required = 4,
        ingredients = {
            { "iron-plate",   6 },  -- 60
            { "copper-cable", 18 }, -- 90
        },
        fluid_ingredients = {
            { "sulfuric-acid", 20 }, -- 30
        },
        results = {
            { "electronic-circuit", 10 }, -- 300
            { "copper-ore",         1, 0.8 },
            { "iron-ore",           1, 0.8 },
        },
    },
    {
        name = "advanced-circuit-processing-unit",
        prefix = "vgal",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("processing-unit"),
            vgal.icon.get_in("advanced-circuit")
        },
        technology = "processing-unit",
        energy_required = 10,
        ingredients = {
            { "copper-plate",     4 }, -- 40
            { "copper-cable",     5 }, -- 25
            { "advanced-circuit", 6 }, -- 600
        },
        fluid_ingredients = {
            { "sulfuric-acid", 10 }, -- 15
        },
        results = {
            { "processing-unit", 1 }, -- 710
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
            { "electronic-circuit", 8 }, -- 200
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
        name = "iron-gear-wheel-processing-unit", -- analog
        prefix = "vgal",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("processing-unit"),
            vgal.icon.get_in("engine-unit")
        },
        technology = "processing-unit",
        energy_required = 8,
        ingredients = {
            { "engine-unit",      2 }, -- 180
            { "pipe",             8 }, -- 80
            { "iron-gear-wheel",  2 }, -- 40
            { "advanced-circuit", 4 }, -- 400
        },
        fluid_ingredients = {
            { "sulfuric-acid", 5 }, -- 10
        },
        results = {
            { "processing-unit", 1 }, -- 710
        },
        auto_localise = false,
    },
    {
        name = "iron-gear-wheel-lubricant-processing-unit", -- analog
        prefix = "vgal",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("processing-unit"),
            vgal.icon.get_in("engine-unit"),
            vgal.icon.get_in2("lubricant", "fluid"),
        },
        technology = { "lubricant", "processing-unit" },
        energy_required = 8,
        ingredients = {
            { "engine-unit",      2 }, -- 180
            { "pipe",             3 }, -- 30
            { "iron-gear-wheel",  2 }, -- 40
            { "advanced-circuit", 4 }, -- 400
        },
        fluid_ingredients = {
            { "lubricant", 5 }, -- 15
        },
        results = {
            { "processing-unit", 1 }, -- 710
        },
        auto_localise = false,
    },
    {
        name = "efficiency-module-processing-unit",
        prefix = "vgal",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("processing-unit"),
            vgal.icon.get_in("efficiency-module")
        },
        technology = "efficiency-module-2",
        energy_required = 16,
        ingredients = {
            { "efficiency-module", 2 }, -- 1250
            { "advanced-circuit",  1 }, -- 100
        },
        fluid_ingredients = {
            { "sulfuric-acid", 10 }, -- 15
        },
        results = {
            { "processing-unit", 2 }, -- 1420
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
            { "low-density-structure", 1 },
            { "advanced-circuit",      2 },
            { "electronic-circuit",    4 },
        },
        fluid_ingredients = {
            { "sulfuric-acid", 5 },
        },
        results = {
            { "processing-unit", 1 },
        },
    },
}

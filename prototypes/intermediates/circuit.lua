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
            { "copper-cable",       8 },
            { "electronic-circuit", 4 },
            { "plastic-bar",        8 },
        },
        fluid_ingredients = {
            { "sulfuric-acid", 40 },
        },
        results = {
            { "advanced-circuit", 4 }
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
            { "sulfur",          1 },
            { "iron-gear-wheel", 8 },
            { "iron-stick",      4 },
            { "steel-plate",     2 },
        },
        results = {
            { "advanced-circuit", 3 }
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
        energy_required = 6,
        ingredients = {
            { "iron-gear-wheel", 6 },
            { "iron-stick",      4 },
            { "steel-plate",     2 },
            { "iron-plate",      2 },
        },
        fluid_ingredients = {
            { "lubricant", 20 },
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
            { "iron-gear-wheel", 1 },
            { "iron-stick",      2 }
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
            { "plastic-bar",  1 },
            { "copper-cable", 2 }
        },
        results = {
            { "electronic-circuit", 1 }
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
            { "iron-plate",   6 },
            { "copper-cable", 12 },
        },
        fluid_ingredients = {
            { "sulfuric-acid", 20 },
        },
        results = {
            { "electronic-circuit", 12 },
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
            { "copper-plate",     4 },
            { "advanced-circuit", 6 },
        },
        fluid_ingredients = {
            { "sulfuric-acid", 10 },
        },
        results = {
            { "processing-unit", 1 },
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
            { "plastic-bar",        6 },
            { "electronic-circuit", 5 },
            { "advanced-circuit",   4 },
        },
        fluid_ingredients = {
            { "sulfuric-acid", 5 },
        },
        results = {
            { "processing-unit", 1 },
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
            { "engine-unit",      2 },
            { "pipe",             2 },
            { "iron-gear-wheel",  2 },
            { "advanced-circuit", 2 },
        },
        fluid_ingredients = {
            { "sulfuric-acid", 5 },
        },
        results = {
            { "processing-unit", 1 },
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
            { "engine-unit",      2 },
            { "pipe",             2 },
            { "iron-gear-wheel",  2 },
            { "advanced-circuit", 2 },
        },
        fluid_ingredients = {
            { "lubricant", 5 },
        },
        results = {
            { "processing-unit", 1 },
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
            { "efficiency-module", 2 },
            { "advanced-circuit",  1 },
        },
        fluid_ingredients = {
            { "sulfuric-acid", 5 },
        },
        results = {
            { "processing-unit", 2 },
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

vgal.data.extend
{
    -- region *sulfuric-acid-advanced-circuit
    {
        name = "sulfuric-acid-advanced-circuit",
        prefix = "vgal",
        technology = "advanced-circuit",
        icons = vgal.icon.register {
            vgal.icon.get("advanced-circuit"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
        },
        energy_required = 16,
        ingredients = {
            { "copper-cable",       8 },
            { "electronic-circuit", 4 },
            { "plastic-bar",        8 },
        },
        fluid_ingredients = {
            { "sulfuric-acid", 40 },
        },
        results = {
            { "advanced-circuit", 8 }
        },
        category = "crafting-with-fluid"
    },
    -- endregion
    -- region *iron-gear-wheel-advanced-circuit
    {
        name = "iron-gear-wheel-advanced-circuit",
        prefix = "vgal",
        technology = "advanced-circuit",
        icons = vgal.icon.register {
            vgal.icon.get("advanced-circuit"),
            vgal.icon.get_in("iron-gear-wheel"),
        },
        energy_required = 6,
        ingredients = {
            { "sulfur",          1 },
            { "iron-gear-wheel", 8 },
            { "iron-stick",      4 },
            { "steel-plate",     2 },
        },
        results = {
            { "advanced-circuit", 3 }
        },
        category = "crafting"
    },
    -- endregion
    -- region *iron-gear-wheel-electronic-circuit
    {
        name = "iron-gear-wheel-electronic-circuit",
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
    },
    -- endregion
    -- region *electronic-circuit-from-plastic-bar
    {

        name = "electronic-circuit-from-plastic-bar",
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
    -- endregion
    -- region *sulfuric-electronic-circuit
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
        subgroup = data.raw.item["electronic-circuit"].subgroup,
        order = data.raw.item["electronic-circuit"].order
    },
    -- endregion

    -- region *processing-unit-from-advanced-circuit
    {

        name = "processing-unit-from-advanced-circuit",
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
        main_product = "processing-unit",
    },
    -- endregion
    -- region *plastic-bar-processing-unit
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
        main_product = "processing-unit",
    },
    -- endregion
    -- region *iron-gear-wheel-processing-unit
    {

        name = "iron-gear-wheel-processing-unit",
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
        main_product = "processing-unit",
    },
    -- endregion
    -- region *efficiency-module-processing-unit
    {
        name = "efficiency-module-processing-unit", -- ISSUE #10
        prefix = "vgal",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("processing-unit"),
            vgal.icon.get_in("efficiency-module")
        },
        technology = "processing-unit",
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
        main_product = "processing-unit",
    },
    -- endregion
}

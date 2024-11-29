vgal.data.extend
{
    -- region *advanced-circuit-from-sulfuric-acid
    {
        type = "recipe",
        name = "vgal-advanced-circuit-from-sulfuric-acid",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("advanced-circuit"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
        },
        energy_required = 16,
        ingredients = {
            { type = "fluid", name = "sulfuric-acid",      amount = 36 },
            { type = "item",  name = "copper-cable",       amount = 8 },
            { type = "item",  name = "electronic-circuit", amount = 4 },
            { type = "item",  name = "plastic-bar",        amount = 8 },
        },
        results = {
            { type = "item", name = "advanced-circuit", amount = 8 }
        },
        category = "crafting-with-fluid"
    },
    -- endregion
    -- region *advanced-circuit-from-iron-gear-wheel
    {
        type = "recipe",
        name = "vgal-advanced-circuit-from-iron-gear-wheel",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("advanced-circuit"),
            vgal.icon.get_in("iron-gear-wheel"),
        },
        energy_required = 6,
        ingredients = {
            { type = "item", name = "sulfur",          amount = 1 },
            { type = "item", name = "iron-gear-wheel", amount = 8 },
            { type = "item", name = "iron-stick",      amount = 4 },
            { type = "item", name = "steel-plate",     amount = 2 },
        },
        results = {
            { type = "item", name = "advanced-circuit", amount = 3 }
        },
        category = "crafting"
    },
    -- endregion

    -- region *electronic-circuit-from-iron-gear-wheel
    {
        type = "recipe",
        name = "vgal-electronic-circuit-from-iron-gear-wheel",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("iron-gear-wheel"),
        },
        enabled = false,
        energy_required = data.raw["recipe"]["electronic-circuit"].energy_required,
        ingredients = {
            { "iron-gear-wheel", 1 },
            { "iron-stick",      2 }
        },
        result = "electronic-circuit",
        result_count = 1
    },
    -- endregion
    -- region *electronic-circuit-from-plastic-bar
    {
        type = "recipe",
        name = "vgal-electronic-circuit-from-plastic-bar",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("plastic-bar"),
        },
        enabled = false,
        energy_required = data.raw["recipe"]["electronic-circuit"].energy_required,
        ingredients = {
            { "plastic-bar",  1 },
            { "copper-cable", 2 }
        },
        result = "electronic-circuit",
        result_count = 1
    },
    -- endregion
    -- region *sulfuric-electronic-circuit
    {
        type = "recipe",
        name = "vgal-sulfuric-electronic-circuit",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
        },
        enabled = false,
        energy_required = 4,
        ingredients = {
            { "iron-plate",   6 },
            { "copper-cable", 12 },
            { type = "fluid", name = "sulfuric-acid", amount = 20 }
        },
        results = {
            { "electronic-circuit", 12 },
            { "copper-ore",         1 },
            { "iron-ore",           1 },
        },
        subgroup = data.raw.item["electronic-circuit"].subgroup,
        order = data.raw.item["electronic-circuit"].order
    },
    -- endregion
    -- region *electronic-circuit-from-wood-pellets
    {
        type = "recipe",
        name = "vgal-electronic-circuit-from-wood-pellets",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            --vgal.icon.get_in(vgal.item.get_item_or_invalid_name("wood-pellet")),
        },
        enabled = false,
        energy_required = 0.5,
        ingredients = {
            { vgal.item.get_item_or_invalid_name("wood-pellet"), 1 },
            { "copper-cable",                                    3 },
        },
        results = {
            { "electronic-circuit", 1 },
        },
        main_product = "electronic-circuit",
    },
    -- endregion

    -- region *processing-unit-from-advanced-circuit
    {
        type = "recipe",
        name = "vgal-processing-unit-from-advanced-circuit",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("processing-unit"),
            vgal.icon.get_in("advanced-circuit")
        },
        enabled = false,
        energy_required = 10,
        ingredients = {
            { "copper-plate",     4 },
            { "advanced-circuit", 6 },
            { type = "fluid",     name = "sulfuric-acid", amount = 10 }
        },
        results = {
            { "processing-unit", 1 },
        },
        main_product = "processing-unit",
    },
    -- endregion
    -- region *processing-unit-from-plastic-bar
    {
        type = "recipe",
        name = "vgal-processing-unit-from-plastic-bar",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("processing-unit"),
            vgal.icon.get_in("plastic-bar")
        },
        enabled = false,
        energy_required = 10,
        ingredients = {
            { "plastic-bar",        6 },
            { "electronic-circuit", 5 },
            { "advanced-circuit",   4 },
            { type = "fluid",       name = "sulfuric-acid", amount = 5 }
        },
        results = {
            { "processing-unit", 1 },
        },
        main_product = "processing-unit",
    },
    -- endregion
    -- region *processing-unit-from-iron-gear-wheel
    {
        type = "recipe",
        name = "vgal-processing-unit-from-iron-gear-wheel",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("processing-unit"),
            vgal.icon.get_in("engine-unit")
        },
        enabled = false,
        energy_required = 8,
        ingredients = {
            { "engine-unit",      2 },
            { "pipe",             2 },
            { "iron-gear-wheel",  2 },
            { "advanced-circuit", 2 },
            { type = "fluid",     name = "sulfuric-acid", amount = 5 }
        },
        results = {
            { "processing-unit", 1 },
        },
        main_product = "processing-unit",
    },
    -- endregion
    -- region *processing-unit-from-effectivity-module
    {
        type = "recipe",
        name = "vgal-processing-unit-from-effectivity-module",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("processing-unit"),
            vgal.icon.get_in("effectivity-module")
        },
        enabled = false,
        energy_required = 16,
        ingredients = {
            { "effectivity-module", 2 },
            { "advanced-circuit",   1 },
            { type = "fluid",       name = "sulfuric-acid", amount = 8 }
        },
        results = {
            { "processing-unit", 2 },
        },
        main_product = "processing-unit",
    },
    -- endregion
}
vgal.tech.add_recipe("vgal-sulfuric-intermediates-2", "vgal-advanced-circuit-from-sulfuric-acid")
vgal.tech.add_recipe("sulfur-processing", "vgal-sulfuric-electronic-circuit")

vgal.tech.add_recipe("vgal-analog-electronics", "vgal-electronic-circuit-from-iron-gear-wheel")
vgal.tech.add_recipe("vgal-analog-electronics-2", "vgal-advanced-circuit-from-iron-gear-wheel")
vgal.tech.add_recipe("vgal-analog-electronics-3", "vgal-processing-unit-from-iron-gear-wheel")

vgal.tech.add_recipe("plastics", "vgal-electronic-circuit-from-plastic-bar")

vgal.tech.add_recipe("advanced-electronics-2", "vgal-processing-unit-from-advanced-circuit")
vgal.tech.add_recipe("advanced-electronics-2", "vgal-processing-unit-from-plastic-bar")
vgal.tech.add_recipe("advanced-electronics-2", "vgal-processing-unit-from-effectivity-module")

vgal.tech.add_recipe("vgal-biological-material-processing", "vgal-electronic-circuit-from-wood-pellets")

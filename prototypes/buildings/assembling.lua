vgal.data.extend {
    -- region *assembling-machine-1-from-steel
    {
        type = "recipe",
        name = "vgal-assembling-machine-1-from-steel",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-1"),
            vgal.icon.get_in("steel-plate"),
        },
        enabled = false,
        energy_required = 0.5,
        ingredients = {
            { "electronic-circuit", 2 },
            { "iron-gear-wheel",    3 },
            { "steel-plate",        1 }
        },
        result = "assembling-machine-1",
        result_count = 2
    },
    -- endregion
    -- region *assembling-machine-1-from-burner-inserter
    {
        type = "recipe",
        name = "vgal-assembling-machine-1-from-burner-inserter",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-1"),
            vgal.icon.get_in("burner-inserter"),
        },
        enabled = false,
        energy_required = 0.5,
        ingredients = {
            { "burner-inserter",    5 },
            { "electronic-circuit", 3 },
        },
        result = "assembling-machine-1",
        result_count = 1
    },
    -- endregion

    -- region *assembling-machine-2-from-speed-module
    {
        type = "recipe",
        name = "vgal-assembling-machine-2-from-speed-module",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-2"),
            vgal.icon.get_in("speed-module", "module"),
        },
        enabled = false,
        energy_required = 1.5,
        ingredients = {
            { "assembling-machine-1", 3 },
            { "speed-module",         1 }
        },
        result = "assembling-machine-2",
        result_count = 3
    },
    -- endregion
    -- region *assembling-machine-2-from-inserter
    {
        type = "recipe",
        name = "vgal-assembling-machine-2-from-inserter",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-2"),
            vgal.icon.get_in("inserter"),
        },
        enabled = false,
        energy_required = 1.5,
        ingredients = {
            { "assembling-machine-1", 1 },
            { "steel-plate",          2 },
            { "inserter",             3 },
        },
        result = "assembling-machine-2",
        result_count = 1
    },
    -- endregion
    -- region *assembling-machine-2-from-electric-engine-unit
    {
        type = "recipe",
        name = "vgal-assembling-machine-2-from-electric-engine-unit",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-2"),
            vgal.icon.get_in("electric-engine-unit"),
        },
        enabled = false,
        energy_required = 1,
        ingredients = {
            { "assembling-machine-1", 2 },
            { "electric-engine-unit", 1 },
            { "steel-plate",          1 },
        },
        result = "assembling-machine-2",
        result_count = 2
    },
    -- endregion
    -- region *assembling-machine-2-from-advanced-circuit
    {
        type = "recipe",
        name = "vgal-assembling-machine-2-from-advanced-circuit",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-2"),
            vgal.icon.get_in("advanced-circuit"),
        },
        enabled = false,
        energy_required = 4,
        ingredients = {
            { "advanced-circuit",     2 },
            { "electric-engine-unit", 2 },
            { "steel-chest",          2 },
        },
        result = "assembling-machine-2",
        result_count = 4
    },
    -- endregion

    -- region *electric-mining-drill-from-electric-engine-unit
    {
        type = "recipe",
        name = "vgal-electric-mining-drill-from-electric-engine-unit",
        icons = vgal.icon.register {
            vgal.icon.get("electric-mining-drill"),
            vgal.icon.get_in("electric-engine-unit"),
        },
        enabled = false,
        energy_required = 2,
        ingredients = {
            { "steel-plate",          1 },
            { "electric-engine-unit", 2 }
        },
        result = "electric-mining-drill",
        result_count = 2
    },
    -- endregion

    -- region *steel-furnace-from-stone-furnace
    {
        type = "recipe",
        name = "vgal-steel-furnace-from-stone-furnace",
        icons = vgal.icon.register {
            vgal.icon.get("steel-furnace"),
            vgal.icon.get_in("stone-furnace"),
        },
        enabled = false,
        energy_required = 6,
        category = "smelting",
        ingredients = {
            { "stone-furnace", 4 },
            { "iron-plate",    30 }
        },
        result = "steel-furnace",
        result_count = 1,
        subgroup = data.raw.item["steel-furnace"].subgroup,
        order = data.raw.item["steel-furnace"].order
    },
    -- endregion
    -- region *steel-furnace-from-engine-unit
    {
        type = "recipe",
        name = "vgal-steel-furnace-from-engine-unit",
        icons = vgal.icon.register {
            vgal.icon.get("steel-furnace"),
            vgal.icon.get_in("engine-unit"),
        },
        enabled = false,
        energy_required = 3,
        category = "crafting",
        ingredients = {
            { "pipe",        6 },
            { "engine-unit", 1 },
            { "stone-brick", 2 },
            { "steel-plate", 2 },
        },
        result = "steel-furnace",
        result_count = 1,
        subgroup = data.raw.item["steel-furnace"].subgroup,
        order = data.raw.item["steel-furnace"].order
    },
    -- endregion
    -- region *steel-furnace-from-pipe
    {
        type = "recipe",
        name = "vgal-steel-furnace-from-pipe",
        icons = vgal.icon.register {
            vgal.icon.get("steel-furnace"),
            vgal.icon.get_in("pipe"),
        },
        enabled = false,
        energy_required = 3,
        category = "crafting",
        ingredients = {
            { "pipe",            3 },
            { "iron-gear-wheel", 1 },
            { "concrete",        15 },
            { "steel-plate",     3 },
        },
        result = "steel-furnace",
        result_count = 1,
        subgroup = data.raw.item["steel-furnace"].subgroup,
        order = data.raw.item["steel-furnace"].order
    },
    -- endregion
}
vgal.tech.add_recipe("automation-2", "vgal-assembling-machine-1-from-steel")
vgal.tech.add_recipe("automation-2", "vgal-assembling-machine-1-from-burner-inserter")

vgal.tech.add_recipe("automation-2", "vgal-assembling-machine-2-from-inserter")
vgal.tech.add_recipe("speed-module", "vgal-assembling-machine-2-from-speed-module")
vgal.tech.add_recipe("advanced-electronics", "vgal-assembling-machine-2-from-advanced-circuit")
vgal.tech.add_recipe("electric-engine", "vgal-assembling-machine-2-from-electric-engine-unit")

vgal.tech.add_recipe("electric-engine", "vgal-electric-mining-drill-from-electric-engine-unit")

vgal.tech.add_recipe("advanced-material-processing", "vgal-steel-furnace-from-stone-furnace")
vgal.tech.add_recipe("advanced-material-processing", "vgal-steel-furnace-from-pipe")
vgal.tech.add_recipe("engine", "vgal-steel-furnace-from-engine-unit")

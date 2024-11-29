vgal.data.extend {
    -- region *speed-module-from-lubricant
    {
        type = "recipe",
        name = "vgal-speed-module-from-lubricant",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("speed-module"),
            vgal.icon.get_in("lubricant", "fluid"),
        },
        enabled = false,
        energy_required = 15,
        ingredients = {
            { type = "fluid",       name = "lubricant", amount = 5 },
            { "advanced-circuit",   3 },
            { "electronic-circuit", 3 }
        },
        result = "speed-module",
        result_count = 1,
    },
    -- endregion
    -- region *speed-module-from-express-transport-belt
    {
        type = "recipe",
        name = "vgal-speed-module-from-express-transport-belt",
        category = "crafting",
        icons = vgal.icon.register {
            vgal.icon.get("speed-module"),
            vgal.icon.get_in("express-transport-belt"),
        },
        enabled = false,
        energy_required = 24,
        ingredients = {
            { "advanced-circuit",       4 },
            { "express-transport-belt", 12 }
        },
        result = "speed-module",
        result_count = 4,
    },
    -- endregion
    -- region *speed-module-from-engine-unit
    {
        type = "recipe",
        name = "vgal-speed-module-from-engine-unit",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("speed-module"),
            vgal.icon.get_in("engine-unit"),
        },
        enabled = false,
        energy_required = 15,
        ingredients = {
            { "advanced-circuit", 2 },
            { "concrete",         30 },
            { "engine-unit",      3 },
        },
        result = "speed-module",
        result_count = 1,
    },
    -- endregion

    -- region *productivity-module-from-lubricant
    {
        type = "recipe",
        name = "vgal-productivity-module-from-lubricant",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("productivity-module"),
            vgal.icon.get_in("lubricant", "fluid"),
        },
        enabled = false,
        energy_required = 15,
        ingredients = {
            { type = "fluid",       name = "lubricant", amount = 5 },
            { "advanced-circuit",   3 },
            { "electronic-circuit", 3 }
        },
        result = "productivity-module",
        result_count = 1,
    },
    -- endregion
    -- region *productivity-module-from-electric-engine-unit
    {
        type = "recipe",
        name = "vgal-productivity-module-from-electric-engine-unit",
        category = "crafting",
        icons = vgal.icon.register {
            vgal.icon.get("productivity-module"),
            vgal.icon.get_in("electric-engine-unit"),
        },
        enabled = false,
        energy_required = 12,
        ingredients = {
            { "electric-engine-unit", 1 },
            { "rocket-fuel",          1 },
            { "advanced-circuit",     2 },
        },
        result = "productivity-module",
        result_count = 1,
    },
    -- endregion

    -- region *effectivity-module-from-wood
    {
        type = "recipe",
        name = "vgal-effectivity-module-from-wood",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("effectivity-module"),
            vgal.icon.get_in("wood")
        },
        enabled = false,
        energy_required = 15,
        ingredients = {
            { "wood",             15 },
            { "coal",             1 },
            { "advanced-circuit", 3 },
            { type = "fluid",     name = "water", amount = 25 },
        },
        result = "effectivity-module",
        result_count = 1,
    },
    -- endregion
    -- region *effectivity-module-from-crude-oil
    {
        type = "recipe",
        name = "vgal-effectivity-module-from-crude-oil",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("effectivity-module"),
            vgal.icon.get_in("crude-oil", "fluid")
        },
        enabled = false,
        energy_required = 15,
        ingredients = {
            { "electronic-circuit", 2 },
            { "advanced-circuit",   3 },
            { "plastic-bar",        4 },
            { type = "fluid",       name = "crude-oil", amount = 20 },
        },
        result = "effectivity-module",
        result_count = 1,
    },
    -- endregion
    -- region *effectivity-module-from-coal
    {
        type = "recipe",
        name = "vgal-effectivity-module-from-coal",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("effectivity-module"),
            vgal.icon.get_in("coal")
        },
        enabled = false,
        energy_required = 15,
        ingredients = {
            { "advanced-circuit", 3 },
            { "coal",             5 },
            { "sulfur",           3 },
            { type = "fluid",     name = "sulfuric-acid", amount = 5 },
        },
        result = "effectivity-module",
        result_count = 1,
    },
    -- endregion
    -- region *effectivity-module-from-lubricant
    {
        type = "recipe",
        name = "vgal-effectivity-module-from-lubricant",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("effectivity-module"),
            vgal.icon.get_in("lubricant", "fluid"),
        },
        enabled = false,
        energy_required = 15,
        ingredients = {
            { type = "fluid",       name = "lubricant", amount = 5 },
            { "advanced-circuit",   3 },
            { "electronic-circuit", 3 }
        },
        result = "effectivity-module",
        result_count = 1,
    },
    -- endregion
}
vgal.tech.add_recipe("vgal-module-processing-2", "vgal-productivity-module-from-lubricant")
vgal.tech.add_recipe("vgal-module-processing-3", "vgal-productivity-module-from-electric-engine-unit")

vgal.tech.add_recipe("vgal-module-processing-2", "vgal-speed-module-from-lubricant")
vgal.tech.add_recipe("vgal-module-processing", "vgal-speed-module-from-engine-unit")
vgal.tech.add_recipe("vgal-module-processing-3", "vgal-speed-module-from-express-transport-belt")

vgal.tech.add_recipe("vgal-module-processing", "vgal-effectivity-module-from-wood")
vgal.tech.add_recipe("vgal-module-processing-2", "vgal-effectivity-module-from-lubricant")
vgal.tech.add_recipe("vgal-module-processing", "vgal-effectivity-module-from-crude-oil")
vgal.tech.add_recipe("vgal-module-processing-2", "vgal-effectivity-module-from-coal")
-- endregion
-- region *

vgal.data.extend {
    -- AUTOMATION
    -- region *steel-automation-science-pack
    {
        name = "steel-automation-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("automation-science-pack"),
            vgal.icon.get_in("steel-plate"),
        },
        category = "crafting",
        energy_required = 9,
        technology = "steel-processing",
        ingredients = {
            { "steel-plate",     1 },
            { "iron-gear-wheel", 1 }
        },
        results = {
            { "automation-science-pack", 3 },
        },
    },
    -- endregion
    -- region *optic-automation-science-pack
    {
        type = "recipe",
        name = "lamp-automation-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("automation-science-pack"),
            vgal.icon.get_in("small-lamp"),
        },
        category = "crafting",
        energy_required = 15,
        technology = "lamp",
        ingredients = {
            { "copper-cable", 2 },
            { "small-lamp",   1 }
        },
        results = {
            { "automation-science-pack", 3 },
        },
    },
    -- endregion
    -- region *wall-furnace-automation-science-pack
    {
        type = "recipe",
        name = "wall-furnace-automation-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("automation-science-pack"),
            vgal.icon.get_in("stone-wall"),
        },
        category = "crafting",
        energy_required = 25,
        technology = "stone-wall",
        ingredients = {
            { "stone-wall",    1 },
            { "stone-furnace", 1 }
        },
        results = {
            { "automation-science-pack", 5 },
        },
    },
    -- endregion

    -- LOGISTIC
    -- region *gate-logistic-science-pack
    {
        type = "recipe",
        name = "gate-logistic-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("logistic-science-pack"),
            vgal.icon.get_in("landfill"),
        },
        category = "crafting",
        energy_required = 12,
        technology = "gate",
        ingredients = {
            { "gate",     1 },
            { "landfill", 2 }
        },
        results = {
            { "logistic-science-pack", 2 },
        },
    },
    -- endregion
    -- region *concrete-logistic-science-pack
    {
        type = "recipe",
        name = "concrete-logistic-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("logistic-science-pack"),
            vgal.icon.get_in("concrete")
        },
        category = "crafting",
        energy_required = 8,
        technology = "concrete",
        ingredients = {
            { "concrete",    20 },
            { "stone-brick", 4 }
        },
        results = {
            { "logistic-science-pack", 1 },
        },
    },
    -- endregion
    -- region *assembling-machine-2-logistic-science-pack
    {
        type = "recipe",
        name = "assembling-machine-2-logistic-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("logistic-science-pack"),
            vgal.icon.get_in("assembling-machine-2")
        },
        category = "crafting",
        energy_required = 30,
        technology = "automation-2",
        ingredients = {
            { "assembling-machine-2", 1 },
            { "fast-inserter",        2 }
        },
        results = {
            { "logistic-science-pack", 6 },
        },
    },
    -- endregion
    -- region *solar-planel-logistic-science-pack
    {
        type = "recipe",
        name = "solar-planel-logistic-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("logistic-science-pack"),
            vgal.icon.get_in("solar-panel"),
        },
        category = "crafting",
        energy_required = 64,
        technology = "solar-energy",
        ingredients = {
            { "transport-belt", 4 },
            { "solar-panel",    1 }
        },
        results = {
            { "logistic-science-pack", 12 },
        },
    },
    -- endregion

    -- CHEMICAL
    -- region *accumulator-chemical-science-pack
    {
        type = "recipe",
        name = "accumulator-chemical-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("accumulator")
        },
        category = "crafting",
        energy_required = 24,
        technology = "electric-energy-accumulators",
        ingredients = {
            { "accumulator", 1 },
            { "solid-fuel",  1 }
        },
        results = {
            { "chemical-science-pack", 2 },
        },
    },
    -- endregion
    -- region *bulk-inserter-chemical-science-pack
    {
        type = "recipe",
        name = "bulk-inserter-chemical-science-pack", -- ISSUE #10
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("bulk-inserter"),
            vgal.icon.get_in2("petroleum-gas", "fluid"),
        },
        category = "crafting-with-fluid",
        energy_required = 64,
        technology = "chemical-science-pack",
        ingredients = {
            { "bulk-inserter",       2 },
            { "fast-transport-belt", 8 },
            { type = "fluid",        name = "petroleum-gas", amount = 40 }
        },
        results = {
            { "chemical-science-pack", 12 },
        },
    },
    -- endregion
    -- region *productivity-chemical-science-pack
    {
        type = "recipe",
        name = "vgal-productivity-chemical-science-pack",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("productivity-module"),
        },
        category = "crafting",
        energy_required = 24,
        technology = "chemical-science-pack",
        ingredients = {
            { "productivity-module", 1 },
            { "battery",             2 }
        },
        results = {
            { "chemical-science-pack", 2 },
        },
    },
    -- endregion
    -- region *speed-chemical-science-pack
    {
        type = "recipe",
        name = "vgal-speed-chemical-science-pack", -- ISSUE #10
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("speed-module"),
        },
        category = "crafting",
        energy_required = 24,
        technology = "speed-module-2",
        ingredients = {
            { "speed-module", 1 },
            { "battery",      2 }
        },
        results = {
            { "chemical-science-pack", 2 },
        },
    },
    -- endregion
    -- region *efficiency-chemical-science-pack
    {
        type = "recipe",
        name = "vgal-efficiency-chemical-science-pack",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("efficiency-module"),
        },
        category = "crafting",
        energy_required = 24,
        technology = "efficiency-module-2",
        ingredients = {
            { "efficiency-module", 1 },
            { "battery",            2 }
        },
        results = {
            { "chemical-science-pack", 2 },
        },
    },
    -- endregion
    -- region *solar-panel-equipment-chemical-science-pack
    {
        type = "recipe",
        name = "vgal-solar-panel-equipment-chemical-science-pack", -- ISSUE #10
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("solar-panel-equipment"),
        },
        category = "crafting-with-fluid",
        energy_required = 40,
        technology = "chemical-science-pack",
        ingredients = {
            { "solar-panel-equipment", 1 },
            { "small-lamp",            2 },
            { "plastic-bar", 8 },
        },
        results = {
            { "chemical-science-pack", 6 },
        },
    },
    -- endregion

    -- MILITAIRY
    -- region *logistic-to-military-science-pack
    {
        type = "recipe",
        name = "vgal-logistic-to-military-science-pack",
        icons = vgal.icon.register {
            vgal.icon.get("military-science-pack"),
            vgal.icon.get_in("logistic-science-pack"),
        },
        category = "crafting",
        energy_required = 4,
        technology = "military-science-pack",
        ingredients = {
            { "logistic-science-pack", 1 },
            { "firearm-magazine",      1 }
        },
        results = {
            { "military-science-pack", 1 },
        },
    },
    -- endregion

    -- PRODUCTION
    -- region *low-density-structure-production-science-pack
    {
        type = "recipe",
        name = "vgal-low-density-structure-production-science-pack", -- ISSUE #10
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("low-density-structure"),
        },
        category = "crafting-with-fluid",
        energy_required = 12,
        technology = "production-science-pack",
        ingredients = {
            { "fast-transport-belt",   6 },
            { "plastic-bar",           12 },
            { "low-density-structure", 2 }
        },
        results = {
            { "production-science-pack", 2 },
        },
    },
    -- endregion
    -- region *roboport-production-science-pack
    {
        type = "recipe",
        name = "vgal-roboport-production-science-pack",
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("roboport"),
        },
        category = "crafting",
        energy_required = 40,
        technology = "production-science-pack",
        ingredients = {
            { "productivity-module", 6 },
            { "plastic-bar",         2 },
            { "roboport",            1 }
        },
        results = {
            { "production-science-pack", 14 },
        },
    },
    -- endregion
    -- region *steel-furnace-production-science-pack
    {
        type = "recipe",
        name = "vgal-steel-furnace-production-science-pack",
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("steel-furnace"),
        },
        category = "crafting",
        energy_required = 18,
        technology = "production-science-pack",
        ingredients = {
            { "steel-furnace",       3 },
            { "productivity-module", 2 },
        },
        results = {
            { "production-science-pack", 3 },
        },
    },
    -- endregion
    -- region *construction-robot-production-science-pack
    {
        type = "recipe",
        name = "vgal-construction-robot-production-science-pack",
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("construction-robot"),
        },
        category = "crafting",
        energy_required = 18,
        technology = "production-science-pack",
        ingredients = {
            { "construction-robot",  3 },
            { "productivity-module", 2 },
        },
        results = {
            { "production-science-pack", 3 },
        },
    },
    -- endregion

    -- UTILITY
    -- region *production-flying-robot-frame-to-utility-science-pack
    {
        type = "recipe",
        name = "vgal-production-flying-robot-frame-utility-science-pack", -- ISSUE #10
        icons = vgal.icon.register {
            vgal.icon.get("utility-science-pack"),
            vgal.icon.get_in("production-science-pack"),
        },
        category = "crafting",
        energy_required = 40,
        technology = "utility-science-pack",
        ingredients = {
            { "production-science-pack", 4 },
            { "flying-robot-frame",      1 },
            { "uranium-238",             1 },
        },
        results = {
            { "utility-science-pack", 4 },
        },
    },
    -- endregion
}

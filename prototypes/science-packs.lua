vgal.data.extend {
    -- AUTOMATION
    {
        name = "steel-automation-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("automation-science-pack"),
            vgal.icon.get_in("steel-plate"),
        },
        category = "crafting",
        energy_required = 12,
        technology = "steel-processing",
        ingredients = {
            { "steel-plate",     1 },
            { "iron-gear-wheel", 2 },
        },
        results = {
            { "automation-science-pack", 3 },
        },
        groups = { "alternate-science" },
    },
    {
        name = "lamp-automation-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("automation-science-pack"),
            vgal.icon.get_in("small-lamp"),
        },
        category = "crafting",
        energy_required = 20,
        technology = "lamp",
        ingredients = {
            { "copper-cable", 5 }, -- 10
            { "small-lamp",   1 }, -- 50
        },
        results = {
            { "automation-science-pack", 4 },
        },
        groups = { "alternate-science" },
    },
    {
        name = "wall-furnace-automation-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("automation-science-pack"),
            vgal.icon.get_in("stone-wall"),
        },
        category = "crafting",
        energy_required = 30,
        technology = "stone-wall",
        ingredients = {
            { "stone-wall",    1 }, -- 100
            { "stone-furnace", 3 }, -- 150
        },
        results = {
            { "automation-science-pack", 6 }, -- 180, rip those who do not want to smelt iron or copper..
        },
        groups = { "alternate-science" },
    },
    {
        name = "copper-plate-iron-stick-automation-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("automation-science-pack"),
            vgal.icon.get_in("iron-stick"),
        },
        category = "crafting",
        energy_required = 6,
        technologies = {
            "circuit-network",
            "concrete",
            "electric-energy-distribution-1",
            "railway",
        },
        ingredients = {
            { "iron-stick",   3 }, -- 15
            { "copper-plate", 1 }, -- 10
        },
        results = {
            { "automation-science-pack", 1 }, -- 30
        },
        groups = { "alternate-science" },
    },
    -- LOGISTIC
    {
        name = "concrete-logistic-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("logistic-science-pack"),
            vgal.icon.get_in("concrete")
        },
        category = "crafting",
        energy_required = 6,
        technology = "concrete",
        ingredients = {
            { "concrete",    4 },
            { "stone-brick", 1 },
        },
        results = {
            { "logistic-science-pack", 1 },
        },
        groups = { "alternate-science" },
    },
    {
        name = "assembling-machine-2-logistic-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("logistic-science-pack"),
            vgal.icon.get_in("assembling-machine-2")
        },
        category = "crafting",
        energy_required = 60,
        technology = "automation-2",
        ingredients = {
            { "assembling-machine-2", 1 }, -- 540
            { "fast-inserter",        1 }, -- 125
        },
        results = {
            { "logistic-science-pack", 10 }, -- 700
        },
        groups = { "alternate-science" },
    },
    {
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
            { "transport-belt", 4 }, -- 60
            { "solar-panel",    1 }, -- 675
            { "steel-plate",    2 }, -- 100
        },
        results = {
            { "logistic-science-pack", 12 }, -- 840
        },
        groups = { "alternate-science" },
    },
    -- CHEMICAL
    {
        name = "accumulator-chemical-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("accumulator")
        },
        category = "crafting",
        energy_required = 24,
        technology = { "electric-energy-accumulators", "chemical-science-pack" },
        ingredients = {
            { "accumulator", 1 }, -- 270
            { "solid-fuel",  6 }, -- 108
            { "sulfur",      6 }, -- 90
        },
        results = {
            { "chemical-science-pack", 2 }, -- 490
        },
        groups = { "alternate-science" },
    },
    {
        name = "bulk-inserter-chemical-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("bulk-inserter"),
            vgal.icon.get_in2("petroleum-gas", "fluid"),
        },
        category = "crafting-with-fluid",
        energy_required = 64,
        technology = { "bulk-inserter", "chemical-science-pack" },
        ingredients = {
            { "bulk-inserter",       2 }, -- 1800
            { "fast-transport-belt", 8 }, -- 920
        },
        fluid_ingredients = {
            { "petroleum-gas", 100 }, -- 100
        },
        results = {
            { "chemical-science-pack", 12 }, -- 2940
        },
        groups = { "alternate-science" },
    },
    {
        name = "productivity-module-chemical-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("productivity-module"),
        },
        category = "crafting",
        energy_required = 36,
        technology = { "chemical-science-pack", "battery", "productivity-module" },
        ingredients = {
            { "productivity-module", 1 },
            { "battery",             2 }
        },
        results = {
            { "chemical-science-pack", 3 },
        },
        groups = { "alternate-science" },
    },
    {
        name = "speed-module-chemical-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("speed-module"),
        },
        category = "crafting",
        energy_required = 36,
        technology = { "chemical-science-pack", "speed-module", "battery" },
        ingredients = {
            { "speed-module", 1 },
            { "battery",      2 }
        },
        results = {
            { "chemical-science-pack", 3 },
        },
        groups = { "alternate-science" },
    },
    {
        name = "efficiency-chemical-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("efficiency-module"),
        },
        category = "crafting",
        energy_required = 36,
        technology = { "chemical-science-pack", "efficiency-module", "battery" },
        ingredients = {
            { "efficiency-module", 1 }, -- 625
            { "battery",           2 }, -- 100
        },
        results = {
            { "chemical-science-pack", 3 }, -- 735
        },
        groups = { "alternate-science" },
    },
    -- MILITAIRY
    -- {
    --     name = "logistic-to-military-science-pack",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("military-science-pack"),
    --         vgal.icon.get_in("logistic-science-pack"),
    --     },
    --     category = "crafting",
    --     energy_required = 4,
    --     technology = "military-science-pack",
    --     ingredients = {
    --         { "logistic-science-pack", 1 },
    --         { "firearm-magazine",      1 }
    --     },
    --     results = {
    --         { "military-science-pack", 1 },
    --     },
    --     groups = { "alternate-science" },
    -- },
    -- PRODUCTION
    {
        name = "low-density-structure-production-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("low-density-structure"),
        },
        category = "crafting-with-fluid",
        energy_required = 12,
        technology = { "production-science-pack", "low-density-structure" },
        ingredients = {
            { "fast-transport-belt",   8 },  -- 940
            { "plastic-bar",           12 }, -- 180
            { "low-density-structure", 2 },  -- 750
        },
        results = {
            { "production-science-pack", 2 }, -- 1870
        },
        groups = { "alternate-science" },
    },
    -- {
    --     name = "express-transport-belt-production-science-pack",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("production-science-pack"),
    --         vgal.icon.get_in("express-transport-belt"),
    --     },
    --     category = "crafting",
    --     energy_required = 12,
    --     technology = "logistics-3",
    --     ingredients = {
    --         { "express-transport-belt", 4 }, -- 1460
    --         { "rocket-fuel",            1 }, -- 200
    --         { "advanced-circuit",       2 }, -- 200
    --     },
    --     results = {
    --         { "production-science-pack", 2 }, -- 1,870
    --     },
    --     groups = { "alternate-science" },
    -- },
    {
        name = "fast-transport-belt-production-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("fast-transport-belt"),
        },
        category = "crafting",
        energy_required = 12,
        technology = { "production-science-pack", "concrete" },
        ingredients = {
            { "fast-transport-belt", 8 },  -- 920
            { "concrete",            18 }, -- 216
            { "processing-unit",     1 },  -- 710
        },
        results = {
            { "production-science-pack", 2 }, -- 1,870
        },
        groups = { "alternate-science" },
    },
    -- UTILITY
    {
        name = "roboport-utility-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("utility-science-pack"),
            vgal.icon.get_in("roboport"),
        },
        category = "crafting",
        energy_required = 72,
        technology = { "utility-science-pack", "construction-robotics", "logistic-robotics" },
        ingredients = {
            { "speed-module", 5 },  -- 3125
            { "plastic-bar",  30 }, -- 450
            { "roboport",     1 },  -- 7650
        },
        results = {
            { "utility-science-pack", 12 }, -- 11220
        },
        groups = { "alternate-science" },
    },
    {
        name = "refined-concrete-utility-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("utility-science-pack"),
            vgal.icon.get_in("refined-concrete"),
        },
        category = "crafting",
        energy_required = 6,
        technology = "utility-science-pack",
        ingredients = {
            { "low-density-structure", 1 },
            { "refined-concrete",      20 },
        },
        results = {
            { "utility-science-pack", 1 }, -- 990
        },
        groups = { "alternate-science" },
    },
}

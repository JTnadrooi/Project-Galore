vgal.data.extend {
    -- AUTOMATION
    {
        name = "steel-plate-automation-science-pack",
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
        name = "stone-wall-furnace-automation-science-pack",
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
            { "concrete",    4 }, -- 48
            { "stone-brick", 1 }, -- 20
        },
        results = {
            { "logistic-science-pack", 1 }, -- 
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
            { "solar-panel",    1 }, -- 675
            { "transport-belt", 8 }, -- 120
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
    {
        name = "gun-turret-military-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("military-science-pack"),
            vgal.icon.get_in("gun-turret"),
        },
        category = "crafting",
        energy_required = 12,
        technology = { "military-science-pack", "gun-turret" },
        ingredients = {
            { "stone-wall", 2 }, -- 200
            { "gun-turret", 1 }, -- 500
        },
        results = {
            { "military-science-pack", 3 }, -- 240x =
        },
        groups = { "alternate-science" },
    },
    {
        name = "flamethrower-turret-military-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("military-science-pack"),
            vgal.icon.get_in("flamethrower-turret"),
        },
        category = "crafting",
        energy_required = 60,
        technology = { "military-science-pack", "flamethrower" },
        ingredients = {
            { "explosives",               2 }, -- 60
            { "piercing-rounds-magazine", 6 }, -- 840
            { "flamethrower-turret",      1 }, -- 2350
        },
        results = {
            { "military-science-pack", 18 }, -- 240x =
        },
        groups = { "alternate-science" },
    },
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
    {
        name = "express-transport-belt-bulk-inserter-production-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("express-transport-belt"),
            vgal.icon.get_in2("bulk-inserter"),
        },
        category = "crafting",
        energy_required = 25,
        technology = { "logistics-3", "fast-inserter" },
        ingredients = {
            { "express-transport-belt", 6 },  -- 2190
            { "concrete",               40 }, -- 650 (is:480)
            { "bulk-inserter",          1 },  -- 900
        },
        results = {
            { "production-science-pack", 4 }, -- 3740
        },
        groups = { "alternate-science" },
    },
    {
        name = "productivity-module-2-bulk-inserter-production-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("productivity-module-2"),
            vgal.icon.get_in2("bulk-inserter"),
        },
        category = "crafting",
        energy_required = 64,
        technology = { "productivity-module-2", "production-science-pack", "bulk-inserter" },
        ingredients = {
            { "electric-furnace",      1 }, -- 1200
            { "productivity-module-2", 1 }, -- 6550
            { "bulk-inserter",         1 }, -- 900
        },
        results = {
            { "production-science-pack", 10 }, -- 9350
        },
        groups = { "alternate-science" },
    },
    {
        name = "beacon-production-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("beacon"),
        },
        category = "crafting",
        energy_required = 25,
        technology = { "explosives", "effect-transmission" },
        ingredients = {
            { "electric-engine-unit", 4 },  -- 720
            { "explosives",           15 }, -- 225
            { "beacon",               1 },  -- 3050
        },
        results = {
            { "production-science-pack", 4 }, -- 3740
        },
        groups = { "alternate-science", "unsure" },
    },
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
            { "concrete",            20 }, -- 240
            { "processing-unit",     1 },  -- 710
        },
        results = {
            { "production-science-pack", 2 }, -- 1870
        },
        groups = { "alternate-science" },
    },
    -- UTILITY
    {
        name = "refined-concrete-low-density-structure-utility-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("utility-science-pack"),
            vgal.icon.get_in("refined-concrete"),
            vgal.icon.get_in2("low-density-structure"),
        },
        category = "crafting",
        energy_required = 6,
        technology = "utility-science-pack",
        ingredients = {
            { "low-density-structure", 1 },
            { "refined-concrete",      25 },
        },
        results = {
            { "utility-science-pack", 1 }, -- 990
        },
        groups = { "alternate-science" },
    },
    {
        name = "refined-concrete-flying-robot-frame-utility-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("utility-science-pack"),
            vgal.icon.get_in("refined-concrete"),
            vgal.icon.get_in2("flying-robot-frame"),
        },
        category = "crafting",
        energy_required = 6,
        technology = "utility-science-pack",
        ingredients = {
            { "flying-robot-frame", 1 },
            { "refined-concrete",   20 },
        },
        results = {
            { "utility-science-pack", 1 }, -- 990
        },
        groups = { "alternate-science" },
    },
    {
        name = "refined-concrete-processing-unit-utility-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("utility-science-pack"),
            vgal.icon.get_in("refined-concrete"),
            vgal.icon.get_in2("processing-unit"),
        },
        category = "crafting",
        energy_required = 6,
        technology = "utility-science-pack",
        ingredients = {
            { "processing-unit",  1 },
            { "refined-concrete", 20 },
        },
        results = {
            { "utility-science-pack", 1 }, -- 990
        },
        groups = { "alternate-science" },
    },
    {
        name = "logistic-robot-construction-robot-utility-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("utility-science-pack"),
            vgal.icon.get_in("logistic-robot"),
            vgal.icon.get_in2("construction-robot"),
        },
        category = "crafting",
        energy_required = 12,
        technology = { "utility-science-pack", "logistic-robotics", "construction-robotics" },
        ingredients = {
            { "logistic-robot",        1 }, -- 605
            { "construction-robot",    1 }, -- 455
            { "low-density-structure", 2 }, -- 750
        },
        results = {
            { "utility-science-pack", 2 }, -- 1980
        },
        groups = { "alternate-science" },
    },
    -- {
    --     name = "uranium-fuel-cell-utility-science-pack",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("utility-science-pack"),
    --         vgal.icon.get_in("uranium-fuel-cell"),
    --     },
    --     category = "crafting",
    --     energy_required = 12,
    --     technology = {"utility-science-pack",}
    --     ingredients = {
    --         { "uranium-fuel-cell", 2 }, -- 920
    --         { "accumulator",       2 }, -- 540
    --         { "processing-unit",   1 }, -- 710
    --     },
    --     results = {
    --         { "utility-science-pack", 2 }, -- 990
    --     },
    --     groups = { "alternate-science", "unsure" },
    -- },
}

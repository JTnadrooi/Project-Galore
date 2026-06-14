vgal.data.extend({
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
    },
    {
        name = "burner-inserter-automation-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("automation-science-pack"),
            vgal.icon.get_in("burner-inserter"),
        },
        category = "crafting",
        energy_required = 10,
        technology = "automation-science-pack",
        ingredients = {
            { "burner-inserter", 1 }, -- 30
            { "copper-cable",    2 }, -- 10
        },
        results = {
            { "automation-science-pack", 2 }, -- 60
        },
    },
    {
        name = "burner-mining-drill-automation-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("automation-science-pack"),
            vgal.icon.get_in("burner-mining-drill"),
        },
        category = "crafting",
        energy_required = 30,
        technology = "automation-science-pack",
        ingredients = {
            { "burner-mining-drill", 1 }, -- 140
            { "copper-plate",        2 }, -- 20
        },
        results = {
            { "automation-science-pack", 6 }, -- 180
        },
    },
    {
        name = "plastic-bar-automation-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("automation-science-pack"),
            vgal.icon.get_in("plastic-bar"),
        },
        category = "crafting",
        energy_required = 6,
        technology = "plastics",
        ingredients = {
            { "plastic-bar", 1 }, -- 15
            { "coal",        1 }, -- 10
        },
        results = {
            { "automation-science-pack", 1 },
        },
    },
    {
        name = "assembling-machine-1-automation-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("automation-science-pack"),
            vgal.icon.get_in("assembling-machine-1"),
        },
        category = "crafting",
        energy_required = 60,
        technology = "plastics",
        ingredients = {
            { "assembling-machine-1", 1 },  -- 265
            { "pipe",                 10 }, -- 100
        },
        results = {
            { "automation-science-pack", 15 },
        },
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
    },
    {
        name = "electric-mining-drill-logistic-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("logistic-science-pack"),
            vgal.icon.get_in("electric-mining-drill")
        },
        category = "crafting",
        energy_required = 36,
        technology = { "electric-mining-drill", "repair-pack", "logistic-science-pack" },
        ingredients = {
            { "electric-mining-drill", 1 }, -- 275
            { "repair-pack",           1 }, -- 90
        },
        results = {
            { "logistic-science-pack", 6 }, -- 420
        },
    },
    {
        name = "fast-transport-belt-logistic-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("logistic-science-pack"),
            vgal.icon.get_in("fast-transport-belt")
        },
        category = "crafting",
        energy_required = 24,
        technology = { "fast-inserter", "logistics-2" },
        ingredients = {
            { "fast-transport-belt", 1 }, -- 115
            { "fast-inserter",       1 }, -- 125
        },
        results = {
            { "logistic-science-pack", 4 },
        },
    },
    {
        name = "gate-logistic-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("logistic-science-pack"),
            vgal.icon.get_in("gate")
        },
        category = "crafting",
        energy_required = 25,
        technology = "concrete",
        ingredients = {
            { "gate",   1 }, -- 250
            { "boiler", 1 }, -- 90
        },
        results = {
            { "logistic-science-pack", 5 }, --
        },
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
            { "accumulator",      1 }, -- 270
            { "advanced-circuit", 2 }, -- 200
            { "plastic-bar",      1 }, -- 15
        },
        results = {
            { "chemical-science-pack", 2 }, -- 490
        },
    },
    {
        name = "substation-chemical-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("substation")
        },
        category = "crafting",
        energy_required = 60,
        technology = { "electric-energy-distribution-2", "chemical-science-pack" },
        ingredients = {
            { "rocket-fuel", 1 }, -- 200
            { "substation",  1 }, -- 1030
        },
        results = {
            { "chemical-science-pack", 5 }, -- 1225
        },
    },
    {
        name = "substation-chemical-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("substation")
        },
        category = "crafting",
        energy_required = 60,
        technology = { "electric-energy-distribution-2", "rocket-fuel" },
        ingredients = {
            { "rocket-fuel", 1 }, -- 200
            { "substation",  1 }, -- 1030
        },
        results = {
            { "chemical-science-pack", 5 }, -- 1225
        },
    },
    {
        name = "lab-chemical-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("lab")
        },
        category = "crafting",
        energy_required = 60,
        technology = "chemical-science-pack",
        ingredients = {
            { "lab",         1 }, -- 510
            { "plastic-bar", 8 }, -- 120
            { "engine-unit", 1 }, -- 90
        },
        results = {
            { "chemical-science-pack", 3 }, -- 735
        },
    },
    {
        name = "bulk-inserter-chemical-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("bulk-inserter"),
        },
        category = "crafting-with-fluid",
        energy_required = 132,
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

        order = "qa"
    },
    {
        name = "efficiency-module-chemical-science-pack",
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

        order = "qb"
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
        technology = { "chemical-science-pack", "productivity-module", "battery" },
        ingredients = {
            { "productivity-module", 1 },
            { "battery",             2 }
        },
        results = {
            { "chemical-science-pack", 3 },
        },

        order = "qc"
    },
    {
        name = "electric-engine-unit-chemical-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("chemical-science-pack"),
            vgal.icon.get_in("electric-engine-unit")
        },
        category = "crafting",
        energy_required = 60,
        technology = { "electric-engine", "processing-unit" },
        ingredients = {
            { "electric-engine-unit", 2 }, -- 340
            { "processing-unit",      1 }, -- 710
            { "sulfur",               1 }, -- 15
        },
        results = {
            { "chemical-science-pack", 5 }, -- 1225
        },
    },
    -- MILITARY
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
            { "military-science-pack", 3 }, -- 630
        },
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
            { "piercing-rounds-magazine", 6 }, -- 450
            { "flamethrower-turret",      1 }, -- 2350
        },
        results = {
            { "military-science-pack", 15 }, -- 3150
        },
    },
    {
        name = "laser-turret-military-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("military-science-pack"),
            vgal.icon.get_in("laser-turret"),
        },
        category = "crafting",
        energy_required = 60,
        technology = { "land-mine", "laser-turret" },
        ingredients = {
            { "grenade",      1 }, -- 150
            { "land-mine",    2 }, -- 160
            { "laser-turret", 1 }, -- 2100
        },
        results = {
            { "military-science-pack", 12 }, -- 2520
        },
    },
    {
        name = "defender-capsule-military-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("military-science-pack"),
            vgal.icon.get_in("defender-capsule"),
        },
        category = "crafting",
        energy_required = 15,
        technology = "defender",
        ingredients = {
            { "defender-capsule", 1 }, -- 360
            { "shotgun-shell",    2 }, -- 80
            { "grenade",          1 }, -- 150
        },
        results = {
            { "military-science-pack", 3 }, -- 630
        },
    },
    {
        name = "rocket-military-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("military-science-pack"),
            vgal.icon.get_in("rocket"),
        },
        category = "crafting",
        energy_required = 5,
        technology = "rocketry",
        ingredients = {
            { "stone-wall", 1 }, -- 100
            { "rocket",     4 }, -- 140
        },
        results = {
            { "military-science-pack", 1 }, -- 210
        },
    },
    {
        name = "poison-capsule-military-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("military-science-pack"),
            vgal.icon.get_in("poison-capsule"),
        },
        category = "crafting",
        energy_required = 10,
        technology = "military-3",
        ingredients = {
            { "piercing-rounds-magazine", 1 }, -- 75
            { "poison-capsule",           1 }, -- 325
        },
        results = {
            { "military-science-pack", 2 }, -- 420
        },
    },
    {
        name = "slowdown-capsule-military-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("military-science-pack"),
            vgal.icon.get_in("slowdown-capsule"),
        },
        category = "crafting",
        energy_required = 12,
        technology = { "military-3", "explosives" },
        ingredients = {
            { "explosives",       1 }, -- 15
            { "slowdown-capsule", 1 }, -- 200
        },
        results = {
            { "military-science-pack", 1 }, -- 210
        },
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
    },
    {
        name = "express-transport-belt-bulk-inserter-production-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("express-transport-belt"),
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
    },
    {
        name = "productivity-module-2-bulk-inserter-production-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("productivity-module-2"),
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
    },
    {
        name = "productivity-module-3-production-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("productivity-module-3")
        },
        category = "crafting",
        energy_required = 210,
        technology = "productivity-module-3",
        ingredients = {
            { "locomotive",            1 }, -- 3550
            { "assembling-machine-3",  3 }, -- 10740
            { "productivity-module-3", 1 }, -- 30250
        },
        results = {
            { "production-science-pack", 50 }, -- 42075
        },

        groups = { "vgal-unsure" },
    },
    {
        name = "beacon-production-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("beacon"),
        },
        category = "crafting",
        energy_required = 30,
        technology = "effect-transmission",
        ingredients = {
            { "rail",            15 }, -- 480
            { "processing-unit", 1 },  -- 710
            { "beacon",          1 },  -- 3050
        },
        results = {
            { "production-science-pack", 5 },
        },
    },
    {
        name = "assembling-machine-3-production-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("production-science-pack"),
            vgal.icon.get_in("assembling-machine-3"),
        },
        category = "crafting",
        energy_required = 42,
        technology = "automation-3",
        ingredients = {
            { "productivity-module",  1 },  -- 625
            { "rail",                 40 }, -- 1280
            { "assembling-machine-3", 1 },  -- 3580
        },
        results = {
            { "production-science-pack", 6 }, -- 5610
        },
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
    },
    {
        name = "roboport-utility-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("utility-science-pack"),
            vgal.icon.get_in("roboport"),
        },
        category = "crafting",
        energy_required = 105,
        technology = { "utility-science-pack", "logistic-robotics", "construction-robotics", "efficiency-module-2" },
        ingredients = {
            { "roboport",             1 }, -- 7650
            { "efficiency-module-2",  1 }, -- 6550
            { "electric-engine-unit", 3 }, -- 510
        },
        results = {
            { "utility-science-pack", 15 }, -- 14850
        },
    },
    {
        name = "centrifuge-utility-science-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("utility-science-pack"),
            vgal.icon.get_in("centrifuge"),
        },
        category = "crafting",
        energy_required = 180,
        technology = { "utility-science-pack", "uranium-processing" },
        ingredients = {
            { "centrifuge",         1 }, -- 15700
            { "flying-robot-frame", 9 }, -- 3645
            { "uranium-238",        5 }, -- 400
        },
        results = {
            { "utility-science-pack", 20 },
        },
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
    -- },
}, {
    type = "recipe",
    groups = { "vgal-science-packs" },
})

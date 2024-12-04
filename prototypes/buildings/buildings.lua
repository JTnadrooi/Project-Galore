vgal.data.extend {
    {
        name = "boiler-from-storage-tank",
        prefix = "vgal",
        technology = "fluid-handling",
        icons = vgal.icon.register {
            vgal.icon.get("boiler"),
            vgal.icon.get_in("storage-tank"),
        },
        energy_required = 4,
        ingredients = {
            { "pipe",         8 },
            { "storage-tank", 1 },
        },
        results = {
            { "boiler", 6 },
        },
        category = "crafting",
    },
    {
        type = "recipe",
        name = "lab-from-inserter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("lab"),
            vgal.icon.get_in("inserter"),
        },
        technology = "electronics",
        energy_required = 2,
        ingredients = {
            { "electronic-circuit", 8 },
            { "iron-gear-wheel",    10 },
            { "inserter",           2 }
        },
        results = {
            { "lab", 1 },
        },
    },
    {
        name = "steel-assembling-machine-1",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-1"),
            vgal.icon.get_in("steel-plate"),
        },
        technology = "steel-processing",
        energy_required = 0.5,
        ingredients = {
            { "electronic-circuit", 2 },
            { "iron-gear-wheel",    3 },
            { "steel-plate",        1 }
        },
        results = {
            { "assembling-machine-1", 2 }
        },
    },
    {
        name = "assembling-machine-2-roboport",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("roboport"),
            vgal.icon.get_in("assembling-machine-2"),
        },
        category = "crafting",
        energy_required = 6,
        technologies = {
            "construction-robotics",
            "logistic-robotics",
        },
        ingredients = {
            { "assembling-machine-2", 6 }, -- 3,240mw
            { "steel-plate",          6 },
            { "advanced-circuit",     12 },
            { "battery",              6 },
        },
        results = {
            { "roboport", 1 }
        },
    },
    {
        name = "burner-inserter-assembling-machine-1",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-1"),
            vgal.icon.get_in("burner-inserter"),
        },
        technology = "automation",
        energy_required = 0.5,
        ingredients = {
            { "burner-inserter",    5 },
            { "electronic-circuit", 3 },
        },
        results = {
            { "assembling-machine-1", 1 }
        },
    },
    {
        name = "speed-module-assembling-machine-2",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-2"),
            vgal.icon.get_in("speed-module", "module"),
        },
        technology = "speed-module",
        energy_required = 1.5,
        ingredients = {
            { "assembling-machine-1", 3 },
            { "speed-module",         1 }
        },
        results = {
            { "assembling-machine-2", 3 }
        },
    },
    {
        name = "inserter-assembling-machine-2",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-2"),
            vgal.icon.get_in("inserter"),
        },
        technology = "automation-2",
        energy_required = 1.5,
        ingredients = {
            { "assembling-machine-1", 1 },
            { "steel-plate",          2 },
            { "inserter",             3 },
        },
        results = {
            { "assembling-machine-2", 1 }
        },
    },
    {
        name = "electric-engine-unit-assembling-machine-2",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-2"),
            vgal.icon.get_in("electric-engine-unit"),
        },
        technology = "electric-engine",
        energy_required = 1,
        ingredients = {
            { "assembling-machine-1", 2 },
            { "electric-engine-unit", 1 },
            { "steel-plate",          1 },
        },
        results = {
            { "assembling-machine-2", 2 }
        },
    },
    {
        name = "advanced-circuit-assembling-machine-2",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-2"),
            vgal.icon.get_in("advanced-circuit"),
        },
        technology = "electric-engine",
        energy_required = 4,
        ingredients = {
            { "advanced-circuit",     2 },
            { "electric-engine-unit", 2 },
            { "steel-chest",          2 },
        },
        results = {
            { "assembling-machine-2", 4 }
        },
    },
    {
        name = "electric-engine-unit-electric-mining-drill",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electric-mining-drill"),
            vgal.icon.get_in("electric-engine-unit"),
        },
        technology = "electric-engine",
        energy_required = 2,
        ingredients = {
            { "steel-plate",          1 },
            { "electric-engine-unit", 2 }
        },
        results = {
            { "electric-mining-drill", 2 }
        },
    },
    {
        name = "stone-furnace-steel-furnace",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("steel-furnace"),
            vgal.icon.get_in("stone-furnace"),
        },
        technology = "advanced-material-processing",
        energy_required = 6,
        category = "smelting",
        ingredients = {
            { "stone-furnace", 4 },
            { "iron-plate",    30 }
        },
        results = {
            { "steel-furnace", 1 }
        },
    },
    {
        name = "engine-unit-steel-furnace",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("steel-furnace"),
            vgal.icon.get_in("engine-unit"),
        },
        technology = "engine",
        energy_required = 3,
        category = "crafting",
        ingredients = {
            { "pipe",        6 },
            { "engine-unit", 1 },
            { "stone-brick", 2 },
            { "steel-plate", 2 },
        },
        results = {
            { "steel-furnace", 1 }
        },
    },
    {
        name = "pipe-steel-furnace",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("steel-furnace"),
            vgal.icon.get_in("pipe"),
        },
        technology = "advanced-material-processing",
        energy_required = 3,
        category = "crafting",
        ingredients = {
            { "pipe",        3 },
            { "concrete",    15 },
            { "steel-plate", 3 },
        },
        results = {
            { "steel-furnace", 1 }
        },
    },
}

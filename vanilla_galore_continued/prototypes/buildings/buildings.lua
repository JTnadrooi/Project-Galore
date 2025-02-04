vgal.data.extend {
    {
        name = "processing-unit-artillery-turret",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("artillery-turret"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 40,
        technology = "artillery",
        ingredients = {
            { "low-density-structure", 8 },
            { "processing-unit",       2 },
            { "iron-gear-wheel",       40 },
            { "refined-concrete",      15 },
        },
        results = {
            { "artillery-turret", 1 },
        },
        category = "crafting",
    },
    {
        name = "advanced-circuit-laser-turret",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("laser-turret"),
            vgal.icon.get_in("advanced-circuit"),
        },
        energy_required = 20,
        technology = { "laser-turret", "low-density-structure" },
        ingredients = {
            { "low-density-structure", 2 },
            { "battery",               10 },
            { "advanced-circuit",      8 },
        },
        results = {
            { "laser-turret", 1 },
        },
        category = "crafting",
    },
    {
        name = "processing-unit-laser-turret",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("laser-turret"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 25,
        technology = { "laser-turret", "processing-unit", "low-density-structure" },
        ingredients = {
            { "low-density-structure", 2 },
            { "battery",               10 },
            { "processing-unit",       1 },
        },
        results = {
            { "laser-turret", 1 },
        },
        category = "crafting",
    },
    {
        name = "steel-plate-accumulator",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("accumulator"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 10,
        technology = "electric-energy-accumulators",
        ingredients = {
            { "steel-plate", 1 },
            { "battery",     4 },
        },
        results = {
            { "accumulator", 1 },
        },
        category = "crafting",
    },
    {
        name = "concrete-stone-wall",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stone-wall"),
            vgal.icon.get_in("concrete"),
        },
        energy_required = 0.5,
        technology = { "stone-wall", "concrete" },
        ingredients = {
            { "concrete",   5 },
            { "iron-stick", 4 },
        },
        results = {
            { "stone-wall", 1 },
        },
        category = "crafting",
    },
    {
        name = "refined-concrete-stone-wall",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stone-wall"),
            vgal.icon.get_in("refined-concrete"),
        },
        energy_required = 0.5,
        technology = { "stone-wall", "concrete" },
        ingredients = {
            { "refined-concrete", 2 },
            { "iron-stick",       2 },
        },
        results = {
            { "stone-wall", 1 },
        },
        category = "crafting",
    },
    {
        name = "processing-unit-beacon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("beacon"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 15,
        technology = "effect-transmission", -- why do you even need processing units for the reseach when a beacon does not require it in its recipe normally??????
        ingredients = {
            { "steel-plate",      10 },
            { "copper-cable",     10 },
            { "advanced-circuit", 8 }, -- 800, should be 500; delta = ~300
            { "processing-unit",  2 }, -- 1420, should be 2000; delta = ~500
        },
        results = {
            { "beacon", 1 }, -- 3050
        },
        category = "crafting",
    },
    {
        name = "processing-unit-centrifuge",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("centrifuge"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 6,
        technology = { "uranium-processing", "processing-unit" },
        ingredients = {
            { "refined-concrete", 30 },
            { "steel-plate",      50 },
            { "iron-gear-wheel",  50 }, -- instead of 100, saves 1000
            { "processing-unit",  15 }, -- ~10000
        },
        results = {
            { "centrifuge", 1 }, -- 15700
        },
        category = "crafting",
    },
    {
        name = "processing-unit-nuclear-reactor",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("nuclear-reactor"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 12,
        technology = { "nuclear-power", "processing-unit" },
        ingredients = {
            { "refined-concrete", 150 },
            { "steel-plate",      500 },
            { "copper-plate",     500 },
            { "processing-unit",  70 },
        },
        results = {
            { "nuclear-reactor", 1 },
        },
        category = "crafting",
    },
    {
        name = "processing-unit-roboport",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("roboport"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 10,
        technology = { "construction-robotics", "logistic-robotics", "processing-unit" },
        ingredients = {
            { "steel-plate",     45 },
            { "iron-gear-wheel", 45 },
            { "processing-unit", 6 },
        },
        results = {
            { "roboport", 1 },
        },
        category = "crafting",
    },
    {
        name = "processing-unit-electric-furnace",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electric-furnace"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 10,
        technology = { "advanced-material-processing-2", "processing-unit" },
        ingredients = {
            { "steel-plate",     5 },
            { "stone-brick",     10 },
            { "processing-unit", 1 },
        },
        results = {
            { "electric-furnace", 1 },
        },
        category = "crafting",
    },
    {
        name = "processing-unit-substation",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("substation"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 2,
        technology = { "electric-energy-distribution-2", "processing-unit" },
        ingredients = {
            { "steel-plate",     5 },
            { "copper-cable",    6 },
            { "processing-unit", 1 },
        },
        results = {
            { "substation", 1 },
        },
        category = "crafting",
    },
    {
        name = "processing-unit-tank",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("tank", "item-with-entity-data"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 8,
        technology = { "tank", "processing-unit" },
        ingredients = {
            { "steel-plate",     25 }, -- 1250  o;2500
            { "iron-gear-wheel", 25 }, -- 500
            { "engine-unit",     16 }, -- 1440 o;2880
            { "processing-unit", 4 },  -- 2840 o;1000
        },
        results = {
            { "tank", 1 }, -- 6680
        },
        category = "crafting",
    },
    -- ASSEMBLING MACHINES (expected beltmall config; electric-engine, steel-plate, advanced-circuit, iron-gear-wheel)
    {
        name = "electric-engine-assembling-machine-1",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-1"),
            vgal.icon.get_in("electric-engine-unit"),
        },
        energy_required = 5,
        technology = "electric-engine",
        ingredients = {
            { "steel-plate",          4 },  -- 200
            { "electric-engine-unit", 1 },  -- 180
            { "advanced-circuit",     4 },  -- 400
            { "iron-gear-wheel",      15 }, -- 300
        },
        results = {
            { "assembling-machine-1", 5 }, -- 265*x
        },
        category = "crafting",
    },
    {
        name = "electric-engine-assembling-machine-2", -- hell
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-2"),
            vgal.icon.get_in("electric-engine-unit"),
        },
        energy_required = 1,
        technology = "electric-engine",
        ingredients = {
            { "steel-plate",          1 }, -- 50
            { "electric-engine-unit", 1 }, -- 180
            { "assembling-machine-1", 1 }, -- 265
        },
        fluid_ingredients = {
            { "lubricant", 5 }, -- 40
        },
        results = {
            { "assembling-machine-2", 1 }, -- 540
        },
        category = "crafting-with-fluid",
    },
    {
        name = "electric-engine-assembling-machine-3",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-3"),
            vgal.icon.get_in("electric-engine-unit"),
        },
        energy_required = 1,
        technology = { "electric-engine", "automation-3" },
        ingredients = {
            { "electric-engine-unit", 8 },  -- 1440
            { "iron-gear-wheel",      25 }, -- 400
            { "assembling-machine-2", 1 },  -- 540
        },
        fluid_ingredients = {
            { "lubricant", 50 }, -- 100
        },
        results = {
            { "assembling-machine-3", 1 }, -- 3580
        },
        category = "crafting-with-fluid",
    },
    -- OTHER
    {
        name = "heavy-oil-rail",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("rail", "rail-planner"),
            vgal.icon.get_in("heavy-oil", "fluid"),
        },
        energy_required = 2,
        technology = { "railway", "advanced-oil-processing" },
        ingredients = {
            { "steel-plate", 4 },
            { "iron-stick",  4 },
            { "stone",       1 },
        },
        fluid_ingredients = {
            { "heavy-oil", 10 }, -- creosote
        },
        results = {
            { "rail", 8 },
        },
        category = "crafting-with-fluid",
    },
    {
        name = "advanced-circuit-solar-panel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("solar-panel"),
            vgal.icon.get_in("advanced-circuit"),
        },
        energy_required = 16,
        technology = { "solar-energy", "advanced-circuit" },
        ingredients = {
            { "steel-plate",      4 },
            { "copper-plate",     5 },
            { "advanced-circuit", 4 },
        },
        results = {
            { "solar-panel", 1 },
        },
        category = "crafting",
    },
    {
        name = "electric-engine-unit-electric-mining-drill",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electric-mining-drill"),
            vgal.icon.get_in("electric-engine-unit"),
        },
        energy_required = 4,
        technology = { "electric-mining-drill", "electric-engine" },
        ingredients = {
            { "steel-plate",          1 },
            { "iron-gear-wheel",      2 },
            { "electric-engine-unit", 1 },
        },
        results = {
            { "electric-mining-drill", 1 }, -- 275
        },
        category = "crafting",
    },
    {
        name = "low-density-structure-heat-pipe",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("heat-pipe"),
            vgal.icon.get_in("low-density-structure"),
        },
        energy_required = 1,
        technology = { "uranium-processing", "low-density-structure" },
        ingredients = {
            { "steel-plate",           6 },
            { "copper-plate",          2 },
            { "low-density-structure", 1 }, -- 375
        },
        results = {
            { "heat-pipe", 1 }, -- 700
        },
        category = "crafting",
    },
    {
        name = "iron-stick-concrete",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("concrete"),
            vgal.icon.get_in("iron-stick"),
        },
        energy_required = 10,
        technology = "concrete",
        ingredients = {
            { "iron-stick",  2 },
            { "stone-brick", 5 },
        },
        fluid_ingredients = {
            { "water", 100 },
        },
        results = {
            { "concrete", 10 },
        },
        category = "crafting-with-fluid",
    },
    {
        name = "steam-concrete",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("concrete"),
            vgal.icon.get_in("steam", "fluid"),
        },
        energy_required = 2.5,
        technology = "concrete",
        ingredients = {
            { "iron-stick",  5 },
            { "stone-brick", 4 },
        },
        fluid_ingredients = {
            { "steam", 10 },
        },
        results = {
            { "concrete", 10 },
        },
        category = "crafting-with-fluid",
    },
    {
        name = "advanced-circuit-lab",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("lab"),
            vgal.icon.get_in("advanced-circuit"),
        },
        energy_required = 2,
        technology = { "advanced-circuit", "logistics-2" },
        ingredients = {
            { "fast-transport-belt", 2 }, -- 230
            { "advanced-circuit",    1 }, -- 100
            { "iron-gear-wheel",     2 }, -- 40
        },
        results = {
            { "lab", 1 }, -- 510
        },
        category = "crafting",
    },
    {
        name = "steel-plate-pipe",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("pipe"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 2,
        technology = "steel-processing",
        ingredients = {
            { "steel-plate", 1 },
        },
        results = {
            { "pipe", 5 },
        },
        category = "crafting",
    },
    {
        name = "steel-plate-pipe-to-ground",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("pipe-to-ground"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 1,
        technology = "steel-processing",
        ingredients = {
            { "steel-plate", 1 },
            { "pipe",        10 },
        },
        results = {
            { "pipe-to-ground", 2 },
        },
        category = "crafting",
    },
}

vgal.data.extend {
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
        technology = { "uranium-processing", "processing-unit" },
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
        technology = "electric-engine",
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
    -- {
    --     name = "electric-engine-unit-pump",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("pump"),
    --         vgal.icon.get_in("electric-engine-unit"),
    --     },
    --     energy_required = 4,
    --     technology = { "pump", "electric-engine" },
    --     ingredients = {
    --         { "iron-plate",           1 },
    --         { "iron-gear-wheel",      2 },
    --         { "electric-engine-unit", 1 },
    --     },
    --     results = {
    --         { "pump", 1 },
    --     },
    --     category = "crafting",
    -- },
}

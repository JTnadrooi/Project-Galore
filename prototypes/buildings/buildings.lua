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
            { "copper-wire",      10 },
            { "advanced-circuit", 8 }, -- 800, should be 500; delta = ~300
            { "processing-unit",  2 }, -- 1420, should be 2000; delta = ~500
        },
        results = {
            { "beacon", 1 }, -- 3050
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
        energy_required = 5,
        technology = "electric-engine",
        ingredients = {
            { "steel-plate",          8 }, -- 400
            { "electric-engine-unit", 2 }, -- 360
            { "advanced-circuit",     5 }, -- 500
            { "iron-gear-wheel",      2 }, -- 40
            { "assembling-machine-1", 5 }, -- 265*x(5) = 1325
        },
        fluid_ingredients = {
            { "lubricant", 20 }, -- 40
        },
        results = {
            { "assembling-machine-2", 5 }, -- 540*x(5) = 2700
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
            { "steel-plate",          2 },  -- 50
            { "electric-engine-unit", 4 },  -- 720
            { "advanced-circuit",     8 },  -- 800
            { "iron-gear-wheel",      20 }, -- 400
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
}

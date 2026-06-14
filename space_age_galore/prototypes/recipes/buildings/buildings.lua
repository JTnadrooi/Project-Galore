vgal.data.extend({
    {
        name = "tungsten-carbide-burner-mining-drill",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("burner-mining-drill"),
            vgal.icon.get_in("tungsten-carbide"),
        },
        energy_required = 1,
        technology = "tungsten-carbide",
        fluid_ingredients = {
            { "molten-iron", 100 },
        },
        ingredients = {
            { "tungsten-carbide", 1 }, -- 60
        },
        results = {
            { "burner-mining-drill", 1 }, -- 140 * 1.5 = 210
        },
        category = "metallurgy",
    },
    {
        name = "tungsten-carbide-electric-mining-drill",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electric-mining-drill"),
            vgal.icon.get_in("tungsten-carbide"),
        },
        energy_required = 2,
        technology = "tungsten-carbide",
        fluid_ingredients = {
            { "molten-iron", 200 }, -- 200
        },
        ingredients = {
            { "tungsten-carbide",   1 }, -- 60
            { "electronic-circuit", 4 }, -- 100
        },
        results = {
            { "electric-mining-drill", 1 }, -- 275 * 1.5 = 412
        },
        category = "metallurgy",
    },
    {
        name = "processing-unit-big-mining-drill",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("big-mining-drill"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 32,
        technology = "big-mining-drill",
        fluid_ingredients = {
            { "molten-iron", 200 },
        },
        ingredients = {
            { "electric-mining-drill", 1 },  -- 275
            { "tungsten-carbide",      20 }, -- 1200
            { "electric-engine-unit",  6 },  -- 1020
            { "processing-unit",       1 },  -- 710
        },                                   -- target = 4100
        results = {
            { "big-mining-drill", 1 },       -- 2733 * 1.5 = 4100
        },
        category = "metallurgy",
        surface_conditions =
        {
            {
                property = "pressure",
                min = 4000,
                max = 4000,
            }
        },
    },
    {
        name = "tungsten-carbide-electric-furnace",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electric-furnace"),
            vgal.icon.get_in("tungsten-carbide"),
        },
        energy_required = 5,
        technology = { "tungsten-carbide", "advanced-material-processing-2" },
        fluid_ingredients = {
            { "molten-iron", 200 }, -- 200
        },
        ingredients = {
            { "tungsten-carbide", 8 },  -- 480
            { "advanced-circuit", 4 },  -- 400
            { "stone-brick",      10 }, -- 200
        },
        results = {
            { "electric-furnace", 1 }, -- 1200 * 1.5 = 1800
        },
        category = "metallurgy",
    },
    {
        name = "tungsten-carbide-heat-pipe",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("heat-pipe"),
            vgal.icon.get_in("tungsten-carbide"),
        },
        energy_required = 1,
        technology = { "tungsten-carbide", "nuclear-power" }, -- rip to those who for some reasons go to gleba and vulcanus before nuclear power.
        fluid_ingredients = {
            { "molten-iron",   250 },
            { "molten-copper", 200 },
        },
        ingredients = {
            { "tungsten-carbide", 2 }, -- 150
        },
        results = {
            { "heat-pipe", 1 }, -- 700 * 1.5 = 1050
        },
        category = "metallurgy",
    },
    {
        name = "tungsten-plate-assembling-machine-1",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-1"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 1,
        technology = "tungsten-steel",
        ingredients = {
            { "tungsten-plate",     1 }, -- 60
            { "iron-gear-wheel",    4 }, -- 80
            { "electronic-circuit", 1 }, -- 25
        },
        results = {
            { "assembling-machine-1", 1 }, -- 265
        },
        category = "crafting",
        groups = { "vgal-convoluted" },
    },
    {
        name = "tungsten-plate-assembling-machine-2",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-2"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 1,
        technology = "tungsten-steel",
        ingredients = {
            { "tungsten-plate",       2 }, -- 120
            { "iron-gear-wheel",      5 }, -- 100
            { "assembling-machine-1", 1 }, -- 265
        },
        fluid_ingredients = {
            { "lubricant", 10 }, -- 20
        },
        results = {
            { "assembling-machine-2", 1 }, -- 540
        },
        category = "crafting-with-fluid",
        groups = { "vgal-convoluted" },
    },
    {
        name = "tungsten-plate-assembling-machine-3",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-3"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 1,
        technology = { "automation-3", "tungsten-steel" },
        ingredients = {
            { "electric-engine-unit", 5 },  -- 900
            { "tungsten-plate",       30 }, -- 1800
            { "assembling-machine-2", 1 },  -- 540
        },
        fluid_ingredients = {
            { "lubricant", 40 }, -- 80
        },
        results = {
            { "assembling-machine-3", 1 }, -- 3580
        },
        category = "crafting-with-fluid",
    },
}, {
    type = "recipe",
    groups = { "vgal-buildings" },
})

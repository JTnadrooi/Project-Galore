vgal.data.extend {
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
            { "electric-mining-drill", 1 },
            { "tungsten-carbide",      20 },
            { "electric-engine-unit",  8 },
            { "processing-unit",       1 },
        },
        results = {
            { "big-mining-drill", 1 },
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
        name = "tungsten-plate-assembling-machine-3",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("assembling-machine-3"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 1,
        technology = { "tungsten-steel", "automation-3" },
        fluid_ingredients = {
            { "lubricant",   50 },
            { "molten-iron", 200 },
        },
        ingredients = {
            { "tungsten-plate",       5 },
            { "electric-engine-unit", 6 },
            { "assembling-machine-2", 1 },
        },
        results = {
            { "assembling-machine-3", 1 },
        },
        category = "metallurgy",
    },
    {
        name = "tungsten-carbide-electric-furnace",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electric-furnace"),
            vgal.icon.get_in("tungsten-carbide"),
        },
        energy_required = 5,
        technology = { "tungsten-steel", "advanced-material-processing-2" },
        fluid_ingredients = {
            { "molten-iron", 200 }, -- 200
        },
        ingredients = {
            { "tungsten-carbide", 5 },  -- 500
            { "stone-brick",      10 }, -- 200
            { "advanced-circuit", 1 },  -- 100
        },
        results = {
            { "electric-furnace", 1 }, -- 1200
        },
        category = "metallurgy",
    },
    {
        name = "tungsten-carbide-steel-furnace",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("steel-furnace"),
            vgal.icon.get_in("tungsten-carbide"),
        },
        energy_required = 3,
        technology = { "tungsten-steel", "advanced-material-processing" },
        fluid_ingredients = {
            { "molten-iron", 150 }, -- 150
        },
        ingredients = {
            { "tungsten-carbide", 2 }, -- 200
            { "stone-brick",      5 }, -- 100
        },
        results = {
            { "steel-furnace", 1 }, -- 500
        },
        category = "metallurgy",
    },
    {
        name = "tungsten-carbide-oil-refinery",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("oil-refinery"),
            vgal.icon.get_in("tungsten-carbide"),
        },
        energy_required = 8,
        technology = "tungsten-steel",
        fluid_ingredients = {
            { "molten-iron", 600 },
        },
        ingredients = {
            { "tungsten-carbide",   2 },  -- 200
            { "stone-brick",        5 },  -- 100
            { "electronic-circuit", 10 }, -- 250
        },
        results = {
            { "oil-refinery", 1 }, -- 1500
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
        technology = { "tungsten-steel", "nuclear-power" }, -- rip to those who for some reasons go to gleba and vulcanus before nuclear power.
        fluid_ingredients = {
            { "molten-iron",   150 },                       -- ~250 bc steel
            { "molten-copper", 100 },
        },
        ingredients = {
            { "tungsten-carbide", 2 }, -- 200
        },
        results = {
            { "heat-pipe", 1 }, -- 700
        },
        category = "metallurgy",
    },
    {
        name = "tungsten-carbide-heat-exchanger",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("heat-exchanger"),
            vgal.icon.get_in("tungsten-carbide"),
        },
        energy_required = 1,
        technology = { "tungsten-steel", "nuclear-power" }, -- again, rip to those who for some reasons go to gleba and vulcanus before nuclear power. (y'know space science once used shiny rocks right?)
        fluid_ingredients = {
            { "molten-iron",   400 },                       -- ~500 bc steel
            { "molten-copper", 800 },
        },
        ingredients = {
            { "tungsten-carbide", 2 }, -- 200
        },
        results = {
            { "heat-exchanger", 1 }, -- 1600
        },
        category = "metallurgy",
    },
    {
        name = "tungsten-carbide-boiler",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("boiler"),
            vgal.icon.get_in("tungsten-carbide"),
        },
        energy_required = 1,
        technology = "tungsten-steel",
        fluid_ingredients = {
            { "molten-iron", 20 },
        },
        ingredients = {
            { "tungsten-carbide", 1 }, -- 100
            { "stone-brick",      2 },
        },
        results = {
            { "boiler", 2 }, -- 180
        },
        category = "metallurgy",
    },
    {
        name = "tungsten-carbide-burner-mining-drill",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("burner-mining-drill"),
            vgal.icon.get_in("tungsten-carbide"),
        },
        energy_required = 2,
        technology = "tungsten-steel",
        fluid_ingredients = {
            { "molten-iron", 100 },
        },
        ingredients = {
            { "tungsten-carbide", 1 }, -- 100
        },
        results = {
            { "burner-mining-drill", 2 }, -- 280
        },
        category = "metallurgy",
    },
    -- {
    --     name = "tungsten-carbide-power-plant",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("power-plant"),
    --         vgal.icon.get_in("tungsten-carbide"),
    --     },
    --     energy_required = 2,
    --     technology = "tungsten-steel",
    --     fluid_ingredients = {
    --         { "molten-iron", 100 },
    --     },
    --     ingredients = {
    --         { "tungsten-carbide", 1 }, -- 100
    --     },
    --     results = {
    --         { "power-plant", 1 }, -- 3900
    --     },
    --     category = "metallurgy",
    -- },
    {
        name = "tungsten-carbide-nuclear-reactor",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("nuclear-reactor"),
            vgal.icon.get_in("tungsten-carbide"),
        },
        energy_required = 15,
        technology = { "tungsten-steel", "nuclear-power" },
        fluid_ingredients = {
            { "molten-iron",   15000 },
            { "molten-copper", 2500 },
        },
        ingredients = {
            { "tungsten-carbide", 40 },
            { "refined-concrete", 100 },
            { "processing-unit",  70 },
        },
        results = {
            { "nuclear-reactor", 1 },
        },
        category = "metallurgy",
    },
}

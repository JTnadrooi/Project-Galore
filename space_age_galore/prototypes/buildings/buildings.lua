vgal.data.extend {
    {
        name = "tungsten-carbide-burner-mining-drill",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("burner-mining-drill"),
            vgal.icon.get_in("tungsten-carbide"),
        },
        energy_required = 2,
        technology = "tungsten-carbide",
        fluid_ingredients = {
            { "molten-iron", 300 },
        },
        ingredients = {
            { "tungsten-carbide", 1 }, -- 60
        },
        results = {
            { "burner-mining-drill", 2 }, -- 280 * 1.5 = 420
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
    -- {
    --     name = "tungsten-carbide-steel-furnace",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("steel-furnace"),
    --         vgal.icon.get_in("tungsten-carbide"),
    --     },
    --     energy_required = 3,
    --     technology = { "tungsten-steel", "advanced-material-processing" },
    --     fluid_ingredients = {
    --         { "molten-iron", 150 }, -- 150
    --     },
    --     ingredients = {
    --         { "tungsten-carbide", 2 }, -- 200
    --         { "stone-brick",      5 }, -- 100
    --     },
    --     results = {
    --         { "steel-furnace", 1 }, -- 500
    --     },
    --     category = "metallurgy",
    -- },
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
    -- {
    --     name = "tungsten-carbide-oil-refinery",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("oil-refinery"),
    --         vgal.icon.get_in("tungsten-carbide"),
    --     },
    --     energy_required = 8,
    --     technology = "tungsten-steel",
    --     fluid_ingredients = {
    --         { "molten-iron", 600 },
    --     },
    --     ingredients = {
    --         { "tungsten-carbide",   2 },  -- 200
    --         { "stone-brick",        5 },  -- 100
    --         { "electronic-circuit", 10 }, -- 250
    --     },
    --     results = {
    --         { "oil-refinery", 1 }, -- 1500
    --     },
    --     category = "metallurgy",
    -- },
    -- {
    --     name = "tungsten-carbide-heat-exchanger",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("heat-exchanger"),
    --         vgal.icon.get_in("tungsten-carbide"),
    --     },
    --     energy_required = 1,
    --     technology = { "tungsten-steel", "nuclear-power" }, -- again, rip to those who for some reasons go to gleba and vulcanus before nuclear power. (y'know space science once used shiny rocks right?)
    --     fluid_ingredients = {
    --         { "molten-iron",   400 },                       -- ~500 bc steel
    --         { "molten-copper", 800 },
    --     },
    --     ingredients = {
    --         { "tungsten-carbide", 2 }, -- 200
    --     },
    --     results = {
    --         { "heat-exchanger", 1 }, -- 1600
    --     },
    --     category = "metallurgy",
    -- },
    -- {
    --     name = "tungsten-carbide-boiler",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("boiler"),
    --         vgal.icon.get_in("tungsten-carbide"),
    --     },
    --     energy_required = 1,
    --     technology = "tungsten-steel",
    --     fluid_ingredients = {
    --         { "molten-iron", 20 },
    --     },
    --     ingredients = {
    --         { "tungsten-carbide", 1 }, -- 100
    --         { "stone-brick",      2 },
    --     },
    --     results = {
    --         { "boiler", 2 }, -- 180
    --     },
    --     category = "metallurgy",
    -- },
    {
        name = "molten-iron-molten-copper-space-platform-foundation",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("space-platform-foundation"),
            vgal.icon.get_overlay("casting-iron"),
        },
        energy_required = 12,
        technology = "foundry",
        fluid_ingredients = {
            { "molten-iron",   1000 },
            { "molten-copper", 200 },
        },
        results = {
            { "space-platform-foundation", 1 }, -- x * 1.5 = 1650
        },
        category = "metallurgy",
    },
    {
        name = "low-density-structure-space-platform-foundation",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("space-platform-foundation"),
            vgal.icon.get_in("low-density-structure"),
        },
        energy_required = 10,
        technology = "rocket-silo",
        ingredients = {
            { "low-density-structure", 2 }, -- 750
            { "steel-plate",           5 }, -- 250
        },
        results = {
            { "space-platform-foundation", 1 }, -- 1100
        },
        category = "crafting",
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
    -- {
    --     name = "tungsten-carbide-nuclear-reactor",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("nuclear-reactor"),
    --         vgal.icon.get_in("tungsten-carbide"),
    --     },
    --     energy_required = 15,
    --     technology = { "tungsten-carbide", "nuclear-power" },
    --     fluid_ingredients = {
    --         { "molten-iron",   15000 },
    --         { "molten-copper", 2500 },
    --     },
    --     ingredients = {
    --         { "tungsten-carbide", 40 },
    --         { "refined-concrete", 100 },
    --         { "processing-unit",  70 },
    --     },
    --     results = {
    --         { "nuclear-reactor", 1 },
    --     },
    --     category = "metallurgy",
    -- },
}

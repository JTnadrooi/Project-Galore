vgal.data.extend
{
    {
        name = "iron-gear-wheel-advanced-circuit", -- analog
        prefix = "vgal",
        technology = { "advanced-circuit", "sulfur-processing" },
        icons = vgal.icon.register {
            vgal.icon.get("advanced-circuit"),
            vgal.icon.get_in("iron-gear-wheel"),
            vgal.icon.get_in2("steel-plate"),
        },
        energy_required = 18,
        ingredients = {
            { "plastic-bar",     2 }, -- 30
            { "iron-gear-wheel", 8 }, -- 160
            { "steel-plate",     2 }, -- 100
        },
        results = {
            { "advanced-circuit", 3 }, -- 300
        },
        category = "crafting",
        groups = { "removed" },
    },
    {
        name = "iron-gear-wheel-lubricant-advanced-circuit", -- analog
        prefix = "vgal",
        technology = "lubricant",
        icons = vgal.icon.register {
            vgal.icon.get("advanced-circuit"),
            vgal.icon.get_in("iron-gear-wheel"),
            vgal.icon.get_in2("lubricant", "fluid"),
        },
        energy_required = 18,
        ingredients = {
            { "plastic-bar",     2 }, -- 30
            { "iron-gear-wheel", 6 }, -- 120
            { "iron-plate",      5 }, -- 60
        },
        fluid_ingredients = {
            { "lubricant", 20 }, -- 50
        },
        results = {
            { "advanced-circuit", 3 } -- 300
        },
        category = "crafting-with-fluid",
        groups = { "removed" },
    },
    {
        name = "iron-stick-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("iron-stick"),
        },
        technology = "engine",
        energy_required = 8,
        ingredients = {
            { "iron-gear-wheel", 1 },
            { "iron-stick",      4 },
            { "steel-plate",     1 }
        },
        results = {
            { "engine-unit", 1 },
        },
        category = "advanced-crafting",
        groups = { "removed" },
    },
    {
        name = "iron-gear-wheel-lubricant-electronic-circuit", -- analog
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("iron-gear-wheel"),
            vgal.icon.get_in2("lubricant", "fluid"),
        },
        technology = "lubricant",
        energy_required = 0.5,
        ingredients = {
            { "iron-gear-wheel", 1 },
            { "iron-stick",      1 }
        },
        fluid_ingredients = {
            { "lubricant", 1 },
        },
        results = {
            { "electronic-circuit", 1 }
        },
        category = "crafting-with-fluid",
        groups = { "removed" },
    },
    {
        name = "iron-gear-wheel-electronic-circuit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("iron-gear-wheel"),
        },
        technologies = {
            "circuit-network",
            "concrete",
            "electric-energy-distribution-1",
            "railway",
        },
        energy_required = 0.5,
        ingredients = {
            { "iron-gear-wheel", 1 }, -- 20
            { "iron-stick",      2 }, -- 10
        },
        results = {
            { "electronic-circuit", 1 }
        },
        category = "crafting",
        groups = { "removed" },
    },
    {
        name = "iron-gear-wheel-processing-unit", -- analog
        prefix = "vgal",
        category = "crafting-with-fluid",
        icons = vgal.icon.register {
            vgal.icon.get("processing-unit"),
            vgal.icon.get_in("iron-gear-wheel")
        },
        technology = "processing-unit",
        energy_required = 8,
        ingredients = {
            { "engine-unit",      2 }, -- 180
            { "iron-gear-wheel",  6 }, -- 120
            { "advanced-circuit", 4 }, -- 400
        },
        fluid_ingredients = {
            { "sulfuric-acid", 5 }, -- 10
        },
        results = {
            { "processing-unit", 1 }, -- 710
        },
        groups = { "removed" },
    },
    {
        name = "battery-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("battery"),
        },
        technology = "battery",
        energy_required = 10,
        ingredients = {
            { "iron-gear-wheel", 1 },
            { "copper-cable",    2 },
            { "battery",         1 }
        },
        results = {
            { "engine-unit", 1 },
        },
        category = "advanced-crafting",
        groups = { "removed" },
    },
    {
        name = "plastic-bar-low-density-structure",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("low-density-structure"),
            vgal.icon.get_in("plastic-bar"),
        },
        category = "crafting",
        energy_required = 15,
        technology = "low-density-structure",
        ingredients = {
            { "steel-plate",  3 },  -- 150
            { "plastic-bar",  10 }, -- 150
            { "copper-cable", 15 }, -- 75
        },
        results = {
            { "low-density-structure", 1 }, -- 375
        },
        groups = { "removed" },
    },
    {
        name = "heavy-oil-rocket-fuel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("rocket-fuel"),
            vgal.icon.get_in("heavy-oil", "fluid"),
        },
        technology = "rocket-fuel",
        ingredients = {
            { "solid-fuel", 8 },
        },
        fluid_ingredients = {
            { "heavy-oil", 50 },
        },
        results = {
            { "rocket-fuel", 1 },
            {
                "coal",
                1,
                {
                    probability = 0.25,
                },
            },
        },
        energy_required = 15,
        category = "crafting-with-fluid",
        groups = { "removed" },
    },
}

-- analog circuits have been removed for being to far fetched and unbalanced.

vgal.data.extend
{
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
    },
    {
        name = "iron-stick-low-density-structure",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("low-density-structure"),
            vgal.icon.get_in("iron-stick"),
            vgal.icon.get_in2("heavy-oil", "fluid"),
        },
        category = "crafting-with-fluid",
        energy_required = 15,
        technology = { "low-density-structure", "advanced-oil-processing" },
        ingredients = {
            { "iron-stick",  10 }, -- 50
            { "steel-plate", 5 },  -- 250
        },
        fluid_ingredients = {
            { "heavy-oil", 50 }, -- 100
        },
        results = {
            { "low-density-structure", 1 }, -- 375
        },
    },
    {
        name = "uranium-238-low-density-structure",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("low-density-structure"),
            vgal.icon.get_in("uranium-238"),
        },
        category = "crafting",
        energy_required = 15,
        technology = { "low-density-structure", "uranium-processing" },
        ingredients = {
            { "uranium-238",  1 },  -- 200
            { "steel-plate",  1 },  -- 50
            { "copper-plate", 10 }, -- 100
        },
        results = {
            { "low-density-structure", 1 }, -- 375
        },
    },
    {
        name = "iron-plate-barrel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("barrel"),
            vgal.icon.get_in("iron-plate"),
        },
        category = "crafting",
        energy_required = 2,
        technology = "fluid-handling",
        ingredients = {
            { "iron-plate", 10 },
        },
        results = {
            { "barrel", 1 },
        },
    },
    {
        name = "iron-plate-copper-plate-barrel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("barrel"),
            vgal.icon.get_in("copper-plate"),
            vgal.icon.get_in2("iron-plate"),
        },
        category = "crafting",
        energy_required = 2,
        technology = "fluid-handling",
        ingredients = {
            { "iron-plate",   2 },
            { "copper-plate", 4 },
        },
        results = {
            { "barrel", 1 },
        },
    },
    {
        name = "low-density-structure-barrel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("barrel"),
            vgal.icon.get_in("low-density-structure"),
        },
        category = "crafting-with-fluid",
        energy_required = 15,
        technology = "low-density-structure",
        ingredients = {
            { "iron-plate",            15 },
            { "low-density-structure", 1 },
        },
        fluid_ingredients = {
            { "sulfuric-acid", 5 },
        },
        results = {
            { "barrel", 15 },
        },
    },
    {
        name = "steel-plate-iron-gear-wheel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("iron-gear-wheel"),
            vgal.icon.get_in("steel-plate"),
        },
        category = "crafting",
        energy_required = 3,
        technology = "steel-processing",
        ingredients = {
            { "steel-plate", 1 },
        },
        results = {
            { "iron-gear-wheel", 3 },
        },
    },
    {
        name = "steel-plate-iron-stick",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("iron-stick"),
            vgal.icon.get_in("steel-plate"),
        },
        category = "crafting",
        energy_required = 6,
        technology = "steel-processing",
        ingredients = {
            { "steel-plate", 1 },
        },
        results = {
            { "iron-stick", 12 },
        },
    },
    {
        name = "copper-cable-battery",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("battery"),
            vgal.icon.get_in("copper-cable"),
        },
        category = "chemistry",
        energy_required = 8,
        technology = "battery",
        ingredients = {
            { "copper-cable", 2 },
            { "iron-plate",   2 },
        },
        fluid_ingredients = {
            { "sulfuric-acid", 30 }
        },
        results = {
            { "battery", 2 },
        },
    },
    {
        name = "plastic-bar-repair-pack",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("repair-pack", "repair-tool"),
            vgal.icon.get_in("plastic-bar"),
        },
        technology = "plastics",
        energy_required = 2,
        ingredients = {
            { "electronic-circuit", 2 },
            { "plastic-bar",        4 }
        },
        results = {
            { "repair-pack", 2 },
        },
    },
    {
        name = "steel-plate-uranium-fuel-cell",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("uranium-fuel-cell"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
            vgal.icon.get_in2("steel-plate"),
        },
        technology = "nuclear-power",
        ingredients = {
            { "steel-plate", 2 },
            { "uranium-235", 1 },
            { "uranium-238", 25 },
        },
        fluid_ingredients = {
            { "sulfuric-acid", 20 },
        },
        results = {
            { "uranium-fuel-cell", 15 },
        },
        energy_required = 12,
        category = "crafting-with-fluid",
    },
    {
        name = "low-density-structure-uranium-fuel-cell",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("uranium-fuel-cell"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
            vgal.icon.get_in2("low-density-structure"),
        },
        technology = { "nuclear-power", "low-density-structure" },
        ingredients = {
            { "low-density-structure", 1 },
            { "uranium-235",           1 },
            { "uranium-238",           30 },
        },
        fluid_ingredients = {
            { "sulfuric-acid", 30 },
        },
        results = {
            { "uranium-fuel-cell", 25 },
        },
        energy_required = 25,
        category = "crafting-with-fluid",
    },
    {
        name = "petroleum-gas-rocket-fuel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("rocket-fuel"),
            vgal.icon.get_in("petroleum-gas", "fluid"),
        },
        technology = "rocket-fuel",
        ingredients = {
            { "solid-fuel", 10 },
        },
        fluid_ingredients = {
            { "petroleum-gas", 40 },
        },
        results = {
            { "rocket-fuel", 1 },
        },
        energy_required = 15,
        category = "crafting-with-fluid",
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
            { "coal",        1, 0.25 },
        },
        energy_required = 30,
        category = "crafting-with-fluid",
    },
    {
        name = "copper-cable-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("copper-cable"),
        },
        technology = "plastics",
        ingredients = {
            { "coal",         1 },
            { "copper-cable", 2 },
        },
        fluid_ingredients = {
            { "petroleum-gas", 10 },
        },
        results = {
            { "plastic-bar", 2 },
        },
        energy_required = 1,
        category = "chemistry",
    },
    -- {
    --     name = "light-oil-plastic-bar",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("plastic-bar"),
    --         vgal.icon.get_in("light-oil", "fluid"),
    --     },
    --     technology = "advanced-oil-processing",
    --     ingredients = {
    --         { "coal", 1 },
    --     },
    --     fluid_ingredients = {
    --         { "light-oil", 25 },
    --     },
    --     results = {
    --         { "plastic-bar", 2 },
    --         { "coal",        1, 0.25 },
    --     },
    --     energy_required = 1,
    --     category = "chemistry",
    -- },
    {
        name = "advanced-circuit-flying-robot-frame",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("flying-robot-frame"),
            vgal.icon.get_in("advanced-circuit"),
        },
        technology = "robotics",
        energy_required = 20,
        ingredients = {
            { "electric-engine-unit", 1 },
            { "iron-plate",           4 },
            { "advanced-circuit",     1 },
            { "battery",              1 }, -- 50
        },
        results = {
            { "flying-robot-frame", 1 }, -- 405
        },
        category = "crafting",
    },
    {
        name = "processing-unit-flying-robot-frame",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("flying-robot-frame"),
            vgal.icon.get_in("processing-unit"),
        },
        technology = { "robotics", "processing-unit" },
        energy_required = 100,
        ingredients = {
            { "electric-engine-unit", 5 }, -- 180x (5)
            { "steel-plate",          2 }, -- 200
            { "processing-unit",      1 }, -- 710
            { "battery",              5 }, -- 50x (5)
        },
        results = {
            { "flying-robot-frame", 5 }, -- 405x (5)
        },
        category = "crafting",
    },
}

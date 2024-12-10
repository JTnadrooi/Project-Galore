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
            { "steel-plate", 3 },
            { "plastic-bar", 20 }
        },
        results = {
            { "low-density-structure", 1 },
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
        technology = "low-density-structure",
        ingredients = {
            { "iron-stick",  15 },
            { "steel-plate", 4 },
            { "iron-plate",  4 },
        },
        fluid_ingredients = {
            { "heavy-oil", 50 },
        },
        results = {
            { "low-density-structure", 1 },
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
        energy_required = 1.5,
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
        energy_required = 2,
        technology = "steel-processing",
        ingredients = {
            { "steel-plate", 1 },
            { "iron-plate",  2 },
        },
        results = {
            { "iron-stick", 10 },
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
        energy_required = 1,
        technology = "battery",
        ingredients = {
            { "copper-cable", 2 },
            { "iron-plate",   1 },
        },
        fluid_ingredients = {
            { "sulfuric-acid", 20 }
        },
        results = {
            { "battery", 2 },
        },
    },
    -- {
    --     name = "engine-flying-robot-frame", -- ISSUE #10
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("flying-robot-frame"),
    --         vgal.icon.get_in("advanced-circuit"),
    --     },
    --     energy_required = 40,
    --     technology = "robotics",
    --     category = "crafting",
    --     ingredients = {
    --         { "battery",          1 },
    --         { "speed-module",     1 },
    --         { "advanced-circuit", 2 },
    --     },
    --     results = {
    --         { "flying-robot-frame", 2 },
    --     },
    -- },
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
    -- {
    --     name = "copper-plate-copper-cable",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("copper-cable"),
    --         vgal.icon.get_in("copper-plate"),
    --     },
    --     technology = "advanced-material-processing",
    --     energy_required = 2,
    --     ingredients = {
    --         { "copper-plate", 2 },
    --     },
    --     results = {
    --         { "copper-cable", 6 },
    --     },
    --     category = "smelting",
    -- },
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
    },
    {
        name = "lubricant-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("lubricant", "fluid"),
        },
        technology = "lubricant",
        energy_required = 10,
        ingredients = {
            { "iron-gear-wheel", 1 },
            { "pipe",            2 },
            { "iron-plate",      2 }
        },
        fluid_ingredients = {
            { "lubricant", 5 }
        },
        results = {
            { "engine-unit", 1 },
        },
        category = "crafting-with-fluid",
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
        auto_localise = false,
        category = "advanced-crafting",
    },
    {
        name = "low-density-structure-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("low-density-structure"),
        },
        technology = "low-density-structure",
        energy_required = 120,
        ingredients = {
            { "iron-gear-wheel",       8 },
            { "pipe",                  12 },
            { "low-density-structure", 2 },
        },
        results = {
            { "engine-unit", 12 },
        },
        category = "advanced-crafting",
    },
    {
        name = "advanced-circuit-electric-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electric-engine-unit"),
            vgal.icon.get_in("advanced-circuit"),
        },
        technology = "electric-engine",
        energy_required = 20,
        ingredients = {
            { "engine-unit",      2 },
            { "advanced-circuit", 1 },
        },
        fluid_ingredients = {
            { "lubricant", 25 }
        },
        results = {
            { "electric-engine-unit", 2 },
        },
        category = "crafting-with-fluid",
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
        energy_required = 12,
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
    {
        name = "light-oil-iron-plate-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("light-oil", "fluid"),
        },
        technology = "advanced-oil-processing",
        ingredients = {
            { "coal", 1 },
        },
        fluid_ingredients = {
            { "light-oil", 25 },
        },
        results = {
            { "plastic-bar", 2 },
            { "coal",        1, 0.25 },
        },
        energy_required = 1,
        category = "chemistry",
    },
}

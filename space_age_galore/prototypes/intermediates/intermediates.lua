vgal.data.extend
{
    {
        type = "recipe",
        name = "holmium-solution-copper-cable",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("copper-cable"),
            vgal.icon.get_in("holmium-solution", "fluid"),
        },
        category = "electromagnetics",
        energy_required = 6,
        technology = "holmium-processing",
        fluid_ingredients = {
            { "holmium-solution", 5 }, -- 42.5
        },
        ingredients = {
            { "copper-plate", 10 }, -- 100
        },
        results = {
            { "copper-cable", 30 }, -- 150
        },
    },
    {
        name = "tungsten-plate-barrel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("barrel"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 2,
        technology = "tungsten-steel",
        ingredients = {
            { "tungsten-plate", 1 }, -- 80
            { "iron-plate",     2 }, -- 20
        },
        results = {
            { "barrel", 2 }, -- 100
        },
        category = "crafting",
        groups = { "vgal-barrels" },
    },
    {
        name = "tungsten-plate-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 5,
        technology = "tungsten-steel",
        ingredients = {
            { "tungsten-plate",  1 }, -- 90
            { "iron-gear-wheel", 2 }, -- 20
            { "iron-plate",      2 }, -- 20
        },
        results = {
            { "engine-unit", 2 }, -- 180
        },
        category = "advanced-crafting",
    },
    {
        name = "jelly-crude-oil-solid-fuel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("solid-fuel"),
            vgal.icon.get_in("jelly"),
            -- vgal.icon.get_in2("crude-oil"),
        },
        energy_required = 3,
        technology = "jellynut",
        fluid_ingredients = {
            { "crude-oil", 6 }, -- ~2
        },
        ingredients = {
            { "jelly", 4 }, -- 24
        },
        results = {
            { "solid-fuel", 1 }, -- 20 * 1.5 = 30
        },
        category = "organic",
    },
    -- { -- eventually, I will be able to calculate fulgora stuff..
    --     name = "jelly-light-oil-superconductor",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("superconductor"),
    --         vgal.icon.get_in("crude-oil"),
    --         vgal.icon.get_in2("jelly"),
    --     },
    --     energy_required = 3,
    --     technology = { "jellynut", "electromagnetic-plant" },
    --     fluid_ingredients = {
    --         { "light-oil", 5 }, -- 8
    --     },
    --     ingredients = {
    --         { "jelly", 4 }, -- 24
    --     },
    --     results = {
    --         { "solid-fuel", 1 }, -- 20 * 1.5 = 30
    --     },
    --     category = "organic",
    -- },
    {
        name = "calcite-carbon-stone-brick", -- vu
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stone-brick"),
            vgal.icon.get_in("calcite"),
        },
        energy_required = 5,
        technology = "calcite-processing",
        ingredients = {
            { "carbon",  1 }, -- 30
            { "calcite", 2 }, -- 20
            { "stone",   2 }, -- 20
        },
        results = {
            { "stone-brick", 5 }, -- 100 * 1.5 = 150 (Alright I know this recipe is very efficient but.. on vulcanus stone is a byproduct - to some degree - so I think this is ok?)
        },
        category = "metallurgy",
    },
    {
        name = "calcite-carbon-stone-brick", -- vu
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stone-brick"),
            vgal.icon.get_in("calcite"),
        },
        energy_required = 16,
        technology = "calcite-processing",
        ingredients = {
            { "carbon",  1 }, -- 30
            { "calcite", 2 }, -- 20
            { "stone",   2 }, -- 20
        },
        results = {
            { "stone-brick", 5 }, -- 100 * 1.5 = 150 (Alright I know this recipe is very efficient but.. on vulcanus stone is a byproduct - to some degree - so I think this is ok?)
        },
        category = "metallurgy",
    },
    {
        name = "calcite-carbon-concrete", -- vu
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("concrete"),
            vgal.icon.get_in("calcite"),
        },
        energy_required = 10,
        technology = "calcite-processing",
        fluid_ingredients = {
            { "water", 100 },
        },
        ingredients = {
            { "carbon",      1 }, -- 30
            { "calcite",     2 }, -- 20
            { "stone-brick", 2 }, -- 40
        },
        results = {
            { "concrete", 10 }, -- ~100 * 1.5 = 150
        },
        category = "crafting-with-fluid",
    },
    {
        type = "recipe",
        name = "ammonia-explosives", -- lets goo, less coal usage on gleba!
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("explosives"),
            vgal.icon.get_in("ammonia"),
        },
        category = "chemistry-or-cryogenics",
        category = "chemistry-or-cryogenics",
        energy_required = 10,
        technology = "explosives",
        fluid_ingredients = {
            { "ammonia", 10 } -- 20
        },
        ingredients = {
            { "coal",   1 }, -- 10 (but 210 on gleba)
            { "sulfur", 2 }, -- 30
        },
        results = {
            { "explosives", 4 }, -- 60
        },
    },
    {
        type = "recipe",
        name = "lithium-battery", -- will be used for alternate cryogenic science recipe but currently NO ONE (no one) will be using it.
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("battery"),
            vgal.icon.get_in("lithium"),
        },
        category = "chemistry-or-cryogenics",
        energy_required = 10, -- fast
        technology = "lithium-processing",
        fluid_ingredients = {
            { "ammonia", 10 }, -- 20
        },
        ingredients = {
            { "lithium",      1 }, -- 150
            { "copper-plate", 5 }, -- 50
        },
        results = {
            { "battery", 5 }, -- 250
        },
    },
    {
        type = "recipe",
        name = "pentapod-egg-logistic-robot", -- woah!
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("logistic-robot"),
            vgal.icon.get_in("pentapod-egg"),
        },
        category = "organic",
        energy_required = 1,
        technology = "biochamber",
        ingredients = {
            { "flying-robot-frame", 1 },
            { "pentapod-egg",       1 },
            { "advanced-circuit",   1 },
        },
        results = {
            { "logistic-robot", 1 }, -- * 1.5
        },
    },
    {
        type = "recipe",
        name = "pentapod-egg-construction-robot", -- woah!
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("construction-robot"),
            vgal.icon.get_in("pentapod-egg"),
        },
        category = "organic",
        energy_required = 1,
        technology = "biochamber",
        ingredients = {
            { "flying-robot-frame", 1 },
            { "pentapod-egg",       1 },
            { "electronic-circuit", 1 },
        },
        results = {
            { "construction-robot", 1 }, -- * 1.5
        },
    },
    {
        type = "recipe",
        name = "carbon-fiber-low-density-structure",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("low-density-structure"),
            vgal.icon.get_in("carbon-fiber"),
        },
        category = "crafting",
        energy_required = 15,
        technology = "carbon-fiber",
        ingredients = {
            { "copper-cable", 4 }, -- 20
            { "carbon-fiber", 1 }, -- 200
            { "plastic-bar",  6 }, -- 120
        },
        results = {
            { "low-density-structure", 1 },
        },
    },
    {
        type = "recipe",
        name = "carbon-fiber-molten-copper-low-density-structure",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("low-density-structure"),
            vgal.icon.get_in("carbon-fiber"),
            vgal.icon.get_overlay("casting-copper"),
        },
        category = "metallurgy",
        energy_required = 15,
        technology = { "carbon-fiber", "foundry" },
        fluid_ingredients = {
            { "molten-copper", 40 },
        },
        ingredients = {
            { "carbon-fiber", 1 }, -- 200
            { "plastic-bar",  6 }, -- 120
        },
        results = {
            { "low-density-structure", 1 },
        },
        subgroup = "vulcanus-processes",
        order = "b-f-a",
    },
    {
        type = "recipe",
        name = "ammonia-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("ammonia"),
        },
        category = "chemistry-or-cryogenics",
        energy_required = 10,
        technology = "space-platform",
        fluid_ingredients = {
            { "ammonia", 15 }, -- 30
        },
        ingredients = {
            { "carbon", 1 }, -- 50
        },
        results = {
            { "plastic-bar", 4 }, -- 60 (80gb)
        },
    },
}

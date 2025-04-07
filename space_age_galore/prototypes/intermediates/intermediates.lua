vgal.data.extend({
    -- {
    --     type = "recipe",
    --     name = "carbon-fiber-superconductor",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("superconductor"),
    --         vgal.icon.get_in("carbon-fiber"),
    --     },
    --     category = "electromagnetics",
    --     energy_required = 6,
    --     technology = "carbon-fiber",
    --     ingredients = {
    --         { "carbon-fiber", 1 },
    --         { "calcite",      1 },
    --     },
    --     fluid_ingredients = {
    --         { "light-oil", 5 },
    --     },
    --     results = {
    --         { "superconductor", 2 },
    --     },
    -- },
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
            { "tungsten-plate", 1 }, -- 60
            { "iron-plate",     2 }, -- 20
        },
        results = {
            { "barrel", 2 }, -- 100
        },
        category = "crafting",
        groups = { "vgal-barrels" },
    },
    {
        name = "lava-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("lava"),
        },
        energy_required = 20,
        technology = "foundry",
        fluid_ingredients = {
            { "lava", 250 }, -- 10
        },
        results = {
            { "engine-unit", 1 }, -- 90
            { "stone",       5 }, -- 10
        },
        category = "metallurgy",
        groups = { "vgal-silly" }
    },
    {
        name = "tungsten-plate-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 8,
        technology = "tungsten-steel",
        ingredients = {
            { "tungsten-plate",  1 }, -- 60
            { "iron-gear-wheel", 1 }, -- 20
            { "pipe",            1 }, -- 10
        },
        results = {
            { "engine-unit", 1 }, -- 90
        },
        category = "advanced-crafting",
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
        name = "holmium-ore-holmium-plate", -- fg/vn
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("holmium-plate"),
            -- vgal.icon.get_in("molten-copper"),
            vgal.icon.get_overlay("casting-copper"),
        },
        energy_required = 2,
        technology = { "foundry", "holmium-processing" },
        fluid_ingredients = {
            { "molten-copper", 20 },
        },
        ingredients = {
            { "holmium-ore", 1 },
        },
        results = {
            { "holmium-plate", 2 },
        },
        category = "metallurgy",
    },
    {
        type = "recipe",
        name = "ammonia-explosives", -- lets goo, less coal usage on gleba (and in space)!
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("explosives"),
            vgal.icon.get_in("ammonia"),
        },
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
        name = "wood-carbon-fiber",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("carbon-fiber"),
            vgal.icon.get_in("wood"),
        },
        category = "chemistry-or-cryogenics",
        energy_required = 10,
        technology = "carbon-fiber",
        fluid_ingredients = {
            { "ammonia", 10 } -- 20
        },
        ingredients = {
            { "carbon", 5 },  -- 250
            { "wood",   20 }, -- 200
        },
        results = {
            { "carbon-fiber", 1 }, -- 120
        },
        groups = { "vgal-silly" }
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
        category = "organic-or-assembling",
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
        surface_conditions =
        {
            {
                property = "pressure",
                min = 2000,
                max = 2000
            }
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
        category = "organic-or-assembling",
        energy_required = 1,
        technology = { "biochamber", "construction-robotics" },
        ingredients = {
            { "flying-robot-frame", 1 },
            { "pentapod-egg",       1 },
            { "electronic-circuit", 1 },
        },
        results = {
            { "construction-robot", 1 }, -- * 1.5
        },
        surface_conditions =
        {
            {
                property = "pressure",
                min = 2000,
                max = 2000
            }
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
            { "carbon-fiber", 2 }, -- 240
            { "plastic-bar",  6 }, -- 120
        },
        results = {
            { "low-density-structure", 1 },
        },
    },
    {
        type = "recipe",
        name = "lithium-plate-low-density-structure",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("low-density-structure"),
            vgal.icon.get_in("lithium-plate"),
        },
        category = "crafting",
        energy_required = 12,
        technology = "lithium-processing",
        ingredients = {
            { "carbon",        1 }, -- 50
            { "lithium-plate", 1 }, -- 150
            { "plastic-bar",   5 }, -- 80
        },
        results = {
            { "low-density-structure", 1 },
        },
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
        energy_required = 4,
        technology = "space-platform",
        fluid_ingredients = {
            { "ammonia", 20 }, -- 30
        },
        ingredients = {
            { "carbon", 1 }, -- 50
        },
        results = {
            { "plastic-bar", 5 }, -- 75, 100gb
        },
    },
    {
        type = "recipe",
        name = "pentapod-egg-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("pentapod-egg"),
        },
        category = "organic",
        energy_required = 20,
        technology = "bioflux-processing",
        fluid_ingredients = {
            { "crude-oil", 20 }, -- 10
        },
        ingredients = {
            { "pentapod-egg", 1 },  -- 200
            { "coal",         1 },  -- 210
            { "nutrients",    12 }, -- 120
        },
        results = {
            { "plastic-bar", 20 }, -- 300 (400gb * 1.5 = 600)
        },
        surface_conditions =
        {
            {
                property = "pressure",
                min = 2000,
                max = 2000
            }
        },
    },
    {
        type = "recipe",
        name = "pentapod-egg-bioflux-stone",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("pentapod-egg"),
            vgal.icon.get_out_to("stone"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 45,
        technology = "biochamber",
        ingredients = {
            { "pentapod-egg", 1 }, -- 200
            { "bioflux",      2 }, -- 120
        },
        results = {
            { "stone", nil, { amount_min = 10, amount_max = 30 } }, -- 200 * 1.5 = 300
        },
        show_amount_in_title = false,
        surface_conditions =
        {
            {
                property = "pressure",
                min = 2000,
                max = 2000,
            }
        },
    },
    -- {
    --     type = "recipe",
    --     name = "copper-bacteria-uranium-235-iron-bacteria",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get_in_to("copper-bacteria"),
    --         vgal.icon.get_out_to("iron-bacteria"),
    --         vgal.icon.get_overlay("to"),
    --     },
    --     category = "organic",
    --     energy_required = 45,
    --     technology = "biochamber",
    --     ingredients = {
    --         { "pentapod-egg", 1 }, -- 200
    --         { "bioflux",      2 }, -- 120
    --     },
    --     results = {
    --         { "stone", nil, { amount_min = 10, amount_max = 30 } }, -- 200 * 1.5 = 300
    --     },
    --     show_amount_in_title = false,
    --     surface_conditions =
    --     {
    --         {
    --             property = "pressure",
    --             min = 2000,
    --             max = 2000,
    --         }
    --     },
    -- },
    {
        type = "recipe",
        name = "sulfur-ammonia-nutrients", -- for nauvis / aquilo
        prefix = "vgal",
        icons = vgal.icon.register {
            -- vgal.icon.get_in("sulfur"),
            -- vgal.icon.get_overlay("nutrients"),
            vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/sulfur-ammonia-nutrients.png"),
        },
        category = "organic-or-assembling",
        energy_required = 1,
        technology = "agriculture",
        fluid_ingredients = {
            { "ammonia", 25 }, -- 50
        },
        ingredients = {
            { "sulfur", 1 }, -- 15 (20gb)
        },
        results = {
            { "nutrients", 10 }, -- 100
        },
    },
    -- {
    --     type = "recipe",
    --     name = "lithium-brine-sulfur-ammonia-nutrients", -- for aquilo
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get_from_path("__space_age_galore__/graphics/icons/recipe/sulfur-ammonia-nutrients.png"),
    --         vgal.icon.get_in2("lithium-brine"),
    --     },
    --     category = "chemistry-or-cryogenics",
    --     energy_required = 5,
    --     technology = "lithium-processing",
    --     fluid_ingredients = {
    --         { "ammonia",       50 },
    --         { "lithium-brine", 5 },
    --     },
    --     ingredients = {
    --         { "sulfur", 1 }, -- 15 (20gb)
    --     },
    --     results = {
    --         { "nutrients", 50 },
    --     },
    -- },
    {
        name = "promethium-asteroid-chunk-crushing",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("promethium-asteroid-chunk"),
            vgal.icon.get_overlay("crushing"),
        },
        energy_required = 1,
        technology = "promethium-science-pack",
        ingredients = {
            { "promethium-asteroid-chunk", 1 },
        },
        results = {
            { "promethium-asteroid-chunk", 1, { probability = 0.80 } },
            { "holmium-ore",               1, { probability = 0.005 } },
        },
        category = "crushing",
        order = "b-a-d",
        groups = { "vgal-unsure" },
        show_amount_in_title = false,
        allow_productivity = false,
        allow_quality = true,
        complementairy_recipe = "advanced-metallic-asteroid-crushing",
    },
}, {
    type = "recipe",
})

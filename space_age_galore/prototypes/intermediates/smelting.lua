vgal.data.extend
{
    {
        type = "recipe",
        name = "carbon-steel-plate",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("steel-plate"),
            vgal.icon.get_in("carbon"),
        },
        category = "metallurgy",
        energy_required = 6.4,
        technology = "foundry",
        ingredients = {
            { "iron-ore", 4 }, -- 40
            { "carbon",   1 }, -- 50
        },
        results = {
            { "steel-plate", 2 } -- 100
        },
        groups = { "vgal-unsure" },
    },
    {
        type = "recipe",
        name = "iron-ore-coal-molten-iron", -- future nadrooi, dont add a carbon recipe
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("molten-iron"),
            vgal.icon.get_in("iron-ore"),
            vgal.icon.get_in2("coal"),
        },
        category = "metallurgy",
        energy_required = 32,
        technology = "foundry",
        ingredients = {
            { "iron-ore", 50 },
            { "coal",     25 }, -- calcite is 115 (when imported), this is 240
        },
        fluid_results = {
            { "molten-iron", 400 },
        },
    },
    {
        type = "recipe",
        name = "copper-ore-coal-molten-copper",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("molten-copper"),
            vgal.icon.get_in("copper-ore"),
            vgal.icon.get_in2("coal"),
        },
        category = "metallurgy",
        energy_required = 32,
        technology = "foundry",
        ingredients = {
            { "copper-ore", 50 },
            { "coal",       25 }, -- calcite is 115 (when imported), this is 240
        },
        fluid_results = {
            { "molten-copper", 400 },
        },
    },
    {
        type = "recipe",
        name = "ammonia-calcite-molten-iron",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("molten-iron"),
            vgal.icon.get_in("ammonia"),
        },
        category = "metallurgy",
        energy_required = 32,
        technology = "foundry",
        fluid_ingredients = {
            { "ammonia", 80 }, -- 160
        },
        ingredients = {
            { "iron-ore", 32 }, -- delta = 160
            { "calcite",  1 },
        },
        fluid_results = {
            { "molten-iron", 500 },
        },
    },
    {
        type = "recipe",
        name = "sulfuric-acid-calcite-molten-copper",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("molten-copper"),
            vgal.icon.get_in("sulfuric-acid"),
        },
        category = "metallurgy",
        energy_required = 32,
        technology = "foundry",
        fluid_ingredients = {
            { "sulfuric-acid", 80 }, -- 120
        },
        ingredients = {
            { "copper-ore", 32 }, -- delta = 160
            { "calcite",  1 },
        },
        fluid_results = {
            { "molten-copper", 500 },
        },
    },
    -- {
    --     type = "recipe",
    --     name = "holmium-ore-molten-copper-holmium-plate",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("holmium-plate"),
    --         vgal.icon.get_in("holmium-ore"),
    --     },
    --     category = "metallurgy",
    --     energy_required = 2,
    --     technology = { "foundry", "holmium-processing" },
    --     fluid_ingredients = {
    --         { "molten-copper", 10 },
    --     },
    --     ingredients = {
    --         { "holmium-ore", 1 },
    --     },
    --     results = {
    --         { "holmium-plate", 2 },
    --     },
    -- },
    -- {
    --     name = "metallic-asteroid-chunk-lava",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("lava"),
    --         vgal.icon.get_in_fluid("metallic-asteroid-chunk"),
    --         vgal.icon.get_in_fluid2("calcite"),
    --     },
    --     energy_required = 4,
    --     technology = "foundry",
    --     ingredients = {
    --         { "metallic-asteroid-chunk", 1 },
    --         { "calcite",                 1 },
    --     },
    --     fluid_results = {
    --         { "lava", 200 }, -- 100 molten = 10 ore (exluded the prod)
    --     },
    --     category = "metallurgy",
    -- },
    -- {
    --     name = "metallic-asteroid-chunk-molten-iron-molten-copper",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("metallic-asteroid-chunk"),
    --         vgal.icon.get_out("molten-copper"),
    --         vgal.icon.get_out2("molten-iron"),
    --         vgal.icon.get_in_fluid("calcite"),
    --     },
    --     energy_required = 6,
    --     technology = "foundry",
    --     ingredients = {
    --         { "metallic-asteroid-chunk", 1 },
    --         { "calcite",                 2 },
    --     },
    --     fluid_results = {
    --         { "molten-copper", 30 },
    --         { "molten-iron",   80 },
    --     },
    --     category = "metallurgy",
    -- },
    {
        name = "molten-iron-rail",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("rail"),
            vgal.icon.get_overlay("casting-iron"),
        },
        energy_required = 2,
        technology = "foundry",
        fluid_ingredients = {
            { "molten-iron", 220 },
        },
        ingredients = {
            { "stone", 3 },
        },
        results = {
            { "rail", 6 }, -- 165molten iron
        },
        category = "metallurgy",
        subgroup = "vulcanus-processes",
    },
    {
        name = "molten-iron-refined-concrete",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("refined-concrete"),
            vgal.icon.get_overlay("casting-iron"),
        },
        energy_required = 15,
        technology = "foundry",
        fluid_ingredients = {
            { "molten-iron", 100 },
            { "water",       100 },
        },
        ingredients = {
            { "concrete", 20 },
        },
        results = {
            { "refined-concrete", 10 },
        },
        category = "metallurgy",
        subgroup = "vulcanus-processes",
    },
    {
        name = "molten-iron-molten-copper-uranium-238-low-density-structure",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("casting-low-density-structure", "recipe"),
            vgal.icon.get_in("uranium-238"),
        },
        energy_required = 15,
        technology = { "foundry", "uranium-processing" },
        fluid_ingredients = {
            { "molten-copper", 150 },
            { "molten-iron",   80 },
        },
        ingredients = {
            { "uranium-238", 1 },
        },
        results = {
            { "low-density-structure", 1 },
        },
        category = "metallurgy",
        subgroup = "vulcanus-processes",
        order = "b-f-a",
    },
}

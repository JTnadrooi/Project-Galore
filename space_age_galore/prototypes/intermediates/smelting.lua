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
        name = "metallic-asteroid-chunk-lava",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("lava"),
            vgal.icon.get_in_fluid("metallic-asteroid-chunk"),
            vgal.icon.get_in_fluid2("calcite"),
        },
        energy_required = 4,
        technology = "foundry",
        ingredients = {
            { "metallic-asteroid-chunk", 1 },
            { "calcite",                 1 },
        },
        fluid_results = {
            { "lava", 200 }, -- 100 molten = 10 ore (exluded the prod)
        },
        category = "metallurgy",
    },
    {
        name = "metallic-asteroid-chunk-molten-iron-molten-copper",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("metallic-asteroid-chunk"),
            vgal.icon.get_out("molten-copper"),
            vgal.icon.get_out2("molten-iron"),
            vgal.icon.get_in_fluid("calcite"),
        },
        energy_required = 6,
        technology = "foundry",
        ingredients = {
            { "metallic-asteroid-chunk", 1 },
            { "calcite",                 2 },
        },
        fluid_results = {
            { "molten-copper", 30 },
            { "molten-iron",   80 },
        },
        category = "metallurgy",
    },
    {
        name = "800t-steam-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in_fluid("steam"),
        },
        energy_required = 6,
        technology = "foundry",
        fluid_ingredients = {
            { "steam",       40, { temperature = 800 } },
            { "molten-iron", 80 },
        },
        results = {
            { "engine-unit", 1 },
        },
        fluid_results = {
            { "steam", 10, { temperature = 165 } },
        },
        groups = { "pressure-casting" },
        category = "metallurgy",
    },
    {
        name = "800t-steam-robot-frame",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("robot-frame"),
            vgal.icon.get_in_fluid("steam"),
        },
        energy_required = 15,
        technology = "foundry",
        fluid_ingredients = {
            { "steam",       40, { temperature = 800 } },
            { "molten-iron", 90 },
        },
        ingredients = {
            { "battery",              2 },
            { "electric-engine-unit", 1 },
            { "electronic-circuit",   6 },
        },
        results = {
            { "robot-frame", 1 },
        },
        fluid_results = {
            { "steam", 10, { temperature = 165 } },
        },
        groups = { "pressure-casting" },
        category = "metallurgy",
    },
    {
        name = "800t-steam-robot-frame",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("robot-frame"),
            vgal.icon.get_in_fluid("steam"),
        },
        energy_required = 15,
        technology = "foundry",
        fluid_ingredients = {
            { "steam",       40, { temperature = 800 } },
            { "molten-iron", 90 },
        },
        ingredients = {
            { "battery",              2 },
            { "electric-engine-unit", 1 },
            { "electronic-circuit",   6 },
        },
        results = {
            { "robot-frame", 1 },
        },
        fluid_results = {
            { "steam", 10, { temperature = 165 } },
        },
        groups = { "pressure-casting" },
        category = "metallurgy",
    },
    -- {
    --     name = "800t-steam-low-density-structure",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("low-density-structure"),
    --         vgal.icon.get_in2("steam"),
    --         vgal.icon.get_overlay("heating"),
    --     },
    --     energy_required = 10,
    --     technology = "foundry",
    --     ingredients = {
    --         { "plastic-bar", 4 },
    --     },
    --     fluid_ingredients = {
    --         { "steam",         40, { temperature = 800 } },
    --         { "molten-iron",   80 },
    --         { "molten-copper", 250 },
    --     },
    --     results = {
    --         { "low-density-structure", 1 },
    --     },
    --     fluid_results = {
    --         { "steam", 10, { temperature = 165 } },
    --     },
    --     groups = { "pressure-casting" },
    --     category = "metallurgy",
    -- },
    -- {
    --     name = "165t-steam-water",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("water"),
    --         vgal.icon.get_in_fluid("steam"),
    --         vgal.icon.get_in_fluid2("heating"),
    --     },
    --     energy_required = 1,
    --     technology = "calcite-processing",
    --     fluid_ingredients = {
    --         { "steam", 200, { temperature = 165 } },
    --     },
    --     results = {
    --         { "water", 10 },
    --     },
    --     category = "chemistry",
    --     allow_productivity = false,
    -- },
}

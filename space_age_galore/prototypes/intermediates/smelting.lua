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
    -- {
    --     type = "recipe",
    --     name = "lava-stone",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("stone"),
    --         vgal.icon.get("lava", "fluid"),
    --     },
    --     category = "metallurgy",
    --     energy_required = 12,
    --     technology = "foundry",
    --     fluid_ingredients = {
    --         { "lava", 500 },
    --     },
    --     ingredients = {
    --         { "calcite", 1 },
    --     },
    --     results = {
    --         { "stone", 20 }
    --     },
    -- },
    {
        name = "metallic-asteroid-chunk-lava",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("lava"),
            vgal.icon.get_in("metallic-asteroid-chunk"),
            vgal.icon.get_in2("carbon"),
            -- vgal.icon.get_overlay("heating"),
        },
        energy_required = 4,
        technology = "foundry",
        ingredients = {
            { "metallic-asteroid-chunk", 1 },
            { "carbon",                  1 },
        },
        fluid_results = {
            { "lava", 250 },
        },
        category = "metallurgy",
    },
}

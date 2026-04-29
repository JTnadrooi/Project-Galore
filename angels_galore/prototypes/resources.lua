vgal.data.extend({
    {
        name = "angels-slag-angels-stone-crushed", -- the default "angels-stone-crushed" recipe now requires stone
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-stone-crushed"),
            vgal.icon.get_in("angels-slag"),
        },
        energy_required = 1,
        technology = "angels-ore-crushing",
        ingredients = {
            { "angels-slag", 1 },
        },
        results = {
            { "angels-stone-crushed", 2 },
        },
        category = "angels-ore-refining-t1",
    },
    {
        name = "angels-stone-crushed-angels-solid-sand",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-sand"),
            vgal.icon.get_in("angels-stone-crushed"),
        },
        energy_required = 1,
        technology = "angels-stone-smelting-1",
        ingredients = {
            { "angels-stone-crushed", 2 },
        },
        results = {
            { "angels-solid-sand", 3 },
        },
        category = "angels-ore-refining-t1",
    },
    {
        name = "angels-stone-crushed-stone",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stone"),
            -- vgal.icon.get_in("angels-stone-crushed"),
        },
        energy_required = 3.2,
        enabled = true,
        ingredients = {
            { "angels-stone-crushed", 4 },
        },
        results = {
            { "stone", 2 },
        },
        allow_productivity = false,
        category = "smelting",
    },
    -- {
    --     name = "angels-solid-sand-angels-solid-mud",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("angels-solid-mud"),
    --         -- vgal.icon.get_in("angels-solid-sand"),
    --     },
    --     energy_required = 2,
    --     technology = "angels-stone-smelting-1",
    --     ingredients = {
    --         { "angels-solid-sand", 5 },
    --         { "angels-solid-clay", 1 },
    --     },
    --     fluid_ingredients = {
    --         { "angels-water-mineralized", 20 },
    --     },
    --     results = {
    --         { "angels-solid-mud", 5 },
    --     },
    --     category = "angels-liquifying",
    -- },
    {
        name = "agal-hand-mining", -- I am aware the vgal prefix gets added anyways
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_placeholder(),
            -- vgal.icon.get_out("stone"),
            -- vgal.icon.get_out2("angels-solid-sand"),
            -- vgal.icon.get_out3("angels-solid-limestone"),
        },
        energy_required = 10,
        ingredients = {},
        results = {
            { "stone",                  nil, { amount_min = 1, amount_max = 3 } },
            { "angels-solid-sand",      nil, { amount_min = 2, amount_max = 6 } },
            { "angels-solid-limestone", 1,   { probability = 0.25 } },
        },
        enabled = true,
        show_amount_in_title = false,
        category = "angels-manual-crafting",
    },
}, {
    type = "recipe",
})

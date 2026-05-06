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
        name = "agal-hand-mining", -- the vgal prefix gets added anyways
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
    {
        name = "angels-ore2-crystal-angels-ore3-crystal-uranium-ore",
        prefix = "vgal",
        icons = {
            {
                icon = "__angelsrefininggraphics__/graphics/icons/sort-icon.png",
                icon_size = 32,
            },
            {
                icon = "__base__/graphics/icons/uranium-ore.png",
                icon_size = 64,
                scale = 0.25,
                shift = { 10, 10 },
            },
        },
        technology = "uranium-mining",
        energy_required = 2,
        ingredients = {
            { "angels-ore2-crystal",      1 },
            { "angels-ore3-crystal",      1 },
            { "angels-catalysator-brown", 1 },
        },
        results = {
            { "uranium-ore", 4 }
        },
        category = "angels-ore-sorting",
    },
    {
        name = "angels-ore2-pure-angels-ore3-pure-angels-thorium-ore",
        prefix = "vgal",
        icons = {
            {
                icon = "__angelsrefininggraphics__/graphics/icons/sort-icon.png",
                icon_size = 32,
            },
            {
                icon = "__angelspetrochemgraphics__/graphics/icons/ore-thorium.png",
                icon_size = 64,
                scale = 0.25,
                shift = { 10, 10 },
            },
        },
        technology = "angels-thorium-power",
        energy_required = 2,
        ingredients = {
            { "angels-ore2-pure",         1 },
            { "angels-ore3-pure",         1 },
            { "angels-catalysator-brown", 1 },
        },
        results = {
            { "angels-thorium-ore", 4 }
        },
        category = "angels-ore-sorting",
    },
    {
        name = "angels-solid-limestone-angels-fluorite-ore",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-fluorite-ore"),
        },
        energy_required = 3,
        technology = "angels-stone-smelting-1",
        ingredients = {
            { "angels-solid-limestone",        4 },
            { "angels-solid-sodium-carbonate", 1 },
        },
        fluid_ingredients = {
            { "angels-water-purified", 50 },
        },
        results = {
            { "angels-fluorite-ore", 1 },
        },
        fluid_results = {
            { "angels-water-mineralized", 50, { ignored_by_productivity = 50 } },
        },
        category = "angels-ore-refining-t2",
    },
    {
        name = "angels-thermal-water-angels-water-saline",
        prefix = "vgal",
        -- icons = angelsmods.functions.create_liquid_recipe_icon({
        --     { "__angelspetrochemgraphics__/graphics/icons/ore-fluorite.png", 32 },
        --     "angels-water-saline",
        -- }, "WsFF"),
        icons = vgal.icon.register {
            vgal.icon.get("angels-fluorite-ore"),
        },
        energy_required = 1,
        technology = "angels-thermal-water-extraction",
        ingredients = {
            { "angels-solid-calcium-chloride", 1 },
        },
        fluid_ingredients = {
            { "angels-thermal-water", 100 },
        },
        results = {
            { "angels-fluorite-ore", 1 },
        },
        fluid_results = {
            { "angels-water-saline", 50, { ignored_by_productivity = 50 } },
        },
        category = "angels-water-treatment",
    },
    -- {
    --     name = "angels-thermal-water-angels-fluorite-ore",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("angels-fluorite-ore"),
    --     },
    --     energy_required = 1,
    --     technology = "angels-thermal-water-extraction",
    --     fluid_ingredients = {
    --         { "angels-thermal-water", 100 },
    --     },
    --     ingredients = {
    --         { "angels-solid-calcium-chloride", 1 },
    --     },
    --     results = {
    --         { "angels-fluorite-ore", 1 },
    --     },
    --     category = "angels-crystallizing",
    -- },
}, {
    type = "recipe",
})

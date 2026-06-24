vgal.data.extend({
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
        ingredients = {
            { "angels-stone-crushed", 4 },
        },
        results = {
            { "stone", 2 },
        },
        category = "smelting",
    },
    {
        name = "angels-stone-crushed-angels-solid-carbon-stone",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stone"),
            vgal.icon.get_in("angels-solid-carbon"),
        },
        technology = { "angels-metallurgy-2", "angels-coal-processing" },
        energy_required = 2.4,
        ingredients = {
            { "angels-stone-crushed", 6 },
            { "angels-solid-carbon",  1 }, -- 6
        },
        results = {
            { "stone", 4 },
        },
        category = "angels-sintering",

        order = "ab",
    },
    -- {
    --     name = "angels-stone-crushed-angels-solid-carbon-stone-brick",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("stone-brick"),
    --         vgal.icon.get_in("angels-solid-carbon"),
    --     },
    --     technology = { "angels-metallurgy-2", "angels-coal-processing" },
    --     energy_required = 2,
    --     ingredients = {
    --         { "angels-stone-crushed", 15 },
    --         { "angels-solid-carbon",  2 },
    --         { "angels-solid-lime",    1 },
    --     },
    --     results = {
    --         { "stone-brick", 5 },
    --     },
    --     category = "angels-sintering",

    --     allow_productivity = false,
    -- },
    -- {
    --     name = "agal-hand-mining", -- the vgal prefix gets added anyways
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get_placeholder(),
    --         -- vgal.icon.get_out("stone"),
    --         -- vgal.icon.get_out2("angels-solid-sand"),
    --         -- vgal.icon.get_out3("angels-solid-limestone"),
    --     },
    --     energy_required = 10,
    --     ingredients = {},
    --     results = {
    --         { "stone",             nil, { amount_min = 1, amount_max = 3 } },
    --         { "angels-solid-sand", nil, { amount_min = 2, amount_max = 6 } },
    --         -- { "angels-solid-limestone", 1,   { probability = 0.25 } },
    --     },
    --     enabled = true,
    --     show_amount_in_title = false,
    --     allow_productivity = false,
    --     category = "angels-manual-crafting",
    -- },
    {
        name = "angels-ore3-crystal-uranium-ore",
        prefix = "vgal",
        icons = angelsmods.functions.add_number_icon_layer({
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
        }, 1, angelsmods.petrochem.number_tint),
        technology = "uranium-mining",
        energy_required = 2,
        ingredients = {
            { "angels-ore3-crystal",      3 },
            { "angels-catalysator-brown", 1 },
        },
        results = {
            { "uranium-ore",         5 },
            { "angels-iron-pebbles", 3 },
            -- { "angels-stone-crushed", 2 },
        },
        category = "angels-ore-sorting",
    },
    {
        name = "angels-ore3-pure-uranium-ore",
        prefix = "vgal",
        icons = angelsmods.functions.add_number_icon_layer({
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
        }, 2, angelsmods.petrochem.number_tint),
        technology = { "uranium-mining", "angels-ore-refining" },
        energy_required = 2,
        ingredients = {
            { "angels-ore3-pure",         3 },
            { "angels-catalysator-brown", 1 },
        },
        results = {
            { "uranium-ore",         6 },
            { "angels-iron-pebbles", 4 },
        },
        category = "angels-ore-sorting",
    },
    {
        name = "angels-ore2-pure-angels-thorium-ore",
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
            { "angels-ore2-pure",         3 },
            { "angels-catalysator-green", 1 },
        },
        results = {
            { "angels-thorium-ore",    6 },
            { "angels-copper-pebbles", 2 },
            { "angels-copper-nugget",  1 },
        },
        category = "angels-ore-sorting",
    },
    -- {
    --     name = "angels-liquid-aqueous-sodium-hydroxide-angels-thorium-ore",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("angels-thorium-ore"),
    --         vgal.icon.get_in("angels-liquid-aqueous-sodium-hydroxide"),
    --     },
    --     technology = { "angels-thorium-power", "angels-sodium-processing-1" },
    --     energy_required = 2,
    --     ingredients = {
    --         -- { "angels-catalysator-green", 1 },
    --         { "angels-solid-sand", 5 },
    --     },
    --     fluid_ingredients = {
    --         { "angels-liquid-aqueous-sodium-hydroxide", 10 },
    --     },
    --     results = {
    --         { "angels-thorium-ore", 2 }
    --     },
    --     -- category = "angels-crystallizing",
    --     category = "angels-ore-refining-t3",
    -- },
    -- {
    --     name = "angels-gas-chlorine-angels-thorium-ore",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("angels-thorium-ore"),
    --         vgal.icon.get_in("angels-gas-chlorine"),
    --     },
    --     technology = "angels-thorium-power",
    --     energy_required = 2,
    --     ingredients = {
    --         -- { "angels-catalysator-green", 1 },
    --         { "angels-solid-sand", 5 },
    --     },
    --     fluid_ingredients = {
    --         { "angels-gas-chlorine", 50 },
    --     },
    --     results = {
    --         { "angels-thorium-ore",            1 },
    --         { "angels-solid-calcium-chloride", 1, { probability = 0.4 } }
    --     },
    --     category = "angels-chemical-smelting",
    -- },
    -- {
    --     name = "angels-thermal-water-angels-water-saline",
    --     prefix = "vgal",
    --     -- icons = angelsmods.functions.create_liquid_recipe_icon({
    --     --     { "__angelspetrochemgraphics__/graphics/icons/ore-fluorite.png", 32 },
    --     --     "angels-water-saline",
    --     -- }, "WsFF"),
    --     icons = vgal.icon.register {
    --         vgal.icon.get("angels-fluorite-ore"),
    --     },
    --     energy_required = 2,
    --     technology = "angels-thermal-water-extraction",
    --     ingredients = {
    --         { "angels-solid-calcium-chloride", 2 },
    --     },
    --     fluid_ingredients = {
    --         { "angels-thermal-water", 100 },
    --     },
    --     results = {
    --         { "angels-fluorite-ore", 1 },
    --     },
    --     fluid_results = {
    --         { "angels-water-saline", 50, { ignored_by_productivity = 50 } },
    --     },
    --     category = "angels-water-treatment",
    -- },
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

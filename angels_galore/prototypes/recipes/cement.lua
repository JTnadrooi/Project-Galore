vgal.extend({
    -- {
    --     name = "angels-solid-sand-angels-solid-cement",
    --     prefix = "vgal",
    --     energy_required = 1,
    --     technology = "sulfur-processing",
    --     ingredients = {
    --         { "angels-solid-sand", 1 },
    --         { "angels-solid-lime", 2 },
    --     },
    --     results = {
    --         { "angels-solid-cement", 1 },
    --     },
    --     category = "angels-powder-mixing",
    -- },
    {
        name = "angels-processed-iron-angels-solid-cement",
        prefix = "vgal",
        energy_required = 5,
        technology = { "angels-iron-smelting-2", "angels-stone-smelting-2" },
        ingredients = {
            { "angels-processed-iron", 1 },
            { "angels-solid-lime",     2 },
            { "angels-stone-crushed",  2 },
        },
        results = {
            { "angels-solid-cement", 5 },
        },
        category = "angels-powder-mixing",

        order = "cb"
    },
    {
        name = "angels-solid-calcium-sulfate-angels-solid-cement",
        prefix = "vgal",
        energy_required = 8,
        technology = { "angels-sulfur-processing-2", "angels-stone-smelting-2" },
        ingredients = {
            { "angels-solid-calcium-sulfate", 1 },
            { "angels-processed-iron",        1 },
            { "angels-solid-lime",            2 },
            { "angels-stone-crushed",         2 },
        },
        results = {
            { "angels-solid-cement", 8 },
        },
        category = "angels-powder-mixing",

        order = "cc"
    },
}, {
    type = "recipe",
})

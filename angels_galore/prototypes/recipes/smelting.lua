vgal.data.extend({
    {
        name = "angels-gas-nitrogen-angels-ingot-steel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-ingot-steel"),
            vgal.icon.get_in("angels-slag"),
        },
        energy_required = 4,
        technology = { "angels-nitrogen-processing-1", "angels-steel-smelting-1" },
        ingredients = {
            { "angels-ingot-iron", 24 },
            { "angels-slag",       4 },
        },
        fluid_ingredients = {
            { "angels-gas-nitrogen", 250 },
        },
        results = {
            { "angels-ingot-steel", 8 },
        },
        category = "angels-blast-smelting",

        groups = { "vgal-unsure" }
    },
    {
        name = "angels-solid-carbon-angels-ingot-steel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-ingot-steel"),
            vgal.icon.get_in("angels-solid-carbon"),
        },
        energy_required = 3,
        technology = { "angels-coal-processing", "angels-steel-smelting-1" },
        ingredients = {
            { "angels-ingot-iron",   16 },
            { "angels-solid-carbon", 4 },
        },
        fluid_ingredients = {
            { "angels-gas-oxygen", 40 },
        },
        results = {
            { "angels-ingot-steel", 5 },
        },
        category = "angels-blast-smelting",

        groups = { "vgal-unsure" }
    },
    -- {
    --     name = "angels-solid-sand-angels-ingot-steel",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("angels-ingot-steel"),
    --         vgal.icon.get_in("angels-solid-sand"),
    --     },
    --     energy_required = 4,
    --     technology = { "angels-stone-smelting-1", "angels-steel-smelting-1" },
    --     ingredients = {
    --         { "angels-ingot-iron", 24 },
    --         { "angels-solid-sand", 5 },
    --     },
    --     fluid_ingredients = {
    --         { "angels-gas-oxygen", 40 },
    --     },
    --     results = {
    --         { "angels-ingot-steel", 8 },
    --     },
    --     category = "angels-blast-smelting",
    -- },
}, {
    type = "recipe",
})

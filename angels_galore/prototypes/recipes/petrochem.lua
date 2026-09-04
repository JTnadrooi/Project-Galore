vgal.data.extend({
    {
        name = "sulfuric-acid-angels-solid-carbon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-carbon"),
            vgal.icon.get_in("sulfuric-acid"),
        },
        energy_required = 1,
        technology = "sulfur-processing",
        fluid_ingredients = {
            { "sulfuric-acid", 5 },
        },
        ingredients = {
            { "angels-solid-coke", 2 },
        },
        fluid_results = {
            { "angels-water-yellow-waste", 5 },
        },
        results = {
            { "angels-solid-carbon", 3 },
        },
        category = "angels-liquifying",
    },
    {
        name = "angels-solid-coke-angels-solid-sodium-hydroxide-angels-solid-carbon",
        prefix = "vgal",
        icons = vgal.icon.register({
            vgal.icon.get("angels-solid-carbon"),
            vgal.icon.get_in("angels-solid-sodium-hydroxide"),
        }),
        energy_required = 2,
        technology = "angels-sodium-processing-1",
        ingredients = {
            { "angels-solid-coke",             3 },
            { "angels-solid-sodium-hydroxide", 1 },
        },
        fluid_ingredients = {
            { "angels-gas-nitrogen", 50 },
        },
        results = {
            { "angels-solid-carbon",           6 },
            { "angels-solid-sodium-carbonate", 1, { allow_productivity = false } },
        },
        fluid_results = {
            { "water", 10, { allow_productivity = false } },
        },
        category = "angels-liquifying",

        order = "ab",
        crafting_machine_tint = angelsmods.functions.get_recipe_tints({
            { r = 1, g = 1, b = 1 },
            "angels-gas-nitrogen",
            "water",
            angelsmods.functions.fluid_color("NaCO3"),
        }),
    },
    {
        name = "angels-wood-pellets-angels-solid-coke",
        prefix = "vgal",
        icons = vgal.icon.register({
            vgal.icon.get("angels-solid-coke"),
            vgal.icon.get_in("angels-wood-pellets"),
        }),
        energy_required = 5,
        technology = "angels-bio-wood-processing-2",
        ingredients = {
            { "angels-wood-pellets", 3 },
        },
        fluid_results = {
            { "angels-liquid-condensates", 25 },
        },
        results = {
            { "angels-solid-coke", 2 },
        },
        category = "angels-liquifying",

        groups = { "vgal-unsure" }
    },
    {
        name = "angels-wood-charcoal-angels-coal-crushed",
        prefix = "vgal",
        icons = vgal.icon.register({
            vgal.icon.get("angels-coal-crushed"),
            vgal.icon.get_in("angels-wood-charcoal"),
        }),
        energy_required = 6,
        technology = "angels-bio-wood-processing-2",
        ingredients = {
            { "angels-wood-charcoal", 2 },
            { "angels-coal-crushed",  6 },
        },
        results = {
            { "angels-coal-crushed", 8 },
        },
        category = "angels-ore-refining-t1",

        groups = { "vgal-unsure" }
    },
    -- {
    --     name = "angels-solid-oil-residual-angels-solid-coke",
    --     prefix = "vgal",
    --     icons = vgal.icon.register({
    --         vgal.icon.get("angels-solid-coke"),
    --         vgal.icon.get_in("angels-solid-oil-residual"),
    --     }),
    --     energy_required = 2,
    --     technology = "angels-bio-wood-processing-2",
    --     fluid_ingredients = {
    --         --     { "angels-liquid-vegetable-oil", 100 },
    --         -- { "angels-gas-oxygen", 20 },
    --     },
    --     ingredients = {
    --         -- { "angels-wood-charcoal", 2 },
    --         { "angels-solid-oil-residual", 2 },
    --     },
    --     fluid_results = {
    --         { "angels-gas-methane", 20 },
    --         -- { "angels-water-purified", 30 },
    --     },
    --     results = {
    --         { "angels-solid-coke", 5 },
    --     },
    --     category = "angels-liquifying",
    -- },
}, {
    type = "recipe",
})

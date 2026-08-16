vgal.data.extend({
    {
        name = "angels-solid-sodium-hypochlorite-angels-water-purified",
        prefix = "vgal",
        icons = angelsmods.functions.create_liquid_recipe_icon({
            "angels-water-saline",
            "angels-water-purified",
        }, "WsWsWs", { "angels-solid-sodium-hypochlorite" }),
        energy_required = 5,
        technology = { "angels-chlorine-processing-4", "angels-nitrogen-processing-3", },
        ingredients = {
            { "angels-solid-sodium-hypochlorite", 1 },
            { "angels-solid-carbon",              1 },
        },
        fluid_ingredients = {
            { "water", 5000 },
        },
        results = {
            { "angels-solid-sodium-chlorate", 1 },
        },
        fluid_results = {
            { "angels-water-purified", 4800 },
            { "angels-water-saline",   150 },
        },
        main_product = "angels-water-purified",
        allow_productivity = false,
        category = "angels-water-treatment",
    },
    -- {
    --     name = "angels-thermal-water-angels-water-mineralized",
    --     prefix = "vgal",
    --     icons = angelsmods.functions.create_liquid_recipe_icon({
    --         "angels-water-mineralized",
    --         "angels-fluorite-ore",
    --     }, "WsWsWs", { "angels-solid-calcium-chloride" }),
    --     energy_required = 2,
    --     technology = "angels-thermal-water-extraction",
    --     fluid_ingredients = {
    --         { "angels-thermal-water", 150 },
    --     },
    --     ingredients = {
    --         { "angels-solid-calcium-chloride", 1 },
    --     },
    --     results = {
    --         { "angels-fluorite-ore", 1, { independent_probability = 0.05 } },
    --     },
    --     fluid_results = {
    --         { "angels-water-mineralized", 80 },
    --         { "angels-water-green-waste", 20 },
    --     },
    --     main_product = "angels-water-mineralized",
    --     category = "angels-water-treatment",
    --     allow_productivity = false,
    -- },
}, {
    type = "recipe",
})

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
}, {
    type = "recipe",
})

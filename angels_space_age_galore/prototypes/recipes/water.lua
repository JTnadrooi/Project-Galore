vgal.data.extend({
    {
        name = "water-low-pressure-boiling-steam",
        prefix = "vgal",
        icons = angelsmods.functions.create_liquid_recipe_icon({
            "steam",
        }, "WsWsWs", { "water" }),
        energy_required = 1,
        technology = { "angels-electric-boiler", "space-platform" },
        fluid_ingredients = {
            { "water", 200 },
        },
        fluid_results = {
            { "steam", 200, { temperature = 35 } },
        },
        category = "angels-petrochem-boiler",

        allow_productivity = false,
        surface_conditions = vgal.get_surface_conditions_for("space"),
        groups = { "vgal-unsure" }
    },
}, {
    type = "recipe",
})

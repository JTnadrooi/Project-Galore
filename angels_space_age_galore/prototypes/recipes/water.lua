vgal.extend({
    {
        name = "water-low-pressure-boiling-steam",
        prefix = "vgal",
        vgal.icon.create({
            style   = "angels-liquid",
            outputs = { "steam" },
            inputs  = { "water" },
            palette = "WsWsWs",
        }),
        energy_required = 1,
        technology = { "angels-electric-boiler", "space-platform" },
        ingredients = {
            { "water", 200 },
        },
        results = {
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

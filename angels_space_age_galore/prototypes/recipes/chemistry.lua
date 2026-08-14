vgal.data.extend({
    {
        name = "sulfuric-acid-angels-solid-sodium-hydroxide-steam",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon({
            "steam",
        }, "WsWsWs", {
            "angels-solid-sodium-hydroxide",
            "sulfuric-acid",
        }),
        energy_required = 0.5,
        technology = "calcite-processing",
        fluid_ingredients = {
            { "sulfuric-acid", 200 },
        },
        ingredients = {
            { "angels-solid-sodium-hydroxide", 1 },
        },
        fluid_results = {
            { "steam", 120, { temperature = 500 } },
        },
        category = "angels-liquifying",

        order = "c[acid-neutralisation]-b",
        subgroup = "vgal-water",
        allow_productivity = false,
        surface_conditions = vgal.get_surface_conditions_for("vulcanus"),
    },
}, {
    type = "recipe",
})

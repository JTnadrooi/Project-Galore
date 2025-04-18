vgal.data.extend({
    {
        name = "scrap-crushing",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("scrap"),
            vgal.icon.get_overlay("crushing"),
        },
        energy_required = 0.2,
        technology = "recycling",
        ingredients = {
            { "scrap", 1 },
        },
        results = {
            { "iron-ore",    1, { probability = 0.10, show_details_in_recipe_tooltip = false } },
            { "copper-ore",  1, { probability = 0.04, show_details_in_recipe_tooltip = false } },
            { "stone",       1, { probability = 0.05, show_details_in_recipe_tooltip = false } },
            { "holmium-ore", 1, { probability = 0.015, show_details_in_recipe_tooltip = false } },
        },
        category = "crushing",
        subgroup = "vgal-crushing",
        order = "ga",
        productivity_technology = "scrap-recycling-productivity",
        show_amount_in_title = false,
        groups = { "vgal-unsure" },
    },
    {
        name = "stone-crushing",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stone"),
            vgal.icon.get_overlay("crushing"),
        },
        energy_required = 0.8,
        technology = "calcite-processing",
        ingredients = {
            { "stone", 5 },
        },
        results = {
            { "calcite", 1, { probability = 0.12, show_details_in_recipe_tooltip = false } }, -- 42 stone = 1 calcite,
            { "stone",   1, { probability = 0.10, show_details_in_recipe_tooltip = false } },
        },
        category = "crushing",
        subgroup = "vgal-crushing",
        order = "gb",
        show_amount_in_title = false,
    },
    {
        name = "coal-crushing",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("coal"),
            vgal.icon.get_overlay("crushing"),
        },
        energy_required = 0.8,
        technology = "space-platform",
        ingredients = {
            { "coal", 5 },
        },
        results = {
            { "coal",   1, { probability = 0.10, show_details_in_recipe_tooltip = false } },
            { "carbon", 1, { probability = 0.25, show_details_in_recipe_tooltip = false } },
            { "sulfur", 1, { probability = 0.5, show_details_in_recipe_tooltip = false } },
        },
        category = "crushing",
        subgroup = "vgal-crushing",
        order = "gc",
        show_amount_in_title = false,
    },
}, {
    type = "recipe",
    groups = { "vgal-crushing-recipes" }
})

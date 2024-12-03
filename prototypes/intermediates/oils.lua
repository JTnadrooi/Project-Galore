vgal.data.extend {
    {
        name = "petroleum-gas-heavy-oil",
        prefix = "vgal",
        category = "oil-processing",
        energy_required = 2,
        ingredients = {
            {"coal", 1},
        },
        fluid_ingredients = {
            { "petroleum-gas", 20 },
        },
        fluid_results = {
            {"heavy-oil", 30},
        },
        icons = vgal.icon.register {
                vgal.icon.get("heavy-oil", "fluid"),
                vgal.icon.get_in("petroleum-gas", "fluid"),
        },
        technology = "advanced-oil-processing",
        complementairy_recipe = "advanced-oil-processing",
    },
}

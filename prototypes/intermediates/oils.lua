vgal.data.extend {
    -- region *heavy-oil-from-petroleum-gas
    {
        name = "heavy-oil-from-petroleum-gas",
        prefix = "vgal",
        category = "oil-processing",
        energy_required = 2,
        ingredients = {
            {"coal", 1},
            {"petroleum-gas", 20},
        },
        results = {
            {"heavy-oil", 30},
        },
        icons = vgal.icon.register {
                vgal.icon.get("heavy-oil", "fluid"),
                vgal.icon.get_in("petroleum-gas", "fluid"),
        },
        enabled = false
    },
    -- endregion
}

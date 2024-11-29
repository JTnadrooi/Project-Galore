vgal.data.extend {
    -- region *lab-from-inserter
    {
        type = "recipe",
        name = "vgal-lab-from-inserter",
        icons = vgal.icon.register {
            vgal.icon.get("lab"),
            vgal.icon.get_in("inserter"),
        },
        enabled = true,
        energy_required = 2,
        ingredients = {
            {"electronic-circuit", 8},
            {"iron-gear-wheel", 10},
            {"inserter", 2}
        },
        result = "lab",
        result_count = 1,
    },
    -- endregion
}
vgal.tech.add_recipe("", "vgal-lab-from-inserter")
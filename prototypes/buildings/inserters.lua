vgal.data.extend {
    -- region *inserter-from-copper-plate
    {
        type = "recipe",
        name = "vgal-inserter-from-copper-plate",
        icons = vgal.icon.register {
            vgal.icon.get("inserter"),
            vgal.icon.get_in("copper-plate"),
        },
        enabled = false,
        energy_required = 2,
        ingredients = {
            { "electronic-circuit", 2 },
            { "copper-cable",       6 },
            { "copper-plate",       1 },
        },
        result = "inserter",
        result_count = 2
    },
    -- endregion
    -- region *inserter-from-engine-unit
    {
        type = "recipe",
        name = "vgal-inserter-from-engine-unit",
        icons = vgal.icon.register {
            vgal.icon.get("inserter"),
            vgal.icon.get_in("engine-unit"),
        },
        enabled = false,
        energy_required = 1,
        ingredients = {
            { "engine-unit",        1 },
            { "iron-plate",         2 },
            { "electronic-circuit", 4 },
        },
        result = "inserter",
        result_count = 4
    },
    -- endregion
    -- region *burner-inserter-from-engine-unit
    {
        type = "recipe",
        name = "vgal-burner-inserter-from-engine-unit",
        icons = vgal.icon.register {
            vgal.icon.get("burner-inserter"),
            vgal.icon.get_in("engine-unit"),
        },
        enabled = false,
        energy_required = 1,
        ingredients = {
            { "engine-unit", 1 },
            { "iron-plate",  2 },
        },
        result = "burner-inserter",
        result_count = 4
    },
    -- endregion
}
vgal.tech.add_recipe("", "vgal-inserter-from-copper-plate")
vgal.tech.add_recipe("engine", "vgal-burner-inserter-from-engine-unit")
vgal.tech.add_recipe("engine", "vgal-inserter-from-engine-unit")

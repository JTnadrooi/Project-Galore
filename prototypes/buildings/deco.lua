vgal.data.extend {
    -- region *plastic-small-lamp
    {
        type = "recipe",
        name = "vgal-plastic-small-lamp",
        icons = vgal.icon.register {
            vgal.icon.get("small-lamp"),
            vgal.icon.get_in("plastic-bar"),
        },
        enabled = false,
        ingredients = {
            { "electronic-circuit", 2 },
            { "copper-cable",       2 },
            { "plastic-bar",        2 }
        },
        result = "small-lamp",
        result_count = 2
    }
    -- endregion
}
vgal.tech.add_recipe("plastics", "vgal-plastic-small-lamp")

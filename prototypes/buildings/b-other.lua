vgal:extend
{
    -- region *roboport-from-assembling-machine-2
    {
        type = "recipe",
        name = "vgal-roboport-from-assembling-machine-2",
        icons = vgal.icon.register {
            vgal.icon.get("roboport"),
            vgal.icon.get_in("assembling-machine-2"),
        },
        category = "crafting",
        energy_required = 6,
        enabled = false,
        ingredients = {
            { "assembling-machine-2", 6 }, -- 3,240mw
            { "steel-plate",          6 },
            { "advanced-circuit",     12 },
            { "battery",              6 },
        },
        result = "roboport", -- 9900mw
        result_count = 1
    },
    -- endregion
}
vgal.tech.add_recipe("construction-robotics", "vgal-roboport-from-assembling-machine-2")
vgal.tech.add_recipe("logistic-robotics", "vgal-roboport-from-assembling-machine-2")

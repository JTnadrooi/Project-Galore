vgal.data.extend
{
    -- region *explosives-from-wood
    {
        type = "recipe",
        name = "vgal-explosives-from-wood",
        category = "chemistry",
        crafting_machine_tint = {
            primary = { r = 0.968, g = 0.381, b = 0.259, a = 1.000 },     -- #f66142ff
            secondary = { r = 0.892, g = 0.664, b = 0.534, a = 1.000 },   -- #e3a988ff
            tertiary = { r = 1.000, g = 0.978, b = 0.513, a = 1.000 },    -- #fff982ff
            quaternary = { r = 0.210, g = 0.170, b = 0.013, a = 1.000 }   -- #352b03ff
        },
        icons = vgal.icon.register {
            vgal.icon.get("explosives"),
            vgal.icon.get_in("wood"),
        },
        energy_required = 16,
        enabled = false,
        ingredients = {
            { type = "fluid", name = "petroleum-gas", amount = 10 },
            { type = "item",  name = "coal",          amount = 1 },
            { type = "item",  name = "wood",          amount = 10 },
        },
        result = "explosives",
        result_count = 8
    },
    -- endregion
}
vgal.tech.add_recipe("vgal-biological-explosives", "vgal-explosives-from-wood")

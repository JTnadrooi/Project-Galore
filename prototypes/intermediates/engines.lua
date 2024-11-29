vgal.data.extend
{
    -- region *engine-unit-from-steam-engine
    {
        type = "recipe",
        name = "vgal-engine-unit-from-steam-engine",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("steam-engine"),
        },
        enabled = false,
        energy_required = 40,
        ingredients = {
            { "steam-engine", 1 },
            { "steel-plate",  2 }
        },
        result = "engine-unit",
        category = data.raw["recipe"]["engine-unit"].category,
        result_count = 4
    },
    -- endregion
}
vgal.tech.add_recipe("engine", "vgal-engine-unit-from-steam-engine")

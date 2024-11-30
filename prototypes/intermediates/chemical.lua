vgal.data.extend
{
    -- region *coal-steam-sulfur
    {
        type = "recipe",
        name = "coal-steam-sulfur",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("sulfur"),
            vgal.icon.get_in("coal"),
        },
        category = "chemistry",
        energy_required = 6,
        technology = "sulfur-processing",
        ingredients = {
            { "coal",  6 }
        },
        fluid_ingredients = {
            { "steam", 250 },
        },
        results = {
            { "sulfur", 4 }
        },
        fluid_results = {
            { "water",         10 },
            { "sulfuric-acid", 10 },
        },
    },
    -- endregion
}

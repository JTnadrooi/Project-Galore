vgal.data.extend
{
    {
        type = "recipe",
        name = "solid-fuel-carbon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("carbon"),
            vgal.icon.get_in("solid-fuel"),
        },
        category = "chemistry",
        energy_required = 2,
        technology = "coal-liquefaction",
        fluid_ingredients = {
            { "sulfuric-acid", 10 }, -- 15
        },
        ingredients = {
            { "solid-fuel", 2 }, -- 36
        },
        fluid_results = {
            { "steam", 15, { 165 } },
        },
        results = {
            { "carbon", 1 } -- 50
        },
    },
}

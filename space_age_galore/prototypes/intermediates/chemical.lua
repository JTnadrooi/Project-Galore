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
        energy_required = 6,
        technology = "coal-liquefaction",
        ingredients = {
            { "solid-fuel", 6 }
        },
        fluid_results = {
            { "water", 10 },
        },
        results = {
            { "carbon", 2 }
        },
    },
}

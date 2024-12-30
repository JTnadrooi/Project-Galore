vgal.data.extend
{
    {
        type = "recipe",
        name = "holmium-plate-electronic-circuit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("holmium-plate"),
        },
        category = "electromagnetics",
        energy_required = 5,
        technology = "holmium-processing",
        fluid_ingredients = {
            { "sulfuric-acid", 20 }, -- 30
        },
        ingredients = {
            { "holmium-plate", 1 },  -- 170
            { "copper-cable",  20 }, -- 100
        },
        results = {
            { "electronic-circuit", 20 } -- 500
        },
    },
}

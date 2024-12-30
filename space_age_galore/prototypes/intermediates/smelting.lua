vgal.data.extend
{
    {
        type = "recipe",
        name = "carbon-steel-plate",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("steel-plate"),
            vgal.icon.get_in("carbon"),
        },
        category = "metallurgy",
        energy_required = 6.4,
        technology = "foundry",
        ingredients = {
            { "iron-ore", 6 }, -- 60
            { "carbon",   1 }, -- 50
        },
        results = {
            { "steel-plate", 2 } -- 100
        },
    },
    {
        type = "recipe",
        name = "lava-stone",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stone"),
            vgal.icon.get_in("lava", "fluid"),
        },
        category = "metallurgy",
        energy_required = 12,
        technology = "foundry",
        fluid_ingredients = {
            { "lava", 500 },
        },
        ingredients = {
            { "calcite", 1 },
        },
        results = {
            { "stone", 20 }
        },
    },
}

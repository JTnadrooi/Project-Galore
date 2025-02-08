vgal.data.extend
{
    {
        type = "recipe",
        name = "coal-sulfur",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__vanilla_galore_continued__/graphics/icons/recipe/coal-sulfur.png"),
        },
        category = "chemistry",
        energy_required = 6,
        technology = "sulfur-processing",
        ingredients = {
            { "coal", 6 }
        },
        fluid_ingredients = {
            { "steam", 200 },
        },
        results = {
            { "sulfur", 2 }
        },
    },
    {
        type = "recipe",
        name = "plastic-bar-lubricant",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("lubricant"),
            -- vgal.icon.get_in_fluid("petroleum-gas"),
            vgal.icon.get_in_fluid2("plastic-bar"),
        },
        category = "chemistry",
        energy_required = 2.5,
        technology = "lubricant",
        fluid_ingredients = {
            { "petroleum-gas", 30 }, -- 30
        },
        ingredients = {
            { "plastic-bar", 1 }, -- 15
        },
        fluid_results = {
            { "lubricant", 20 }, -- 40
        },
    },
}

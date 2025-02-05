vgal.data.extend {
    {
        name = "steam-advanced-oil-processing",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_from_path("__vanilla_galore_continued__/graphics/icons/recipe/steam-advanced-oil-processing.png"),
        },
        category = "oil-processing",
        energy_required = 2,
        fluid_ingredients = {
            { "steam",     150 },
            { "crude-oil", 100 }
        },
        fluid_results = {
            { "heavy-oil",     10 },
            { "light-oil",     55 },
            { "petroleum-gas", 75 }
        },
        technology = "advanced-oil-processing",
        complementairy_recipe = "advanced-oil-processing",
        show_amount_in_title = false,
    },
    {
        name = "petroleum-gas-coal-heavy-oil",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("heavy-oil"),
            vgal.icon.get_in_fluid("petroleum-gas"),
        },
        category = "oil-processing",
        energy_required = 1.5,
        ingredients = {
            { "coal", 2 }, -- ~12pg, 10
        },
        fluid_ingredients = {
            { "petroleum-gas", 20 }, -- 20pg, 20
        },
        fluid_results = {
            { "heavy-oil", 30 }, --30pg, 60
        },
        technology = "advanced-oil-processing",
        show_amount_in_title = false,
    },
    {
        name = "steam-heavy-oil-light-oil",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("heavy-oil-cracking", "recipe"),
            vgal.icon.get_in("steam"),
        },
        category = "chemistry",
        energy_required = 1.2,
        fluid_ingredients = {
            { "steam",     100 },
            { "heavy-oil", 50 },
        },
        fluid_results = {
            { "light-oil", 40 },
        },
        technology = "advanced-oil-processing",
        complementairy_recipe = "heavy-oil-cracking",
        show_amount_in_title = false,
    },
    {
        name = "steam-light-oil-petroleum-gas",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("light-oil-cracking", "recipe"),
            vgal.icon.get_in("steam"),
        },
        category = "chemistry",
        energy_required = 1.2,
        fluid_ingredients = {
            { "steam",     100 },
            { "light-oil", 40 },
        },
        fluid_results = {
            { "petroleum-gas", 30 },
        },
        technology = "advanced-oil-processing",
        complementairy_recipe = "light-oil-cracking",
        show_amount_in_title = false,
    },
    {
        name = "steam-sulfur",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("sulfur"),
            vgal.icon.get_in("steam"),
        },
        technology = "sulfur-processing",
        category = "chemistry",
        energy_required = 1,
        fluid_ingredients = {
            { "steam",         100 },
            { "petroleum-gas", 40 },
        },
        results = {
            { "sulfur", 3 },
        },
    },
}

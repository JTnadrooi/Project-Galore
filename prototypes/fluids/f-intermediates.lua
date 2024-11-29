vgal.data.extend {

    -- region *sulfuric-acid-from-steam
    {
        type = "recipe",
        name = "vgal-sulfuric-acid-from-steam",
        icons = vgal.icon.register {
            vgal.icon.get("sulfuric-acid", "fluid"),
            vgal.icon.get_in("steam", "fluid"),
        },
        category = "chemistry",
        energy_required = 2,
        enabled = false,
        ingredients = {
            { type = "fluid", name = "steam",         amount = 100 },
            { type = "fluid", name = "petroleum-gas", amount = 20 },
            { "sulfur",       5 },
            { "iron-ore",     4 }
        },
        results = {
            { type = "fluid", name = "sulfuric-acid", amount = 120 }
        },
        main_product = "sulfuric-acid"
    },
    -- endregion
    -- region *sulfuric-acid-from-coal
    {
        type = "recipe",
        name = "vgal-sulfuric-acid-from-coal",
        icons = vgal.icon.register {
            vgal.icon.get("sulfuric-acid", "fluid"),
            vgal.icon.get_in("coal"),
        },
        category = "chemistry",
        energy_required = 2,
        enabled = false,
        ingredients = {
            { type = "fluid", name = "petroleum-gas", amount = 45 },
            { "coal",         8 },
        },
        results = {
            { type = "fluid", name = "sulfuric-acid", amount = 50 }
        },
        main_product = "sulfuric-acid"
    },
    -- endregion
}
vgal.tech.add_recipe("vgal-sulfuric-intermediates", "vgal-sulfuric-acid-from-steam")
vgal.tech.add_recipe("vgal-sulfuric-intermediates", "vgal-sulfuric-acid-from-coal")

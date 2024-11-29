vgal.data.extend
{

    -- region *sulfur-from-coal-steam
    {
        type = "recipe",
        name = "vgal-sulfur-from-coal-steam",
        icons = vgal.icon.register {
            vgal.icon.get("sulfur"),
            vgal.icon.get_in("coal"),
        },
        category = "chemistry",
        energy_required = 6,
        enabled = false,
        ingredients = {
            { type = "fluid", name = "steam", amount = 15 },
            { "coal",         6 }
        },
        result = "sulfur",
        result_count = 4
    },
    -- endregion
    -- region *coal-from-steam-sulfur
    {
        type = "recipe",
        name = "vgal-coal-from-steam-sulfur",
        icons = vgal.icon.register {
            vgal.icon.get("sulfur"),
            vgal.icon.get_in("coal"),
        },
        category = "chemistry",
        energy_required = 4,
        enabled = false,
        ingredients = {
            { type = "fluid", name = "steam", amount = 20 },
            { "sulfur",       5 },
            { "stone",        2 },
        },
        results = {
            { "coal", 6 }
        }
    },
    -- endregion

    -- region *sulfuric-battery
    {
        type = "recipe",
        name = "vgal-sulfuric-battery",
        icons = vgal.icon.register {
            vgal.icon.get("battery"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
        },
        category = "chemistry",
        energy_required = 35,
        enabled = false,
        ingredients = {
            { type = "fluid", name = "sulfuric-acid", amount = 250 },
            { "copper-plate", 10 },
            { "steel-plate",  2 },
            { "coal",         4 },
        },
        results = {
            { "battery",  15 },
            { "iron-ore", 2 },
        },
        main_product = "battery",
    },
    -- endregion
    -- region *battery-from-sulfur
    {
        type = "recipe",
        name = "vgal-battery-from-sulfur",
        icons = vgal.icon.register {
            vgal.icon.get("battery"),
            vgal.icon.get_in("sulfur"),
        },
        category = "chemistry",
        energy_required = 24,
        enabled = false,
        ingredients = {
            { type = "fluid", name = "petroleum-gas", amount = 20 },
            { "copper-plate", 5 },
            { "iron-plate",   5 },
            { "sulfur",       15 }
        },
        results = {
            { "battery", 5 },
            { "coal",    2 }
        },
        main_product = "battery"
    }
    -- endregion
}

vgal.tech.add_recipe("vgal-sulfuric-intermediates", "vgal-coal-from-steam-sulfur")
vgal.tech.add_recipe("vgal-sulfuric-intermediates", "vgal-sulfur-from-coal-steam")


vgal.tech.add_recipe("battery", "vgal-battery-from-sulfur")
vgal.tech.add_recipe("battery", "vgal-sulfuric-battery")

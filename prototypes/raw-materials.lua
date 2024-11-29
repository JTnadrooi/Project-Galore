vgal.data.extend {



    -- region *coal-from-wood-light-oil
    {
        type = "recipe",
        name = "vgal-coal-from-wood-light-oil",
        category = "smelting",
        energy_required = 15,
        ingredients = {
            { "wood",         25 },
            { type = "fluid", name = "light-oil", amount = 15 }
        },
        icons = vgal.icon.register {
            vgal.icon.get("coal"),
            vgal.icon.get_in("wood"),
            vgal.icon.get_in2("light-oil", "fluid")
        },
        results = {
            { "coal",         20 },
            { "sulfur",       1 },
            { type = "fluid", name = "heavy-oil", amount = 5 }
        },
        enabled = false,
        subgroup = data.raw.item["coal"].subgroup,
        order = data.raw.item["coal"].order
    },
    -- endregion
    -- region *coal-from-wood
    {
        type = "recipe",
        name = "vgal-coal-from-wood",
        energy_required = 4,
        category = "smelting",
        ingredients = {
            { "wood", 10 }
        },
        result = "coal",
        result_count = 5,
        icons = vgal.icon.register {
            vgal.icon.get("coal"),
            vgal.icon.get_in("wood")
        },
        enabled = false
    },
    -- endregion

    -- region *stone-brick-from-landfill
    {
        type = "recipe",
        name = "vgal-stone-brick-from-landfill",
        icons = vgal.icon.register {
            vgal.icon.get("stone-brick"),
            vgal.icon.get_in("landfill")
        },
        category = "smelting",
        energy_required = 12.8,
        enabled = false,
        ingredients = {
            { "landfill", 1 }
        },
        results = {
            { "stone-brick", 8 }
        }
    },
    -- endregion
}

-- tech


vgal.tech.add_recipe("vgal-wood-processing", "vgal-coal-from-wood")

vgal.tech.add_recipe("vgal-wood-processing-3", "vgal-coal-from-wood-light-oil")

vgal.tech.add_recipe("landfill", "vgal-stone-brick-from-landfill")

-- desc

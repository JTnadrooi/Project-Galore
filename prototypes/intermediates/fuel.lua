vgal.data.extend
{

    -- region *rocket-fuel-from-wood
    {
        type = "recipe",
        name = "vgal-rocket-fuel-from-wood",
        category = "chemistry",
        enabled = false,
        energy_required = 25,
        ingredients = {
            { type = "item",  name = vgal.item.get_item_or_invalid_name("wood-pellet"), amount = 12 },  -- it costs ~13 trees.. to keep this machine running for 12 seconds
            { type = "item",  name = "solid-fuel",                                      amount = 10 },
            { type = "fluid", name = "steam",                                           amount = 10 },
        },
        result = "rocket-fuel",
        result_count = 1,
        icons = vgal.icon.register {
            vgal.icon.get("rocket-fuel"),
            vgal.icon.get_in(vgal.item.get_item_or_invalid_name("wood-pellet")),
        }
    },
    -- endregion
    -- region *solid-fuel-from-wood
    {
        type = "recipe",
        name = "vgal-solid-fuel-from-wood",
        energy_required = 2,
        ingredients = {
            { type = "item",  name = vgal.item.get_item_or_invalid_name("wood-pellet"), amount = 2 },
            { type = "fluid", name = "petroleum-gas",                                   amount = 6 },
        },
        results = {
            { type = "item", name = "solid-fuel", amount = 1 },
        },
        main_result = "solid-fuel",
        category = "chemistry",
        subgroup = data.raw.item["solid-fuel"].subgroup,
        order = data.raw.item["solid-fuel"].order,
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("solid-fuel"),
            vgal.icon.get_in(vgal.item.get_item_or_invalid_name("wood-pellet")),
        },
        crafting_machine_tint = {
            primary = { r = 0.05, g = 0.05, b = 0.05, a = 1.000 },
            secondary = { r = 0.145, g = 0.145, b = 0.145, a = 1.000 },
            tertiary = { r = 0.3, g = 0.3, b = 0.3, a = 1.000 }
        }
    },
    -- endregion

    -- region *uranium-fuel-cell-from-steel-plate
    {
        type = "recipe",
        name = "vgal-uranium-fuel-cell-from-steel-plate",
        icons = vgal.icon.register {
            vgal.icon.get("uranium-fuel-cell"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
            vgal.icon.get_in2("steel-plate"),
        },
        ingredients = {
            { "steel-plate",  2 },
            { "uranium-235",  1 },
            { "uranium-238",  19 },
            { type = "fluid", name = "sulfuric-acid", amount = 20 },
        },
        results = {
            { type = "item", name = "uranium-fuel-cell", amount = 15 },
            { "iron-ore",    1 },
        },
        energy_required = 12,
        category = "crafting-with-fluid",
        subgroup = data.raw.item["uranium-fuel-cell"].subgroup,
        order = data.raw.item["uranium-fuel-cell"].order,
        enabled = false,
    },
    -- endregion
}

vgal.tech.add_recipe("vgal-alternative-uranium", "vgal-uranium-fuel-cell-from-steel-plate")

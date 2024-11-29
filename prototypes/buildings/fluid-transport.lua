vgal.data.extend {
    -- region *sulfuric-pipe
    {
        type = "recipe",
        name = "vgal-sulfuric-pipe",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("pipe"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
        },
        energy_required = 1,
        ingredients = {
            { type = "fluid", name = "sulfuric-acid", amount = 20 },
            { type = "item",  name = "iron-plate",    amount = 3 }
        },
        results = {
            { type = "item", name = "pipe",     amount = 6 },
            { type = "item", name = "iron-ore", amount = 1 }
        },
        category = "crafting-with-fluid",
        subgroup = data.raw.item["pipe"].subgroup,
        order = data.raw.item["pipe"].order
    },
    -- endregion
    -- region *sulfuric-empty-barrel
    {
        type = "recipe",
        name = "vgal-sulfuric-empty-barrel",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("empty-barrel"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
        },
        energy_required = 1.5,
        ingredients = {
            { type = "fluid", name = "sulfuric-acid", amount = 20 },
            { type = "item",  name = "steel-plate",   amount = 1 }
        },
        results = {
            { type = "item", name = "empty-barrel", amount = 3 },
            { type = "item", name = "iron-ore",     amount = 1 }
        },
        category = "crafting-with-fluid",
        subgroup = data.raw.item["empty-barrel"].subgroup,
        order = data.raw.item["empty-barrel"].order
    },
    -- endregion
    -- region *boiler-from-storage-tank
    {
        type = "recipe",
        name = "vgal-boiler-from-storage-tank",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("boiler"),
            vgal.icon.get_in("storage-tank"),
        },
        energy_required = 4,
        ingredients = {
            { type = "item", name = "pipe",         amount = 8 },
            { type = "item", name = "storage-tank", amount = 1 },
        },
        results = {
            { type = "item", name = "boiler", amount = 6 },
        },
        category = "crafting",
        subgroup = data.raw.item["boiler"].subgroup,
        order = data.raw.item["boiler"].order
    },
    -- endregion
}
vgal.tech.add_recipe("vgal-sulfuric-intermediates-2", "vgal-sulfuric-empty-barrel")
vgal.tech.add_recipe("vgal-sulfuric-intermediates-2", "vgal-sulfuric-pipe")

vgal.tech.add_recipe("fluid-handling", "vgal-boiler-from-storage-tank")

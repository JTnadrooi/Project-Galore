vgal.data.extend {
    -- region *boiler-from-storage-tank
    {
        name = "boiler-from-storage-tank",
        prefix = "vgal",
        technology = "fluid-handling",
        icons = vgal.icon.register {
            vgal.icon.get("boiler"),
            vgal.icon.get_in("storage-tank"),
        },
        energy_required = 4,
        ingredients = {
            { "pipe",         8 },
            { "storage-tank", 1 },
        },
        results = {
            { "boiler", 6 },
        },
        category = "crafting",
    },
    -- endregion
    -- region *lab-from-inserter
    {
        type = "recipe",
        name = "lab-from-inserter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("lab"),
            vgal.icon.get_in("inserter"),
        },
        technology = "electronics",
        energy_required = 2,
        ingredients = {
            { "electronic-circuit", 8 },
            { "iron-gear-wheel",    10 },
            { "inserter",           2 }
        },
        results = {
            { "lab", 1 },
        },
    },
    -- endregion
}

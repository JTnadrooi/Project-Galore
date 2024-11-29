vgal.data.extend(
    {
        -- region *gun-turret-from-steel
        {
            type = "recipe",
            name = "vgal-gun-turret-from-steel",
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 10,
            ingredients =
            {
                { "steel-plate",  2 },
                { "copper-plate", 10 },
                { "iron-plate",   18 },
                { type = "fluid", name = "sulfuric-acid", amount = 15 },
            },
            result = "gun-turret",
            result_count = 2,
            icons = vgal.icon.register {
                vgal.icon.get("gun-turret"),
                vgal.icon.get_in("sulfuric-acid", "fluid"),
            },
        },
        -- endregion
    })
vgal.tech.add_recipe("vgal-steel-military", "vgal-gun-turret-from-steel") -- todo

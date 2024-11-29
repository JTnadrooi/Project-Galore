vgal.data.extend {
    -- region *car-from-steel
    {
        type = "recipe",
        name = "vgal-car-from-steel",
        icons = vgal.icon.register {
            vgal.icon.get("car", "item-with-entity-data"),
            vgal.icon.get_in("steel-plate"),
        },
        enabled = false,
        energy_required = 2,
        ingredients = {
            { "engine-unit", 8 },
            { "iron-stick",  6 },
            { "steel-plate", 8 }
        },
        result = "car"
    }
    -- endregion
}
vgal.tech.add_recipe("automobilism", "vgal-car-from-steel")
-- endregion
-- region *plaa

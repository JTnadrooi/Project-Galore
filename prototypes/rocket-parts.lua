vgal.data.extend
{
    -- region *rocket-part-electric
    {
        type = "recipe",
        name = "vgal-rocket-part-electric",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("rocket-part"),
            vgal.icon.get_in("electric-engine-unit")
        },
        energy_required = 2,
        ingredients = {
            { type = "item", name = "electric-engine-unit", amount = 10 }, -- todo
            { type = "item", name = "battery-equipment",    amount = 4 },
            { type = "item", name = "rocket-control-unit",  amount = 10 },
        },
        results = {
            { type = "item", name = "rocket-part", amount = 1 },
        },
        category = "rocket-building",
        subgroup = data.raw.item["rocket-part"].subgroup,
        order = data.raw.item["rocket-part"].order
    },
    -- endregion
    -- region *rocket-part-nuclear
    {
        type = "recipe",
        name = "vgal-rocket-part-nuclear",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("rocket-part"),
            vgal.icon.get_in("uranium-235")
        },
        energy_required = 2,
        ingredients = {
            { type = "item", name = "steam-turbine",       amount = 2 }, -- todo
            { type = "item", name = "uranium-fuel-cell",   amount = 1 },
            { type = "item", name = "rocket-control-unit", amount = 10 },
        },
        results = {
            { type = "item", name = "rocket-part", amount = 1 },
        },
        category = "rocket-building",
        subgroup = data.raw.item["rocket-part"].subgroup,
        order = data.raw.item["rocket-part"].order
    },
    -- endregion
    -- region *rocket-part-swarm
    {
        type = "recipe",
        name = "vgal-rocket-part-swarm",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("rocket-part"),
            vgal.icon.get_in("roboport")
        },
        energy_required = 2,
        ingredients = {
            { type = "item", name = "flying-robot-frame",    amount = 20 }, --10740
            { type = "item", name = "processing-unit",       amount = 2 }, -- ~16k
            { type = "item", name = "low-density-structure", amount = 10 }, -- 7270 mw
        },
        results = {
            { type = "item", name = "rocket-part", amount = 1 }, -- 23,580 mw
        },
        category = "rocket-building",
        subgroup = data.raw.item["rocket-part"].subgroup,
        order = data.raw.item["rocket-part"].order
    },
    -- endregion
}
vgal.tech.add_recipe("vgal-rocket-part-electric", "vgal-rocket-part-electric")
vgal.tech.add_recipe("vgal-rocket-part-nuclear", "vgal-rocket-part-nuclear")
vgal.tech.add_recipe("vgal-rocket-part-swarm", "vgal-rocket-part-swarm")

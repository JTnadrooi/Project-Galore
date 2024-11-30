vgal.data.extend
{
    -- -- region *rocket-part-electric
    -- {
    --     name = "rocket-part-electric",
    --     technology = "rocket-silo",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("rocket-part"),
    --         vgal.icon.get_in("electric-engine-unit")
    --     },
    --     energy_required = 3,
    --     ingredients = {
    --         { "electric-engine-unit", 10 }, -- todo
    --         { "battery-equipment",    4 },
    --         { "rocket-control-unit",  10 },
    --     },
    --     results = {
    --         { "rocket-part", 1 },
    --     },
    --     category = "rocket-building",
    -- },
    -- -- endregion
    -- -- region *rocket-part-nuclear
    -- {
    --     name = "rocket-part-nuclear",
    --     prefix = "vgal",
    --     technology = "rocket-silo",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("rocket-part"),
    --         vgal.icon.get_in("uranium-235")
    --     },
    --     energy_required = 4,
    --     ingredients = {
    --         { "steam-turbine",       2 }, -- todo
    --         { "uranium-fuel-cell",   1 },
    --         { "rocket-control-unit", 10 },
    --     },
    --     results = {
    --         { "rocket-part", 1 },
    --     },
    --     category = "rocket-building",
    -- },
    -- -- endregion
    -- region *rocket-part-swarm
    {
        name = "rocket-part-swarm",
        prefix = "vgal",
        technology = "rocket-silo",
        icons = vgal.icon.register {
            vgal.icon.get("rocket-part"),
            vgal.icon.get_in("flying-robot-frame")
        },
        energy_required = 2,
        ingredients = {
            { "flying-robot-frame",    20 }, --10740
            { "processing-unit",       2 },  -- ~16k
            { "low-density-structure", 10 }, -- 7270 mw
        },
        results = {
            { "rocket-part", 1 }, -- 23,580 mw
        },
        category = "rocket-building",
    },
    -- endregion
}

data.raw.recipe["rocket-part"].hidden = false
data.raw["rocket-silo"]["rocket-silo"].fixed_recipe = nil

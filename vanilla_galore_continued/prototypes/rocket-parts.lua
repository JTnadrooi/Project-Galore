vgal.data.extend -- just ignore the graphics of the rocket itself..
{
    {
        name = "engine-unit-rocket-part",
        prefix = "vgal",
        technology = "rocket-silo",
        icons = vgal.icon.register {
            vgal.icon.get("rocket-part"),
            vgal.icon.get_in("engine-unit")
        },
        energy_required = 2,
        ingredients = {
            { "engine-unit",           40 }, -- 3630
            { "rocket-fuel",           20 }, -- 4000
            { "low-density-structure", 10 }, -- 3750
            { "processing-unit",       2 },  -- 1420
        },
        results = {
            { "rocket-part", 1 }, -- 12800
        },
        groups = { "alternate-rocket-part" },
        category = "rocket-building",
    },
    {
        name = "uranium-fuel-cell-rocket-part",
        prefix = "vgal",
        technology = { "rocket-silo", "nuclear-power" },
        icons = vgal.icon.register {
            vgal.icon.get("rocket-part"),
            vgal.icon.get_in("uranium-fuel-cell")
        },
        energy_required = 2,
        ingredients = {
            { "low-density-structure", 6 }, -- 2250
            { "uranium-fuel-cell",     10 }, -- 4600
            { "processing-unit",       10 }, -- 7100
        },
        results = {
            { "rocket-part", 1 }, -- 12800
        },
        groups = { "alternate-rocket-part" },
        category = "rocket-building",
    },
    {
        name = "flying-robot-frame-rocket-part",
        prefix = "vgal",
        technology = "rocket-silo",
        icons = vgal.icon.register {
            vgal.icon.get("rocket-part"),
            vgal.icon.get_in("flying-robot-frame")
        },
        energy_required = 2,
        ingredients = {
            { "flying-robot-frame",    15 },
            { "processing-unit",       4 },  -- 2840
            { "low-density-structure", 10 }, -- 3750
        },
        results = {
            { "rocket-part", 1 }, -- 12800
        },
        groups = { "alternate-rocket-part", "unsure" },
        category = "rocket-building",
    },
}

vgal.data.extend({
    {
        name = "carbon-fiber-rocket-part",
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
        category = "rocket-building",
    },
}, {
    groups = { "vgal-rocket-parts" }
})

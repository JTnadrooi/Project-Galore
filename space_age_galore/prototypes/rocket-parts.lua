vgal.data.extend({
    {
        name = "lithium-plate-rocket-part",
        prefix = "vgal",
        technology = "lithium-processing",
        icons = vgal.icon.register {
            vgal.icon.get("rocket-part"),
            vgal.icon.get_in("lithium-plate")
        },
        energy_required = 3,
        ingredients = {
            { "rocket-fuel",     1 },
            { "processing-unit", 1 },
        },
        results = {
            { "rocket-part", 1 }, -- 12800
        },
        category = "rocket-building",
    },
}, {
    groups = { "vgal-rocket-parts" }
})

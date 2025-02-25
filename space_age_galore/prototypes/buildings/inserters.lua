vgal.data.extend({
    {
        name = "advanced-circuit-stack-inserter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stack-inserter"),
            vgal.icon.get_in("advanced-circuit"),
        },
        technology = "stack-inserter",
        energy_required = 0.5,
        ingredients = {
            { "carbon-fiber",     2 },
            { "bulk-inserter",    1 },
            { "jelly",            10 },
            { "advanced-circuit", 12 },
        },
        results = {
            { "stack-inserter", 1 },
        },
    },
}, {
    groups = { "vgal-buildings" }
})

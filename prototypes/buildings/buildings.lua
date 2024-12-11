vgal.data.extend {
    {
        name = "processing-unit-beacon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("beacon"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 15,
        technology = "effect-transmission", -- why do you even need processing units for the reseach when a beacon does not require it in its recipe normally??????
        ingredients = {
            { "steel-plate",      10 },
            { "copper-wire",      10 },
            { "advanced-circuit", 8 }, -- 800, should be 500; delta = ~300
            { "processing-unit",  2 }, -- 1420, should be 2000; delta = ~500
        },
        results = {
            { "beacon", 1 }, -- 3050
        },
        category = "crafting",
    },

}

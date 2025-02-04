vgal.data.extend {
    {
        name = "explosives-grenade",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("grenade", "capsule"),
            vgal.icon.get_in("explosives"),
        },
        energy_required = 5,
        technology = { "explosives", "military-2" },
        ingredients = {
            { "explosives", 4 }, -- 60
            { "iron-plate", 1 }, -- 70
        },
        results = {
            { "grenade", 1 }, -- 150
        },
        category = "crafting",
    },
    {
        name = "advanced-circuit-radar",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("radar"),
            vgal.icon.get_in("advanced-circuit"),
        },
        energy_required = 1,
        technology = { "radar", "advanced-circuit" },
        ingredients = {
            { "advanced-circuit", 1 },
            { "iron-plate",       10 },
            { "iron-gear-wheel",  5 },
        },
        results = {
            { "radar", 1 },
        },
        category = "crafting",
    },
}

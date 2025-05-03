vgal.data.extend({
    {
        name = "explosives-grenade",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("grenade", "capsule"),
            vgal.icon.get_in("explosives"),
        },
        energy_required = 6,
        technology = { "explosives", "military-2" },
        ingredients = {
            { "explosives", 3 }, -- 45
            { "iron-plate", 1 }, -- 70
        },
        results = {
            { "grenade", 1 }, -- 150
        },
        category = "crafting",
    },
}, {
    type = "recipe",
    groups = { "vgal-military" }
})

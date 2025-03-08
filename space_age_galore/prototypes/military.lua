vgal.data.extend({
    {
        name = "tungsten-plate-piercing-rounds-magazine",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("piercing-rounds-magazine", "ammo"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 6,
        technology = { "tungsten-steel", "military-2" },
        ingredients = {
            { "tungsten-plate",   1 }, -- 90
            { "copper-plate",     4 }, -- 40
            { "firearm-magazine", 2 }, -- 80
        },
        results = {
            { "piercing-rounds-magazine", 2 }, -- 280
        },
        category = "crafting",
    },
    {
        name = "tungsten-plate-cannon-shell",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("cannon-shell", "ammo"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 6,
        technology = { "tungsten-steel", "tank" },
        ingredients = {
            { "tungsten-plate", 1 }, -- 90
            { "plastic-bar",    1 }, -- 15
            { "explosives",     1 }, -- 15
        },
        results = {
            { "cannon-shell", 1 }, -- 145
        },
        category = "crafting",
    },
    {
        name = "tungsten-plate-explosive-cannon-shell",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("explosive-cannon-shell", "ammo"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 6,
        technology = { "tungsten-steel", "tank" },
        ingredients = {
            { "tungsten-plate", 1 }, -- 90
            { "plastic-bar",    1 }, -- 15
            { "explosives",     2 }, -- 15
        },
        results = {
            { "explosive-cannon-shell", 1 }, -- 160
        },
        category = "crafting",
    },
    {
        name = "tungsten-plate-piercing-shotgun-shell",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("piercing-shotgun-shell", "ammo"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 8,
        technology = { "tungsten-steel", "military-4" },
        ingredients = {
            { "tungsten-plate", 1 }, -- 90
            { "copper-plate",   5 }, -- 50
            { "shotgun-shell",  1 }, -- 40
        },
        results = {
            { "piercing-shotgun-shell", 1 }, -- 230
        },
        category = "crafting",
    },
}, {
    type = "recipe",
    groups = { "vgal-military" }
})

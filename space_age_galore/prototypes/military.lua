vgal.data.extend({
    {
        name = "tungsten-plate-piercing-rounds-magazine",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("piercing-rounds-magazine", "ammo"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 3,
        technology = { "tungsten-steel", "military-2" },
        ingredients = {
            { "tungsten-plate",   1 }, -- 60
            { "firearm-magazine", 1 }, -- 40
        },
        results = {
            { "piercing-rounds-magazine", 1 }, -- 140
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
            { "tungsten-plate", 1 }, -- 60
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
            { "tungsten-plate", 2 }, -- 120
            { "shotgun-shell",  2 }, -- 80
        },
        results = {
            { "piercing-shotgun-shell", 1 }, -- 230
        },
        category = "crafting",
    },
    {
        name = "plastic-bar-railgun-ammo",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("railgun-ammo"),
            vgal.icon.get_in("plastic-bar"),
        },
        energy_required = 20,
        technology = "railgun",
        ingredients = {
            { "plastic-bar",  5 },
            { "copper-cable", 10 },
            { "explosives",   2 },
        },
        results = {
            { "railgun-ammo", 1 },
        },
        category = "crafting",
    },
    {
        name = "battery-railgun-ammo",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("railgun-ammo"),
            vgal.icon.get_in("battery"),
        },
        energy_required = 20,
        technology = "railgun",
        ingredients = {
            { "battery",      1 },
            { "copper-cable", 10 },
            { "explosives",   1 },
        },
        results = {
            { "railgun-ammo", 1 },
        },
        category = "crafting",
        groups = { "vgal-unsure-recipes" }
    },
    {
        name = "electronic-circuit-railgun-turret",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("railgun-turret"),
            vgal.icon.get_in("electronic-circuit"),
        },
        energy_required = 20,
        technology = "railgun",
        fluid_ingredients = {
            { "lubricant", 250 },
        },
        ingredients = {
            { "electronic-circuit", 10000 },
            { "steel-plate",        800 },
            { "pipe",               50 },
            { "copper-cable",       100 },
            { "iron-gear-wheel",    1200 },
        },
        results = {
            { "railgun-turret", 1 },
        },
        category = "crafting-with-fluid",
        groups = { "vgal-silly-recipes" }
    },
}, {
    type = "recipe",
    groups = { "vgal-military" }
})

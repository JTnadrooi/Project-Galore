vgal.data.extend
{
    {
        type = "recipe",
        name = "holmium-solution-copper-cable",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("copper-cable"),
            vgal.icon.get_in("holmium-solution", "fluid"),
        },
        category = "electromagnetics",
        energy_required = 6,
        technology = "holmium-processing",
        fluid_ingredients = {
            { "holmium-solution", 5 }, -- 42.5
        },
        ingredients = {
            { "copper-plate", 10 }, -- 100
        },
        results = {
            { "copper-cable", 30 }, -- 150
        },
    },
    {
        type = "recipe",
        name = "holmium-plate-flying-robot-frame",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("flying-robot-frame"),
            vgal.icon.get_in("holmium-plate"),
        },
        category = "electromagnetics",
        energy_required = 40,
        technology = { "holmium-processing", "robotics" },
        fluid_ingredients = {
            { "holmium-solution", 10 }, -- 85
        },
        ingredients = {
            { "electric-engine-unit", 2 }, -- 360
            { "holmium-plate",        1 }, -- 170
            { "battery",              2 }, -- 100
        },
        results = {
            { "flying-robot-frame", 2 }, -- 810
        },
    },
    {
        name = "tungsten-plate-barrel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("barrel"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 5,
        technology = "tungsten-steel",
        ingredients = {
            { "tungsten-plate", 1 }, -- 90
            { "iron-plate",     4 }, -- 40
        },
        results = {
            { "barrel", 4 }, -- 200
        },
        category = "crafting",
    },
    {
        name = "tungsten-plate-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 5,
        technology = "tungsten-steel",
        ingredients = {
            { "tungsten-plate",  1 }, -- 90
            { "iron-gear-wheel", 4 }, -- 40
            { "iron-plate",      2 }, -- 20
        },
        results = {
            { "engine-unit", 2 }, -- 180
        },
        category = "crafting",
    },
}

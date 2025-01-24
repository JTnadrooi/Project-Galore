vgal.data.extend
{
    {
        type = "recipe",
        name = "holmium-plate-electronic-circuit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("holmium-plate"),
        },
        category = "electromagnetics",
        energy_required = 5,
        technology = "holmium-processing",
        fluid_ingredients = {
            { "sulfuric-acid", 20 }, -- 30
        },
        ingredients = {
            { "holmium-plate", 1 },  -- 170
            { "copper-cable",  20 }, -- 100
        },
        results = {
            { "electronic-circuit", 20 } -- 500
        },
    },
    {
        type = "recipe",
        name = "jelly-electronic-circuit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("jelly"),
        },
        category = "organic",
        energy_required = 0.6,
        technology = "biochamber",
        ingredients = {
            { "jelly",       2 }, -- 32
            { "plastic-bar", 1 }, -- 30
        },
        results = {
            { "electronic-circuit", 1 } -- 50 * 1.5 = 75
        },
        groups = { "organic-circuit" }
    },
    {
        type = "recipe",
        name = "jelly-ammonia-electronic-circuit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electronic-circuit"),
            vgal.icon.get_in("jelly"),
            vgal.icon.get_in2("ammonia"),
        },
        category = "organic",
        energy_required = 0.6,
        technology = "biochamber",
        fluid_ingredients = {
            { "ammonia", 5 }, -- 30
        },
        ingredients = {
            { "jelly",       2 }, -- 32
            { "plastic-bar", 1 }, -- 30
        },
        results = {
            { "electronic-circuit", 1 } -- 50 * 1.5 = 75
        },
        groups = { "organic-circuit" }
    },
    {
        type = "recipe",
        name = "yumako-mash-advanced-circuit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("advanced-circuit"),
            vgal.icon.get_in("yumako-mash"),
        },
        category = "organic",
        energy_required = 12,
        technology = "biochamber",
        ingredients = {
            { "yumako-mash",        2 }, -- 30
            { "plastic-bar",        2 }, -- 30
            { "electronic-circuit", 2 }, -- 50
        },
        results = {
            { "advanced-circuit", 1 } -- 100 * 1.5 = 150
        },
        groups = { "organic-circuit" }
    },
    {
        type = "recipe",
        name = "bioflux-processing-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("processing-unit"),
            vgal.icon.get_in("bioflux"),
        },
        category = "organic",
        energy_required = 12,
        technology = "biochamber",
        fluid_ingredients = {
            { "sulfuric-acid", 10 }, -- 20
        },
        ingredients = {
            { "bioflux",          6 }, -- 540
            { "advanced-circuit", 2 }, -- 200
        },
        results = {
            { "processing-unit", 1 } -- 710 * 1.5 = ~1000
        },
        groups = { "organic-circuit" }
    },
}

vgal.data.extend({
    {
        name = "molten-iron-rail",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("rail"),
            vgal.icon.get_overlay("casting-iron"),
        },
        energy_required = 2,
        technology = "foundry",
        fluid_ingredients = {
            { "molten-iron", 220 },
        },
        ingredients = {
            { "stone", 3 },
        },
        results = {
            { "rail", 6 },
        },
        category = "metallurgy",
        subgroup = "vulcanus-processes",
    },
    {
        name = "molten-iron-refined-concrete",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("refined-concrete"),
            vgal.icon.get_overlay("casting-iron"),
        },
        energy_required = 15,
        technology = "foundry",
        fluid_ingredients = {
            { "molten-iron", 100 },
            { "water",       100 },
        },
        ingredients = {
            { "concrete", 20 },
        },
        results = {
            { "refined-concrete", 10 },
        },
        category = "metallurgy",
        subgroup = "vulcanus-processes",
        allow_productivity = true,
    },
    {
        name = "ammonia-artificial-jellynut-soil",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("artificial-jellynut-soil"),
            vgal.icon.get_in("ammonia"),
        },
        energy_required = 2,
        technology = "artificial-soil",
        ingredients = {
            { "jellynut-seed", 1 },
            { "nutrients",     40 },
            { "landfill",      5 },
        },
        fluid_ingredients = {
            { "ammonia", 100 },
        },
        results = {
            { "artificial-jellynut-soil", 10 },
        },
        category = "crafting-with-fluid",
    },
    {
        name = "ammonia-artificial-yumako-soil",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("artificial-yumako-soil"),
            vgal.icon.get_in("ammonia"),
        },
        energy_required = 2,
        technology = "artificial-soil",
        ingredients = {
            { "yumako-seed", 1 },
            { "nutrients",   40 },
            { "landfill",    5 },
        },
        fluid_ingredients = {
            { "ammonia", 100 },
        },
        results = {
            { "artificial-yumako-soil", 10 },
        },
        category = "crafting-with-fluid",
    },
    {
        type = "recipe",
        name = "low-density-structure-ice-platform",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("ice-platform"),
            vgal.icon.get_in("low-density-structure"),
        },
        category = "crafting-with-fluid",
        energy_required = 30,
        technology = "planet-discovery-aquilo",
        ingredients = {
            { "low-density-structure", 1 },
            { "ice",                   25 },
        },
        fluid_ingredients = {
            { "ammonia", 100 },
        },
        results = {
            { "ice-platform", 1 },
        },
    },
    {
        name = "molten-iron-molten-copper-space-platform-foundation",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("space-platform-foundation"),
            vgal.icon.get_overlay("casting-iron-copper"),
        },
        energy_required = 12,
        technology = "foundry",
        fluid_ingredients = {
            { "molten-iron",   1000 },
            { "molten-copper", 200 },
        },
        results = {
            { "space-platform-foundation", 1 }, -- x * 1.5 = 1650
        },
        category = "metallurgy",
    },
    {
        name = "low-density-structure-space-platform-foundation",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("space-platform-foundation"),
            vgal.icon.get_in("low-density-structure"),
        },
        energy_required = 10,
        technology = "rocket-silo",
        ingredients = {
            { "low-density-structure", 2 }, -- 750
            { "steel-plate",           5 }, -- 250
        },
        results = {
            { "space-platform-foundation", 1 }, -- 1100
        },
        category = "crafting",
    },
}, {
    type = "recipe",
    groups = { "vgal-buildings" },
})

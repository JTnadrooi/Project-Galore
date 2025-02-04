vgal.data.extend {
    {
        name = "processing-unit-personal-roboport-equipment",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("personal-roboport-equipment"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 15,
        technology = { "personal-roboport-equipment", "processing-unit" },
        ingredients = {
            { "battery",         30 },
            { "iron-gear-wheel", 40 },
            { "steel-plate",     20 },
            { "processing-unit", 2 },
        },
        results = {
            { "personal-roboport-equipment", 1 },
        },
        category = "crafting",
    },
    {
        name = "processing-unit-belt-immunity-equipment",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("belt-immunity-equipment"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 12,
        technology = { "processing-unit", "belt-immunity-equipment" },
        ingredients = {
            { "processing-unit", 1 },
            { "steel-plate",     5 },
        },
        results = {
            { "belt-immunity-equipment", 1 },
        },
        category = "crafting",
    },
    {
        name = "processing-unit-energy-shield-equipment",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("energy-shield-equipment"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 12,
        technology = { "processing-unit", "energy-shield-equipment" },
        ingredients = {
            { "processing-unit", 1 },
            { "steel-plate",     5 },
        },
        results = {
            { "energy-shield-equipment", 1 },
        },
        category = "crafting",
    },
    {
        name = "processing-unit-night-vision-equipment",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("night-vision-equipment"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 12,
        technology = { "processing-unit", "night-vision-equipment" },
        ingredients = {
            { "processing-unit", 1 },
            { "steel-plate",     5 },
        },
        results = {
            { "night-vision-equipment", 1 },
        },
        category = "crafting",
    },
}

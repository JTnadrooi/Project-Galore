vgal.data.extend {
    {
        name = "processing-unit-personal-roboport-equipment",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("personal-roboport-equipment"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 15,
        technology = { "personal-roboport-equipment", "processing-unit", "low-density-structure" },
        ingredients = {
            { "battery",               20 },
            { "iron-gear-wheel",       20 },
            { "low-density-structure", 4 },
            { "processing-unit",       2 },
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
    {
        name = "processing-unit-modular-armor",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("modular-armor"),
            vgal.icon.get_in("processing-unit"),
        },
        energy_required = 20,
        technology = { "processing-unit", "low-density-structure", "modular-armor" },
        ingredients = {
            { "processing-unit",       4 },
            { "low-density-structure", 6 },
        },
        results = {
            { "modular-armor", 1 },
        },
        category = "crafting",
    },
    {
        name = "low-density-structure-power-armor",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("power-armor"),
            vgal.icon.get_in("low-density-structure"),
        },
        energy_required = 25,
        technology = { "low-density-structure", "power-armor" },
        ingredients = {
            { "processing-unit",       40 },
            { "low-density-structure", 6 },
            { "electric-engine-unit",  15 },
        },
        results = {
            { "modular-armor", 1 },
        },
        category = "crafting",
    },
    {
        name = "low-density-structure-battery-equipment",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("battery-equipment"),
            vgal.icon.get_in("low-density-structure"),
        },
        energy_required = 12,
        technology = { "low-density-structure", "battery-equipment" },
        ingredients = {
            { "battery",               4 },
            { "low-density-structure", 1 },
        },
        results = {
            { "battery-equipment", 1 },
        },
        category = "crafting",
    },
}

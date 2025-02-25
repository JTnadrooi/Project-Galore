vgal.data.extend({
    {
        name = "tungsten-carbide-speed-module",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("speed-module"),
            vgal.icon.get_overlay("planet"),
        },
        energy_required = 15,
        technology = "speed-module-3",
        ingredients = {
            { "advanced-circuit",   3 },
            { "electronic-circuit", 3 },
            { "tungsten-carbide",   1 },
        },
        results = {
            { "speed-module", 1 },
        },
        category = "electronics",
    },
    {
        name = "biter-egg-productivity-module",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("productivity-module"),
            vgal.icon.get_overlay("planet"),
        },
        energy_required = 15,
        technology = "productivity-module-3",
        ingredients = {
            { "advanced-circuit",   3 },
            { "electronic-circuit", 3 },
            { "biter-egg",          1 },
        },
        results = {
            { "productivity-module", 1 },
        },
        category = "electronics",
    },
    {
        name = "spoilage-efficiency-module",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("efficiency-module"),
            vgal.icon.get_overlay("planet"),
        },
        energy_required = 15,
        technology = "efficiency-module-3",
        ingredients = {
            { "advanced-circuit",   3 },
            { "electronic-circuit", 3 },
            { "spoilage",           5 },
        },
        results = {
            { "efficiency-module", 1 },
        },
        category = "electronics",
    },
    {
        name = "superconductor-quality-module",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("quality-module"),
            vgal.icon.get_overlay("planet"),
        },
        energy_required = 15,
        technology = "quality-module-3",
        ingredients = {
            { "advanced-circuit",   3 },
            { "electronic-circuit", 3 },
            { "superconductor",     1 },
        },
        results = {
            { "quality-module", 1 },
        },
        category = "electronics",
    },
    -- TIER 2
    {
        name = "tungsten-carbide-speed-module-2",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("speed-module-2"),
            vgal.icon.get_overlay("planet"),
        },
        energy_required = 30,
        technology = "speed-module-3",
        ingredients = {
            { "advanced-circuit", 4 },
            { "processing-unit",  4 },
            { "tungsten-carbide", 1 },
            { "speed-module",     4 },
        },
        results = {
            { "speed-module-2", 1 },
        },
        category = "electronics",
    },
    {
        name = "biter-egg-productivity-module-2",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("productivity-module-2"),
            vgal.icon.get_overlay("planet"),
        },
        energy_required = 30,
        technology = "productivity-module-3",
        ingredients = {
            { "advanced-circuit",    4 },
            { "processing-unit",     4 },
            { "biter-egg",           1 },
            { "productivity-module", 4 },
        },
        results = {
            { "productivity-module-2", 1 },
        },
        category = "electronics",
    },
    {
        name = "spoilage-efficiency-module-2",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("efficiency-module-2"),
            vgal.icon.get_overlay("planet"),
        },
        energy_required = 30,
        technology = "efficiency-module-3",
        ingredients = {
            { "advanced-circuit",  4 },
            { "processing-unit",   4 },
            { "spoilage",          5 },
            { "efficiency-module", 4 },
        },
        results = {
            { "efficiency-module-2", 1 },
        },
        category = "electronics",
    },
    {
        name = "superconductor-quality-module-2",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("quality-module-2"),
            vgal.icon.get_overlay("planet"),
        },
        energy_required = 30,
        technology = "quality-module-3",
        ingredients = {
            { "advanced-circuit", 4 },
            { "processing-unit",  4 },
            { "superconductor",   1 },
            { "quality-module",   4 },
        },
        results = {
            { "quality-module-2", 1 },
        },
        category = "electronics",
    },
}, {
    groups = { "vgal-modules" }
})

vgal.extend({
    {
        name = "angels-liquid-molten-steel-low-density-structure",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("low-density-structure"),
            vgal.icon.get_in("angels-liquid-molten-steel"),
        }),
        energy_required = 12,
        technology = { "low-density-structure", "angels-metallurgy-2", },
        ingredients = {
            { "angels-solid-sand",          5 },
            { "plastic-bar",                5 },
            { "copper-plate",               20 },
            { "angels-liquid-molten-steel", 15 },
        },
        results = {
            { "low-density-structure", 1 },
        },
        category = "angels-casting",

        localised_description = { "vgal-internal.insert-casting-recipe-desc" },
        localised_name = { "", { "item-name.low-density-structure" }, " ", { "vgal-internal.casting-postfix" } },
    },
    {
        name = "angels-liquid-molten-steel-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("angels-liquid-molten-steel"),
        }),
        energy_required = 8,
        technology = { "angels-metallurgy-2", "engine" },
        ingredients = {
            { "angels-solid-sand",          2 },
            { "iron-gear-wheel",            1 },
            { "pipe",                       2 },
            { "angels-liquid-molten-steel", 10 },
        },
        results = {
            { "engine-unit", 1 },
        },
        category = "angels-casting",

        localised_description = { "vgal-internal.insert-casting-recipe-desc" },
        localised_name = { "", { "item-name.engine-unit" }, " ", { "vgal-internal.casting-postfix" } },
    },
    {
        name = "angels-solid-sodium-chlorate-angels-liquid-hydrochloric-acid-angels-solid-salt",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("angels-solid-salt"),
            vgal.icon.get_in("angels-solid-sodium-chlorate"),
            vgal.icon.get_in2("angels-liquid-hydrochloric-acid"),
        }),
        energy_required = 2,
        technology = "angels-chlorine-processing-4",
        ingredients = {
            { "angels-solid-sodium-chlorate",    2 },  -- 10 cl
            { "angels-liquid-hydrochloric-acid", 50 }, -- 50 cl, 50water
        },
        results = {
            { "angels-solid-salt",        1 },  -- 40 cl
            { "angels-water-green-waste", 50 }, -- 10 cl, 50water
        },
        category = "chemistry",
        order = "a[salt]-b[from-sodium-chlorate]-b",
        allow_productivity = false,
    },
}, {
    type = "recipe",
    groups = { "vgal-removed" },
})

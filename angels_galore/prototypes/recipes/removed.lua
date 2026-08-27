vgal.data.extend({
    {
        name = "angels-liquid-molten-steel-low-density-structure",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("low-density-structure"),
            vgal.icon.get_in("angels-liquid-molten-steel"),
        },
        energy_required = 12,
        technology = { "low-density-structure", "angels-metallurgy-2", },
        ingredients = {
            { "angels-solid-sand", 5 },
            { "plastic-bar",       5 },
            { "copper-plate",      20 },
        },
        fluid_ingredients = {
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
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("angels-liquid-molten-steel"),
        },
        energy_required = 8,
        technology = { "angels-metallurgy-2", "engine" },
        ingredients = {
            { "angels-solid-sand", 2 },
            { "iron-gear-wheel",   1 },
            { "pipe",              2 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-steel", 10 },
        },
        results = {
            { "engine-unit", 1 },
        },
        category = "angels-casting",

        localised_description = { "vgal-internal.insert-casting-recipe-desc" },
        localised_name = { "", { "item-name.engine-unit" }, " ", { "vgal-internal.casting-postfix" } },
    },
}, {
    type = "recipe",
    groups = { "vgal-removed" },
})

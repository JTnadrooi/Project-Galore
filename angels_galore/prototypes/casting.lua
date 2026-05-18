vgal.data.extend({
    -- simple intermediates
    {
        name = "angels-liquid-molten-iron-iron-gear-wheel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("iron-gear-wheel"),
            vgal.icon.get_in("angels-liquid-molten-iron"),
        },
        energy_required = 1,
        technology = "angels-metallurgy-2",
        ingredients = {
            { "angels-solid-sand", 1 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-iron", 75 },
        },
        results = {
            { "iron-gear-wheel", 4 },
        },
        category = "angels-casting",
    },
    {
        name = "angels-liquid-molten-iron-iron-stick",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("iron-stick"),
            vgal.icon.get_in("angels-liquid-molten-iron"),
        },
        energy_required = 1,
        technology = "angels-metallurgy-2",
        ingredients = {
            { "angels-solid-sand", 1 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-iron", 25 },
        },
        results = {
            { "iron-stick", 5 },
        },
        category = "angels-casting",
    },
    {
        name = "angels-liquid-molten-copper-copper-cable",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("copper-cable"),
            vgal.icon.get_in("angels-liquid-molten-copper"),
        },
        energy_required = 1,
        technology = "angels-metallurgy-2",
        ingredients = {
            { "angels-solid-sand", 1 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-copper", 25 },
        },
        results = {
            { "copper-cable", 5 },
        },
        category = "angels-casting",
    },

    -- recipe items
    {
        name = "angels-liquid-molten-iron-angels-catalyst-metal-carrier",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-catalyst-metal-carrier"),
            vgal.icon.get_in("angels-liquid-molten-iron"),
        },
        energy_required = 1,
        technology = { "angels-metallurgy-2", "angels-basic-chemistry-3" },
        ingredients = {
            { "angels-solid-sand", 5 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-iron", 50 },
        },
        results = {
            { "angels-catalyst-metal-carrier", 10 },
        },
        category = "angels-casting",
    },
    {
        name = "angels-liquid-molten-iron-angels-filter-frame",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-filter-frame"),
            vgal.icon.get_in("angels-liquid-molten-iron"),
        },
        energy_required = 1,
        technology = { "angels-metallurgy-2", "angels-slag-processing-1" },
        ingredients = {
            { "angels-solid-sand", 1 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-iron",  15 },
            { "angels-liquid-molten-steel", 20 },
        },
        results = {
            { "angels-filter-frame", 2 },
        },
        category = "angels-casting",
    },
    {
        name = "steel-plate-angels-solid-saw",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-saw"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 6,
        technology = "angels-bio-arboretum-1",
        ingredients = {
            { "steel-plate", 1 },
        },
        results = {
            { "angels-solid-saw", 5 },
        },
        category = "crafting",
        order = "aba",
    },
    {
        name = "angels-liquid-molten-iron-angels-solid-saw",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-saw"),
            vgal.icon.get_in("angels-liquid-molten-iron"),
        },
        energy_required = 1,
        technology = { "angels-metallurgy-2", "angels-bio-arboretum-1" },
        ingredients = {
            { "angels-solid-sand", 1 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-iron", 50 },
        },
        results = {
            { "angels-solid-saw", 5 },
        },
        order = "aab",
        category = "angels-casting",
    },
    {
        name = "angels-liquid-molten-steel-angels-solid-saw",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-saw"),
            vgal.icon.get_in("angels-liquid-molten-steel"),
        },
        energy_required = 2,
        technology = { "angels-metallurgy-2", "angels-bio-arboretum-1" },
        ingredients = {
            { "angels-solid-sand", 1 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-steel", 10 },
        },
        results = {
            { "angels-solid-saw", 5 },
        },
        order = "abb",
        category = "angels-casting",
    },
    {
        name = "angels-liquid-molten-steel-barrel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("barrel"),
            vgal.icon.get_in("angels-liquid-molten-steel"),
        },
        energy_required = 1,
        technology = { "angels-metallurgy-2", "fluid-handling" },
        ingredients = {
            { "angels-solid-sand", 1 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-steel", 20 },
        },
        results = {
            { "barrel", 2 },
        },
        category = "angels-casting",
    },

    -- complex intermediates
    {
        name = "angels-liquid-molten-steel-angels-liquid-molten-copper-low-density-structure",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("low-density-structure"),
            vgal.icon.get_in("angels-liquid-molten-steel"),
            vgal.icon.get_in2("angels-liquid-molten-copper"),
        },
        energy_required = 12,
        technology = { "low-density-structure", "angels-metallurgy-2", },
        ingredients = {
            { "angels-solid-sand", 10 },
            { "plastic-bar",       5 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-copper", 180 },
            { "angels-liquid-molten-steel",  25 },
        },
        results = {
            { "low-density-structure", 1 },
        },
        category = "angels-casting",
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

        localised_description = { "agal-internal.insert-casting-recipe-desc" },
    },

    -- placeables/buildings
    {
        name = "angels-liquid-molten-iron-burner-inserter",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("burner-inserter"),
            vgal.icon.get_in("angels-liquid-molten-iron"),
        },
        energy_required = 2,
        technology = "angels-metallurgy-2",
        ingredients = {
            { "angels-solid-sand", 1 },
            { "iron-gear-wheel",   5 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-iron", 45 },
        },
        results = {
            { "burner-inserter", 5 },
        },
        category = "angels-casting",

        localised_description = { "agal-internal.insert-casting-recipe-desc" },
    },
    {
        name = "angels-liquid-molten-steel-pipe",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("pipe"),
            vgal.icon.get_in("angels-liquid-molten-steel"),
        },
        energy_required = 2,
        technology = "angels-metallurgy-2",
        ingredients = {
            { "angels-solid-sand", 1 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-steel", 10 },
        },
        results = {
            { "pipe", 5 },
        },
        order = "a[pipe]-a[pipe]-bb",
        category = "angels-casting",
    },
    {
        name = "angels-liquid-molten-iron-pipe",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("pipe"),
            vgal.icon.get_in("angels-liquid-molten-iron"),
        },
        energy_required = 1,
        technology = "angels-metallurgy-2",
        ingredients = {
            { "angels-solid-sand", 1 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-iron", 50 },
        },
        results = {
            { "pipe", 5 },
        },
        order = "a[pipe]-a[pipe]-ab",
        category = "angels-casting",
    },
    {
        name = "angels-liquid-molten-steel-pipe-to-ground",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("pipe-to-ground"),
            vgal.icon.get_in("angels-liquid-molten-steel"),
        },
        energy_required = 1,
        technology = "angels-metallurgy-2",
        ingredients = {
            { "angels-solid-sand", 1 },
            { "pipe",              10 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-steel", 10 },
        },
        results = {
            { "pipe-to-ground", 2 },
        },
        order = "a[pipe]-b[pipe-to-ground]-bb",
        category = "angels-casting",

        localised_description = { "agal-internal.insert-casting-recipe-desc" },
    },
    {
        name = "angels-liquid-molten-iron-pipe-to-ground",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("pipe-to-ground"),
            vgal.icon.get_in("angels-liquid-molten-iron"),
        },
        energy_required = 0.5,
        technology = "angels-metallurgy-2",
        ingredients = {
            { "angels-solid-sand", 1 },
            { "pipe",              10 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-iron", 50 },
        },
        results = {
            { "pipe-to-ground", 2 },
        },
        order = "a[pipe]-b[pipe-to-ground]-ab",
        category = "angels-casting",

        localised_description = { "agal-internal.insert-casting-recipe-desc" },
    },
    {
        name = "angels-liquid-molten-steel-angels-liquid-molten-copper-heat-pipe",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("heat-pipe"),
            vgal.icon.get_in("angels-liquid-molten-steel"),
            vgal.icon.get_in2("angels-liquid-molten-copper"),
        },
        energy_required = 1,
        technology = { "angels-metallurgy-2", "nuclear-power" },
        ingredients = {
            { "angels-solid-sand", 5 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-steel",  75 },
            { "angels-liquid-molten-copper", 250 },
        },
        results = {
            { "heat-pipe", 1 },
        },
        category = "angels-casting",
    },
}, {
    type = "recipe",
})

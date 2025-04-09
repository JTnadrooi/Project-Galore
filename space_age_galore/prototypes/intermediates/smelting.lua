vgal.data.extend({
    {
        type = "recipe",
        name = "carbon-steel-plate",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("steel-plate"),
            vgal.icon.get_in("carbon"),
        },
        category = "metallurgy",
        energy_required = 6.4,
        technology = "foundry",
        ingredients = {
            { "iron-ore", 4 }, -- 40
            { "carbon",   1 }, -- 50
        },
        results = {
            { "steel-plate", 2 } -- 100
        },
        groups = { "vgal-unsure" },
    },
    {
        type = "recipe",
        name = "iron-ore-coal-molten-iron", -- future nadrooi, dont add a carbon recipe
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("molten-iron"),
            vgal.icon.get_in("coal"),
        },
        category = "metallurgy",
        energy_required = 32,
        technology = "foundry",
        ingredients = {
            { "iron-ore", 50 },
            { "coal",     25 }, -- calcite is 115 (when imported), this is 240
        },
        fluid_results = {
            { "molten-iron", 400 },
        },
        order = "bbab",
    },
    {
        type = "recipe",
        name = "copper-ore-coal-molten-copper",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("molten-copper"),
            vgal.icon.get_in("coal"),
        },
        category = "metallurgy",
        energy_required = 32,
        technology = "foundry",
        ingredients = {
            { "copper-ore", 50 },
            { "coal",       25 }, -- calcite is 115 (when imported), this is 240
        },
        fluid_results = {
            { "molten-copper", 400 },
        },
        order = "bbbb",
    },
    {
        type = "recipe",
        name = "ammonia-calcite-molten-iron",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("molten-iron"),
            vgal.icon.get_in("ammonia"),
        },
        category = "metallurgy",
        energy_required = 32,
        technology = "foundry",
        fluid_ingredients = {
            { "ammonia", 80 }, -- 160
        },
        ingredients = {
            { "iron-ore", 32 }, -- delta = 160
            { "calcite",  1 },
        },
        fluid_results = {
            { "molten-iron", 500 },
        },
        order = "bbac",
    },
    {
        type = "recipe",
        name = "sulfuric-acid-calcite-molten-copper",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("molten-copper"),
            vgal.icon.get_in("sulfuric-acid"),
        },
        category = "metallurgy",
        energy_required = 32,
        technology = "foundry",
        fluid_ingredients = {
            { "sulfuric-acid", 80 }, -- 120
        },
        ingredients = {
            { "copper-ore", 32 }, -- delta = 160
            { "calcite",    1 },
        },
        fluid_results = {
            { "molten-copper", 500 },
        },
        order = "bbbc",
    },
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
            { "rail", 6 }, -- 165molten iron
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
    },
    {
        name = "molten-copper-carbon-fiber-low-density-structure",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("low-density-structure"),
            vgal.icon.get_in("carbon-fiber"),
            vgal.icon.get_overlay("casting-copper"),
        },
        category = "metallurgy",
        energy_required = 15,
        technology = { "carbon-fiber", "foundry" },
        fluid_ingredients = {
            { "molten-copper", 40 },
        },
        ingredients = {
            { "carbon-fiber", 2 }, -- 240
            { "plastic-bar",  6 }, -- 120
        },
        results = {
            { "low-density-structure", 1 },
        },
        subgroup = "vulcanus-processes",
        order = "b-f-a",
        localised_name_source = "casting-low-density-structure",
        localised_description_source = "vgal-carbon-fiber-low-density-structure",
    },
}, {
    type = "recipe",
})

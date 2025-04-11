vgal.data.extend({
    {
        type = "recipe",
        name = "carbon-lubricant",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("lubricant"),
            vgal.icon.get_in_fluid("carbon"),
        },
        category = "chemistry",
        energy_required = 1,
        technology = "space-platform",
        fluid_ingredients = {
            { "water", 30 },
        },
        ingredients = {
            { "carbon", 3 }, -- 100
        },
        fluid_results = {
            { "lubricant", 20 }, -- 60
        },
    },
    {
        name = "calcite-carbon-stone-brick", -- vu
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stone-brick"),
            vgal.icon.get_in("calcite"),
        },
        energy_required = 16,
        technology = "calcite-processing",
        ingredients = {
            { "carbon",  1 }, -- 30
            { "calcite", 2 }, -- 20
            { "stone",   2 }, -- 20
        },
        results = {
            { "stone-brick", 5 }, -- 100 * 1.5 = 150 (Alright I know this recipe is very efficient but.. on vulcanus stone is a byproduct - to some degree - so I think this is ok?)
        },
        category = "metallurgy",
    },
    {
        type = "recipe",
        name = "solid-fuel-carbon",
        prefix = "vgal",
        -- icons = vgal.icon.register {
        --     vgal.icon.get("carbon"),
        --     vgal.icon.get_in("solid-fuel"),
        --     vgal.icon.get_in2("steam"),
        -- },
        icons = vgal.icon.register {
            vgal.icon.get_in_to("solid-fuel"),
            vgal.icon.get_out_to("carbon"),
            vgal.icon.get_overlay("to"),
        },
        category = "chemistry-or-cryogenics",
        energy_required = 8,
        technology = "space-platform",
        fluid_ingredients = {
            { "steam", 20 },
        },
        ingredients = {
            { "solid-fuel", 5 }, -- 30
        },
        results = {
            { "carbon", 1 }, -- 50
        },
        show_amount_in_title = false,
    },
    {
        name = "tungsten-plate-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 8,
        technology = "tungsten-steel",
        ingredients = {
            { "tungsten-plate",  1 }, -- 60
            { "iron-gear-wheel", 1 }, -- 20
            { "pipe",            1 }, -- 10
        },
        results = {
            { "engine-unit", 1 }, -- 90
        },
        category = "advanced-crafting",
    },
    {
        name = "molten-iron-molten-copper-uranium-238-low-density-structure",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("casting-low-density-structure", "recipe"),
            vgal.icon.get_in("uranium-238"),
        },
        energy_required = 15,
        technology = { "foundry", "uranium-processing" },
        fluid_ingredients = {
            { "molten-copper", 150 },
            { "molten-iron",   80 },
        },
        ingredients = {
            { "uranium-238", 1 },
        },
        results = {
            { "low-density-structure", 1 },
        },
        category = "metallurgy",
        subgroup = "vulcanus-processes",
        order = "b-f-a",
        localised_name_source = "casting-low-density-structure",
        localised_description_source = "vgal-uranium-238-low-density-structure",
    },
    {
        name = "tungsten-plate-barrel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("barrel"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 2,
        technology = "tungsten-steel",
        ingredients = {
            { "tungsten-plate", 1 }, -- 60
            { "iron-plate",     2 }, -- 20
        },
        results = {
            { "barrel", 2 }, -- 100
        },
        category = "crafting",
        groups = { "vgal-barrels" },
    },
}, {
    type = "recipe",
    groups = { "vgal-removed" },
})

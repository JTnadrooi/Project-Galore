vgal.data.extend
{
    {
        type = "recipe",
        name = "holmium-solution-copper-cable",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("copper-cable"),
            vgal.icon.get_in("holmium-solution", "fluid"),
        },
        category = "electromagnetics",
        energy_required = 6,
        technology = "holmium-processing",
        fluid_ingredients = {
            { "holmium-solution", 5 }, -- 42.5
        },
        ingredients = {
            { "copper-plate", 10 }, -- 100
        },
        results = {
            { "copper-cable", 30 }, -- 150
        },
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
            { "tungsten-plate", 1 }, -- 80
            { "iron-plate",     2 }, -- 20
        },
        results = {
            { "barrel", 2 }, -- 100
        },
        category = "crafting",
        groups = { "vgal-barrels" },
    },
    {
        name = "tungsten-plate-engine-unit",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("engine-unit"),
            vgal.icon.get_in("tungsten-plate"),
        },
        energy_required = 5,
        technology = "tungsten-steel",
        ingredients = {
            { "tungsten-plate",  1 }, -- 90
            { "iron-gear-wheel", 2 }, -- 20
            { "iron-plate",      2 }, -- 20
        },
        results = {
            { "engine-unit", 2 }, -- 180
        },
        category = "advanced-crafting",
    },
    {
        name = "calcite-carbon-stone-brick", -- vu
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stone-brick"),
            vgal.icon.get_in("calcite"),
        },
        energy_required = 5,
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
        name = "calcite-carbon-concrete", -- vu
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("concrete"),
            vgal.icon.get_in("calcite"),
        },
        energy_required = 10,
        technology = "calcite-processing",
        fluid_ingredients = {
            { "water", 100 },
        },
        ingredients = {
            { "carbon",      1 }, -- 30
            { "calcite",     2 }, -- 20
            { "stone-brick", 2 }, -- 40
        },
        results = {
            { "concrete", 10 }, -- ~100 * 1.5 = 150
        },
        category = "crafting-with-fluid",
    },
}

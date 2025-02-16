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
        name = "jelly-light-oil-solid-fuel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("solid-fuel"),
            vgal.icon.get_in("light-oil"),
            vgal.icon.get_in2("jelly"),
        },
        energy_required = 6,
        technology = "jellynut",
        fluid_ingredients = {
            { "light-oil", 5 }, -- 8
        },
        ingredients = {
            { "jelly", 15 }, -- 90
        },
        results = {
            { "solid-fuel", 4 }, -- 80 * 1.5 = 120
        },
        category = "organic",
    },
    {
        name = "jelly-crude-oil-solid-fuel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("solid-fuel"),
            vgal.icon.get_in("crude-oil"),
            vgal.icon.get_in2("jelly"),
        },
        energy_required = 6,
        technology = "jellynut",
        fluid_ingredients = {
            { "crude-oil", 10 }, -- 2
        },
        ingredients = {
            { "jelly", 12 }, -- 72
        },
        results = {
            { "solid-fuel", 4 }, -- 80 * 1.5 = 120
        },
        category = "organic",
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
    {
        type = "recipe",
        name = "ammonia-explosives", -- lets goo, less coal usage on gleba!
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("explosives"),
            vgal.icon.get_in("ammonia"),
        },
        category = "chemistry",
        energy_required = 10,
        technology = "captivity",
        fluid_ingredients = {
            { "ammonia", 10 } -- 20
        },
        ingredients = {
            { "coal",   1 }, -- 10 (but 210 on gleba)
            { "sulfur", 2 }, -- 30
        },
        results = {
            { "explosives", 4 }, -- 60
        },
    },
    {
        type = "recipe",
        name = "water-coal-ammonia",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("ammonia"),
        },
        category = "chemistry",
        energy_required = 1,
        technology = "oil-processing",
        fluid_ingredients = {
            { "water", 10 }
        },
        ingredients = {
            { "coal", 2 }, -- 20
        },
        fluid_results = {
            { "ammonia", 10 } -- 20
        },
    },
}

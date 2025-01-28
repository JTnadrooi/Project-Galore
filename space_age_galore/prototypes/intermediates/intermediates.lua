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
        category = "pressing",
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
        category = "pressing",
    },
    -- {
    --     name = "scrap-crushing",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("scrap"),
    --         vgal.icon.get_overlay("crushing"),
    --     },
    --     energy_required = 0.2,
    --     technology = "recycling",
    --     ingredients = {
    --         { "scrap", 1 },
    --     },
    --     results = {
    --         { "iron-ore",    1, { probability = 0.20, show_details_in_recipe_tooltip = false } },
    --         { "copper-ore",  1, { probability = 0.20, show_details_in_recipe_tooltip = false } },
    --         { "coal",        1, { probability = 0.10, show_details_in_recipe_tooltip = false } },
    --         { "stone",       1, { probability = 0.10, show_details_in_recipe_tooltip = false } },
    --         { "holmium-ore", 1, { probability = 0.01, show_details_in_recipe_tooltip = false } },
    --     },
    --     category = "crushing",
    --     subgroup = "vgal-crushing"
    -- },
    {
        name = "stone-crushing",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stone"),
            vgal.icon.get_overlay("crushing"),
        },
        energy_required = 0.8,
        technology = "calcite-processing",
        ingredients = {
            { "stone", 5 },
        },
        results = {
            { "stone",   1, { probability = 0.10, show_details_in_recipe_tooltip = false } },
            { "calcite", 1, { probability = 0.12, show_details_in_recipe_tooltip = false } }, -- 42 stone = 1 calcite,
        },
        category = "crushing",
        subgroup = "vgal-crushing"
    },
    {
        name = "coal-crushing",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("coal"),
            vgal.icon.get_overlay("crushing"),
        },
        energy_required = 0.8,
        technology = "space-platform",
        ingredients = {
            { "coal", 5 },
        },
        results = {
            { "coal",   1, { probability = 0.10, show_details_in_recipe_tooltip = false } },
            { "carbon", 1, { probability = 0.25, show_details_in_recipe_tooltip = false } },
            { "sulfur", 1, { probability = 0.5, show_details_in_recipe_tooltip = false } },
        },
        category = "crushing",
        subgroup = "vgal-crushing"
    },
}

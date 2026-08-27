vgal.data.extend({
    {
        name = "angels-solid-sodium-hypochlorite-angels-water-purified",
        prefix = "vgal",
        icons = angelsmods.functions.create_liquid_recipe_icon({
            "angels-water-saline",
            "angels-water-purified",
        }, "WsWsWs", { "angels-solid-sodium-hypochlorite" }),
        energy_required = 5,
        technology = { "angels-chlorine-processing-4", "angels-nitrogen-processing-3", },
        ingredients = {
            { "angels-solid-sodium-hypochlorite", 1 },
            { "angels-solid-carbon",              1 },
        },
        fluid_ingredients = {
            { "water", 5000 },
        },
        results = {
            { "angels-solid-sodium-chlorate", 1 },
        },
        fluid_results = {
            { "angels-water-purified", 4800 },
            { "angels-water-saline",   150 },
        },
        main_product = "angels-water-purified",
        allow_productivity = false,
        category = "angels-water-treatment",
    },
    {
        name = "angels-water-mineralized-angels-water-purified",
        prefix = "vgal",
        icons = angelsmods.functions.create_liquid_recipe_icon({
            "angels-water-saline",
            "angels-water-purified",
            "angels-stone-crushed",
        }, "WsWsWs", { "angels-water-mineralized" }),
        energy_required = 1,
        technology = { "angels-water-treatment", "angels-stone-smelting-1" },
        ingredients = {
            { "angels-solid-lime", 1 },
        },
        fluid_ingredients = {
            { "angels-water-mineralized", 100 },
        },
        -- results = {
        --     { "angels-stone-crushed", 2 },
        -- },
        fluid_results = {
            -- { "water",                 70 },
            { "angels-water-purified", 70 },
            { "angels-water-saline",   20 },
        },
        -- main_product = "water",
        allow_productivity = false,
        category = "angels-water-treatment",
        subgroup = "angels-water-cleaning",
        order = "x[mineralized]"
    },
    {
        name = "angels-water-saline-angels-solid-salt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-salt"),
            vgal.icon.get_in("angels-water-saline"),
        },
        energy_required = 1,
        technology = "angels-water-treatment-3",
        fluid_ingredients = {
            { "angels-water-saline", 150 },
        },
        results = {
            { "angels-solid-salt", 1 },
        },
        -- fluid_results = {
        --     { "angels-water-purified", 100 },
        -- },
        -- main_product = "angels-water-purified",
        allow_productivity = false,
        category = "angels-salination-plant",

        order = "a[salt]-a[from-water]-b",
        subgroup = "angels-water-salination",
    },
    {
        name = "angels-water-purified-water",
        prefix = "vgal",
        icons = angelsmods.functions.create_viscous_liquid_filtering_recipe_icon(
            "coal",
            { { 116, 140, 211 }, { 039, 112, 194, 0.6 } }
        ),
        energy_required = 1,
        technology = "angels-slag-processing-1",
        ingredients = {
            { "angels-filter-coal", 1 },
        },
        fluid_ingredients = {
            { "angels-water-purified", 150 },
        },
        results = {
            { "angels-filter-frame", 1 },
        },
        fluid_results = {
            { "water", 100 },
        },
        main_product = "water",
        allow_productivity = false,
        category = "angels-filtering",

        groups = { "vgal-unsure" }
    },
}, {
    type = "recipe",
})

for _, waste_water in pairs(vgal.defines.waste_waters) do
    vgal.data.extend({
        {
            name = "angels-solid-calcium-chloride-" .. waste_water.name .. "-angels-water-purified",
            prefix = "vgal",
            icons = angelsmods.functions.create_liquid_recipe_icon({
                waste_water.secondary_result_water,
                "angels-water-purified",
                waste_water.result,
            }, waste_water.purification_recipe_palette, { "angels-solid-calcium-chloride" }),
            energy_required = 2,
            technology = "angels-chlorine-processing-2",
            ingredients = {
                { "angels-solid-calcium-chloride", 1 },
            },
            fluid_ingredients = {
                { waste_water.name, 500 },
            },
            results = {
                { waste_water.result, 5 },
            },
            fluid_results = {
                { "angels-water-purified",            350 },
                { waste_water.secondary_result_water, 80 },
            },
            -- fluid_ingredients = {
            --     { waste_water.name, 400 },
            -- },
            -- results = {
            --     { waste_water.result, 4 },
            -- },
            -- fluid_results = {
            --     { "angels-water-purified",            275 },
            --     { waste_water.secondary_result_water, 80 },
            -- },
            main_product = "angels-water-purified",
            allow_productivity = false,
            category = "angels-water-treatment",

            subgroup = "angels-water-cleaning",
            order = vgal.subgroup.order_from_number(waste_water.index) .. "[" .. waste_water.color .. "]" .. "-b"
        },
    }, {
        type = "recipe",
    })
end

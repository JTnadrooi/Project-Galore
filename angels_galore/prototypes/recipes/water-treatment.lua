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
}, {
    type = "recipe",
})

for _, waste_water in pairs(vgal.defines.waste_waters) do
    vgal.data.extend({
        {
            name = "angels-solid-calcium-chloride-" .. waste_water.name .. "-angels-water-purifed",
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

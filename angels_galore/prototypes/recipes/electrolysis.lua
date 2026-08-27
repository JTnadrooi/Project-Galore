vgal.data.extend({
    {
        name = "angels-water-mineralized-angels-gas-oxygen-angels-gas-hydrogen",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon(
            {
                { "__angelspetrochemgraphics__/graphics/icons/molecules/oxygen.png",   72 },
                { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrogen.png", 72 },
            },
            "OHH",
            {
                angelsmods.functions.add_number_icon_layer({}, 1, angelsmods.petrochem.number_tint),
                "angels-water-mineralized",
            }
        ),
        energy_required = 4,
        technology = "angels-water-treatment",
        fluid_ingredients = {
            { "angels-water-mineralized", 100 },
        },
        results = {
            { "angels-slag", 2 },
        },
        fluid_results = {
            { "angels-gas-oxygen",   30 },
            { "angels-gas-hydrogen", 40 },
        },
        category = "angels-petrochem-electrolyser",

        main_product = "angels-slag",
        allow_productivity = false,

        order = "a[water-separation]-ab[mineralized-water]-a",
        subgroup = "angels-petrochem-basics",
    },
    {
        name = "angels-water-mineralized-angels-gas-oxygen-angels-gas-hydrogen-fast",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon(
            {
                { "__angelspetrochemgraphics__/graphics/icons/molecules/oxygen.png",   72 },
                { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrogen.png", 72 },
            },
            "OHH",
            {
                angelsmods.functions.add_number_icon_layer({}, 2, angelsmods.petrochem.number_tint),
                "angels-water-mineralized",
            }
        ),
        energy_required = 2,
        technology = "angels-water-treatment",
        ingredients = {
            { "angels-electrode", 1 },
        },
        fluid_ingredients = {
            { "angels-water-mineralized", 100 },
        },
        results = {
            { "angels-slag",           2 },
            { "angels-electrode-used", 1 },
        },
        fluid_results = {
            { "angels-gas-oxygen",   30 },
            { "angels-gas-hydrogen", 40 },
        },
        category = "angels-petrochem-electrolyser",

        main_product = "angels-slag",
        allow_productivity = false,

        order = "a[water-separation]-ab[mineralized-water]-b",
        subgroup = "angels-petrochem-basics",
    },
    {
        name = "angels-gas-carbon-dioxide-angels-gas-carbon-monoxide",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon(
            {
                { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-monoxide.png", 64 },
            },
            "CCOc",
            {
                { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-dioxide.png", 64 },
            }
        ),
        energy_required = 3,
        technology = "angels-basic-chemistry-3",
        ingredients = {
            { "angels-electrode", 1 },
        },
        fluid_ingredients = {
            { "angels-gas-carbon-dioxide", 50 }, -- 40 oxygen
        },
        results = {
            { "angels-electrode-used", 1 }
        },
        fluid_results = {
            { "angels-gas-carbon-monoxide", 50 }, -- 20 oxygen
            { "angels-gas-oxygen",          20 },
        },
        category = "angels-petrochem-electrolyser",

        main_product = "angels-gas-carbon-monoxide",
        allow_productivity = false,
    },
}, {
    type = "recipe",
})

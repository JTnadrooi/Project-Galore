vgal.data.extend({
    {
        name = "angels-solid-sodium-chlorate-angels-solid-salt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-salt"),
            vgal.icon.get_in("angels-solid-sodium-chlorate"),
        },
        energy_required = 8,
        technology = "angels-chlorine-processing-4",
        ingredients = {
            { "angels-solid-sodium-chlorate", 8 }, -- 40cl, 32ox
        },
        results = {
            { "angels-solid-salt", 1 }, -- 40cl
        },
        fluid_results = {
            { "angels-gas-oxygen", 30 },
        },
        category = "angels-liquifying",

        allow_productivity = false,
        show_amount_in_title = false,
    },
    {
        name = "angels-solid-sodium-chlorate-angels-liquid-hydrochloric-acid-angels-solid-salt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-salt"),
            vgal.icon.get_in("angels-solid-sodium-chlorate"),
            vgal.icon.get_in2("hydrochloric-acid", "molecule"),
        },
        energy_required = 2,
        technology = "angels-chlorine-processing-4",
        ingredients = {
            { "angels-solid-sodium-chlorate", 2 }, -- 10 cl
        },
        fluid_ingredients = {
            { "angels-liquid-hydrochloric-acid", 50 }, -- 50 cl, 50water
        },
        results = {
            { "angels-solid-salt", 1 }, -- 40 cl
        },
        fluid_results = {
            { "angels-water-green-waste", 50 }, -- 10 cl, 50water
        },
        category = "chemistry",

        order = "ab",
        allow_productivity = false,
        show_amount_in_title = false,
    },
    {
        -- angels mirror, buffed, see the override (didnt wanna make the recipe weird)
        -- uses (alien bacteria) item usage has been compensated
        name = "angels-red-cellulose-fiber-angels-solid-calcium-carbonate",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-calcium-carbonate"),
            vgal.icon.get_in("angels-red-cellulose-fiber"),
        },
        energy_required = 10, -- 30
        technology = "angels-bio-processing-red",
        ingredients = {
            { "angels-red-cellulose-fiber", 6 }, -- 20
        },
        results = {
            { "angels-solid-calcium-carbonate", 5 },
        },
        category = "angels-liquifying",
    },
    {
        name = "angels-gas-ethanol-angels-liquid-acetic-acid",
        prefix = "vgal",
        icons = angelsmods.functions.create_liquid_recipe_icon({
            { "__angelsbioprocessinggraphics__/graphics/icons/molecule-acetic-acid.png", 72 },
        }, "COH", {
            -- { "__angelspetrochemgraphics__/graphics/icons/molecules/ethanol.png", 64 },
        }),
        energy_required = 2,
        technology = "angels-bio-fermentation",
        fluid_ingredients = {
            { "angels-gas-ethanol", 50 },
            { "angels-gas-oxygen",  20 },
        },
        fluid_results = {
            { "angels-liquid-acetic-acid", 50 },
            { "angels-water-purified",     20 },
        },
        category = "chemistry",

        allow_productivity = false,
        show_amount_in_title = false,
    },
    {
        name = "angels-liquid-acetic-acid-angels-gas-acetone",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon({
            { "__angelspetrochemgraphics__/graphics/icons/molecules/acetone.png", 72 },
        }, "COH", {
            "angels-solid-lime"
        }),
        energy_required = 2,
        technology = "angels-bio-plastic-1",
        fluid_ingredients = {
            { "angels-liquid-acetic-acid", 50 },
        },
        ingredients = {
            { "angels-solid-lime", 1 },
        },
        fluid_results = {
            { "angels-gas-acetone", 60 },
        },
        results = {
            { "angels-solid-calcium-carbonate", 1, { independent_probability = 0.5 } },
        },
        category = "chemistry",

        allow_productivity = false,
        show_amount_in_title = false,
        main_product = "angels-gas-acetone"
    },
    {
        name = "angels-gas-ethylene-angels-gas-butane",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon({
            { "__angelspetrochemgraphics__/graphics/icons/molecules/butane.png", 72 },
        }, "CHH", {
            { "__angelspetrochemgraphics__/graphics/icons/molecules/ethylene.png", 72 },
            { "__angelspetrochemgraphics__/graphics/icons/molecules/hydrogen.png", 72 },
        }),
        energy_required = 2,
        technology = "angels-gas-processing",
        fluid_ingredients = {
            { "angels-gas-ethylene", 50 },
            { "angels-gas-hydrogen", 10 },
        },
        ingredients = {
            { "angels-catalyst-metal-blue", 1 },
        },
        fluid_results = {
            { "angels-gas-butane", 30 },
        },
        results = {
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "chemistry",

        allow_productivity = false,
        show_amount_in_title = false,
        main_product = "angels-gas-butane"
    },
    {
        name = "angels-gas-acetone-angels-gas-propene",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon({
            { "__angelspetrochemgraphics__/graphics/icons/molecules/propene.png", 72 },
        }, "CHH", {
            { "__angelspetrochemgraphics__/graphics/icons/molecules/acetone.png", 72 },
        }),
        energy_required = 2,
        technologies = { "angels-bio-nutrient-paste", "angels-advanced-chemistry-3" },
        fluid_ingredients = {
            { "angels-gas-acetone",  50 },
            { "angels-gas-hydrogen", 10 },
        },
        ingredients = {
            { "angels-catalyst-metal-yellow", 1 },
        },
        fluid_results = {
            { "angels-gas-propene",    30 },
            { "angels-water-purified", 15 },
        },
        results = {
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "chemistry",

        allow_productivity = false,
        show_amount_in_title = false,
        main_product = "angels-gas-propene",
        -- subgroup = "vgal-CH-gas-from-O",
        -- order = "b[O]-a"
    },
    {
        name = "angels-gas-acetone-angels-gas-propene-angels-gas-ethylene",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon({
            { "__angelspetrochemgraphics__/graphics/icons/molecules/propene.png",  72 },
            { "__angelspetrochemgraphics__/graphics/icons/molecules/ethylene.png", 72 },
        }, "CHH", {
            { "__angelspetrochemgraphics__/graphics/icons/molecules/acetone.png", 72 },
            -- { "__angelspetrochemgraphics__/graphics/icons/molecules/ethanol.png", 64 },
        }),
        energy_required = 2,
        technologies = { "angels-bio-nutrient-paste", "angels-advanced-chemistry-3" },
        fluid_ingredients = {
            { "angels-gas-acetone", 50 },
            { "angels-gas-ethanol", 50 },
        },
        ingredients = {
            { "angels-catalyst-metal-yellow", 1 },
        },
        fluid_results = {
            { "angels-gas-propene",    50 },
            { "angels-gas-ethylene",   30 },
            { "angels-water-purified", 25 },
        },
        results = {
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "angels-advanced-chemistry",

        allow_productivity = false,
        show_amount_in_title = false,
        main_product = "angels-gas-propene",
        -- subgroup = "vgal-CH-gas-from-O",
        -- order = "b[O]-b"
    },
    {
        name = "angels-liquid-naphtha-angels-gas-propene-angels-gas-ethylene",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon({
            { "__angelspetrochemgraphics__/graphics/icons/molecules/propene.png",  72 },
            { "__angelspetrochemgraphics__/graphics/icons/molecules/ethylene.png", 72 },
        }, "CHH", {
            "steam",
        }),
        energy_required = 4,
        technology = "angels-steam-cracking-1",
        fluid_ingredients = {
            { "angels-liquid-naphtha", 100 },
            { "steam",                 100 },
        },
        ingredients = {
            { "angels-catalyst-metal-blue", 1 },
        },
        fluid_results = {
            { "angels-gas-ethylene", 40 },
            { "angels-gas-propene",  50 },
        },
        results = {
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "angels-steam-cracking",

        allow_productivity = false,
        show_amount_in_title = false,
        main_product = "angels-gas-ethylene",
        subgroup = "vgal-CH-gas-from-O",
        order = "a[steam-cracking]-ab"
    -- { -- commentedbc: syngas
    --     name = "angels-liquid-vegetable-oil-angels-gas-propene-angels-gas-ethylene",
    --     prefix = "vgal",
    --     icons = angelsmods.functions.create_liquid_recipe_icon({
    --         { "__angelspetrochemgraphics__/graphics/icons/molecules/propene.png",  72 },
    --         "water",
    --         { "__angelspetrochemgraphics__/graphics/icons/molecules/ethylene.png", 72 },
    --     }, { { 255, 255, 056 }, { 255, 205, 040 }, { 201, 155, 030 } }),
    --     energy_required = 4,
    --     technology = "angels-bio-pressing-1",
    --     fluid_ingredients = {
    --         { "angels-liquid-vegetable-oil", 100 },
    --     },
    --     fluid_results = {
    --         { "angels-gas-propene",     50 },
    --         { "angels-gas-ethylene",    10 },
    --         { "angels-liquid-fuel-oil", 20 },
    --     },
    --     category = "oil-processing",

    --     subgroup = "angels-bio-processor-press-vegetables",
    --     order = "b[oil-processing]-c",
    -- }
    -- {
    --     name = "angels-liquid-nutrient-pulp-angels-liquid-propionic-acid",
    --     prefix = "vgal",
    --     icons = angelsmods.functions.create_liquid_recipe_icon({
    --         { "__angelsbioprocessinggraphics__/graphics/icons/molecule-propionic-acid.png", 72 },
    --         { "__angelsbioprocessinggraphics__/graphics/icons/molecule-acetic-acid.png",    72 },
    --         { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-dioxide.png",    72 },
    --     }, { { 214, 146, 040 }, { 169, 130, 039 }, { 120, 083, 004 } }),
    --     energy_required = 2,
    --     technology = "angels-bio-plastic-2",
    --     fluid_ingredients = {
    --         { "angels-liquid-nutrient-pulp", 100 },
    --     },
    --     fluid_results = {
    --         { "angels-liquid-propionic-acid", 40 },
    --         { "angels-liquid-acetic-acid",    15 },
    --         { "angels-gas-carbon-dioxide",    15 },
    --     },
    --     category = "angels-gas-refining",

    --     allow_productivity = false,
    --     show_amount_in_title = false,

    --     subgroup = "vgal-bio-nutrient-chemistry",
    --     order = "d",
    -- },
    {
        name = "angels-liquid-nutrient-pulp-angels-liquid-glycerol-angels-liquid-propionic-acid",
        prefix = "vgal",
        icons = angelsmods.functions.create_liquid_recipe_icon({
            { "__angelsbioprocessinggraphics__/graphics/icons/molecule-propionic-acid.png", 72 },
            { "__angelspetrochemgraphics__/graphics/icons/molecules/propene.png",           72 },
        }, { { 214, 146, 040 }, { 169, 130, 039 }, { 120, 083, 004 } }),
        energy_required = 2,
        technology = { "angels-bio-plastic-2", "angels-explosives-2", "angels-advanced-gas-processing" },
        fluid_ingredients = {
            { "angels-liquid-nutrient-pulp", 100 },
            { "angels-liquid-glycerol",      15 },
        },
        fluid_results = {
            { "angels-liquid-propionic-acid", 45 },
            { "angels-gas-propene",           30 },
        },
        category = "angels-advanced-gas-refining",

        allow_productivity = false,
        show_amount_in_title = false,

        subgroup = "vgal-bio-nutrient-chemistry",
        order = "e",
    },
}, {
    type = "recipe",
})

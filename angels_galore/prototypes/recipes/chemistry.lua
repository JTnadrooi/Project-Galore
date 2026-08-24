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
    },
    {
        name = "angels-solid-calcium-carbonate-angels-liquid-hydrochloric-acid-angels-solid-calcium-chloride",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-calcium-chloride"),
            vgal.icon.get_in("angels-solid-calcium-carbonate"),
        },
        energy_required = 2,
        technology = "angels-chlorine-processing-3",
        ingredients = {
            { "angels-solid-calcium-carbonate", 4 },
        },
        fluid_ingredients = {
            { "angels-liquid-hydrochloric-acid", 20 },
        },
        results = {
            { "angels-solid-calcium-chloride", 4 },
        },
        fluid_results = {
            { "angels-gas-carbon-dioxide", 50 },
            -- { "angels-water-purified",     20 },
        },
        category = "chemistry",
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
        name = "angels-gas-methanol-angels-gas-chlor-methane",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon({
            { "__angelspetrochemgraphics__/graphics/icons/molecules/chloromethane.png", 72 },
        }, "CClH", {
            { "__angelspetrochemgraphics__/graphics/icons/molecules/methanol.png", 72 },
        }),
        energy_required = 2,
        technology = "angels-chlorine-processing-2",
        fluid_ingredients = {
            { "angels-gas-methanol",             40 },
            { "angels-liquid-hydrochloric-acid", 60 },
        },
        fluid_results = {
            { "angels-gas-chlor-methane", 100 },
            { "angels-water-purified",    50 },
        },
        category = "chemistry",

        allow_productivity = false,
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
        technology = "angels-steam-cracking-1",
        fluid_ingredients = {
            { "angels-gas-ethylene", 50 },
            { "angels-gas-hydrogen", 20 },
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
            { "angels-gas-hydrogen", 20 },
        },
        ingredients = {
            { "angels-catalyst-metal-yellow", 1 },
        },
        fluid_results = {
            { "angels-gas-propene",    30 },
            { "angels-water-purified", 20 },
        },
        results = {
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "chemistry",

        allow_productivity = false,
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
            { "angels-water-purified", 20 },
        },
        results = {
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "angels-advanced-chemistry",

        allow_productivity = false,
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
        main_product = "angels-gas-ethylene",
        subgroup = "vgal-CH-gas-from-O",
        order = "a[steam-cracking]-ab"
    },
    {
        name = "angels-liquid-toluene-angels-gas-benzene",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon({
            { "__angelspetrochemgraphics__/graphics/icons/molecules/benzene.png", 72 },
        }, "CHH", {
            "angels-liquid-toluene",
        }),
        energy_required = 2,
        technology = "angels-advanced-chemistry-3",
        fluid_ingredients = {
            { "angels-liquid-toluene", 100 },
            { "angels-gas-hydrogen",   50 },
        },
        ingredients = {
            { "angels-catalyst-metal-yellow", 1 },
        },
        fluid_results = {
            { "angels-gas-benzene", 100 },
        },
        results = {
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "chemistry",

        allow_productivity = false,
        main_product = "angels-gas-benzene"
    },
    -- {
    --     name = "angels-liquid-toluene-angels-gas-benzene-angels-gas-methane",
    --     prefix = "vgal",
    --     icons = angelsmods.functions.create_gas_recipe_icon({
    --         { "__angelspetrochemgraphics__/graphics/icons/molecules/benzene.png", 72 },
    --         { "__angelspetrochemgraphics__/graphics/icons/molecules/methane.png", 72 },
    --     }, "CHH", {
    --         "angels-liquid-toluene",
    --     }),
    --     energy_required = 4,
    --     technology = "angels-advanced-chemistry-3",
    --     fluid_ingredients = {
    --         { "angels-liquid-toluene", 100 },
    --         { "angels-gas-hydrogen",   50 },
    --     },
    --     fluid_results = {
    --         { "angels-gas-benzene", 50 },
    --         { "angels-gas-methane", 20 },
    --     },
    --     category = "chemistry",

    --     allow_productivity = false,
    --     show_amount_in_title = false,
    --     main_product = "angels-gas-benzene",
    --     groups = { "vgal-unsure" }
    -- },
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

        subgroup = "vgal-bio-nutrient-chemistry",
        order = "e",
    },

    {
        name = "angels-solid-ammonium-nitrate-angels-liquid-fuel-oil-explosives",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("explosives"),
            vgal.icon.get_in("angels-solid-ammonium-nitrate"),
        },
        energy_required = 8,
        technology = "angels-explosives-2",
        ingredients = {
            { "angels-solid-ammonium-nitrate", 1 }, -- 50
        },
        fluid_ingredients = {
            { "angels-liquid-fuel-oil", 20 }, -- 16
        },
        results = {
            { "explosives", 4 }, -- 60
        },
        category = "chemistry",
    },

    {
        name = "angels-solid-coke-angels-gas-carbon-dioxide",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon(
            {
                { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-dioxide.png", 64 },
            },
            "COcOc", { "angels-solid-coke" }
        ),
        energy_required = 2,
        technology = "angels-coal-processing",
        ingredients = {
            { "angels-solid-coke", 2 },
        },
        fluid_results = {
            { "angels-gas-carbon-dioxide", 75 },
        },
        category = "angels-liquifying",
    },
    {
        name = "angels-gas-carbon-dioxide-angels-solid-carbon-angels-gas-carbon-monoxide",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon(
            {
                { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-monoxide.png", 64 },
            },
            "CCOc",
            {
                { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-dioxide.png", 64 },
                "angels-solid-carbon"
            }
        ),
        energy_required = 2,
        technology = "angels-coal-processing-2",
        ingredients = {
            { "angels-solid-carbon",        1 },
            { "angels-catalyst-metal-blue", 1 },
        },
        fluid_ingredients = {
            { "angels-gas-carbon-dioxide", 50 },
        },
        results = {
            { "angels-catalyst-metal-carrier", 1 },
        },
        fluid_results = {
            { "angels-gas-carbon-monoxide", 100 },
        },
        category = "angels-liquifying",

        allow_productivity = false,
        main_product = "angels-gas-carbon-monoxide",
    },
    {
        name = "angels-gas-carbon-monoxide-angels-solid-carbon",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon(
            {
                { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-dioxide.png", 64 },
                "angels-solid-carbon"
            },
            "COcOc",
            {
                { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-monoxide.png", 64 },
            }
        ),
        energy_required = 2,
        technology = "angels-coal-processing-2",
        ingredients = {
            { "angels-catalyst-metal-yellow", 1 },
        },
        fluid_ingredients = {
            { "angels-gas-carbon-monoxide", 100 },
        },
        results = {
            { "angels-solid-carbon",           1 },
            { "angels-catalyst-metal-carrier", 1 },
        },
        fluid_results = {
            { "angels-gas-carbon-dioxide", 50 },
        },
        category = "angels-liquifying",

        allow_productivity = false,
        main_product = "angels-gas-carbon-dioxide",
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
    {
        name = "angels-solid-ammonium-perchlorate-rocket-fuel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("rocket-fuel"),
            vgal.icon.get_in("angels-solid-ammonium-perchlorate"),
        },
        energy_required = 15,
        technology = "rocket-fuel",
        ingredients = {
            { "angels-solid-ammonium-perchlorate", 1 }, -- 100
            { "solid-fuel",                        5 }, -- 90
        },
        results = {
            { "rocket-fuel", 1 }, -- 200
        },
        category = "chemistry",

        groups = { "vgal-unsure" }
    },
    {
        name = "angels-gas-hydrogen-angels-gas-oxygen-rocket-fuel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("rocket-fuel"),
            vgal.icon.get_in("hydrogen", "molecule"),
            vgal.icon.get_in2("oxygen", "molecule"),
        },
        energy_required = 15,
        technology = "rocket-fuel",
        fluid_ingredients = {
            { "angels-gas-hydrogen", 1500 },
            { "angels-gas-oxygen",   200 },
        },
        results = {
            { "rocket-fuel", 1 },
        },
        category = "chemistry",

        groups = { "vgal-unsure" }
    },
    {
        name = "angels-gas-propene-solid-fuel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("solid-fuel"),
            vgal.icon.get_in("propene", "molecule"),
        },
        energy_required = 4,
        technology = { "flammables", "angels-steam-cracking-1" },
        ingredients = {
            { "angels-solid-coke", 1 },
        },
        fluid_ingredients = {
            { "angels-gas-propene", 50 },
        },
        results = {
            { "solid-fuel", 4 },
        },
        category = "chemistry",
        order = "ab",
    },
    -- {
    --     name = "angels-gas-carbon-dioxide-angels-gas-carbon-monoxide",
    --     prefix = "vgal",
    --     icons = angelsmods.functions.create_gas_recipe_icon(
    --         {
    --             { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-monoxide.png", 64 },
    --         },
    --         "ClCOc",
    --         {
    --             { "__angelspetrochemgraphics__/graphics/icons/molecules/carbon-dioxide.png", 64 },
    --         }
    --     ),
    --     energy_required = 2,
    --     technology = "angels-basic-chemistry-3",
    --     ingredients = {
    --         { "angels-electrode", 1 },
    --     },
    --     fluid_ingredients = {
    --         { "angels-gas-carbon-dioxide", 50 },
    --         { "angels-water-saline",       50 },
    --     },
    --     results = {
    --         { "angels-electrode-used",         1 },
    --         { "angels-solid-sodium-hydroxide", 1 }
    --     },
    --     fluid_results = {
    --         { "angels-gas-carbon-monoxide", 50 },
    --         { "angels-gas-chlorine",        50 },
    --         -- { "angels-liquid-aqueous-",                 50 },
    --     },
    --     category = "angels-petrochem-electrolyser",

    --     main_product = "angels-gas-carbon-monoxide"
    -- },
    {
        name = "angels-solid-calcium-carbonate-angels-gas-methane",
        prefix = "vgal",
        icons = angelsmods.functions.create_gas_recipe_icon({
            { "__angelspetrochemgraphics__/graphics/icons/molecules/methane.png", 72 },
        }, "CHH", {
            "angels-solid-calcium-carbonate",
        }),
        energy_required = 2,
        technology = "angels-gas-processing",
        ingredients = {
            { "angels-solid-calcium-carbonate", 2 }, -- 40 carbon dioxide
        },
        fluid_ingredients = {
            { "angels-gas-hydrogen", 30 },
        },
        results = {
            { "angels-solid-lime", 1 },
        },
        fluid_results = {
            { "angels-gas-methane", 50 },
            -- { "angels-water-purified", 20 },
        },
        category = "angels-liquifying",

        main_product = "angels-gas-methane"
    },
}, {
    type = "recipe",
})

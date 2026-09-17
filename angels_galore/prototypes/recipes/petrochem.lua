vgal.extend({
    {
        name = "angels-solid-calcium-carbonate-angels-gas-methane",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-solid-calcium-carbonate" },
            outputs = { "angels-gas-methane" },
            palette = "CHH",
        }),
        energy_required = 2,
        technology = "angels-gas-processing",
        ingredients = {
            { "angels-solid-calcium-carbonate", 2 }, -- 40 carbon dioxide
            { "angels-gas-hydrogen",            30 },
        },
        results = {
            { "angels-gas-methane", 50 },
            { "angels-solid-lime",  1 },
            -- { "angels-water-purified", 20 },
        },
        category = "angels-liquifying",
    },
    {
        name = "angels-gas-chlor-methane-angels-gas-ethane",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-gas-chlor-methane" },
            outputs = { "angels-gas-ethane" },
            palette = "CHH",
        }),
        energy_required = 2,
        technology = "angels-chlorine-processing-2",
        ingredients = {
            { "angels-gas-chlor-methane", 100 }, -- 60 chlor
            { "angels-solid-sodium",      1 },
        },
        results = {
            { "angels-gas-ethane", 50 },
            { "angels-solid-salt", 1 }, -- 60 chlor
        },
        category = "angels-liquifying",

        groups = { "vgal-unsure" },
    },
    {
        name = "angels-gas-methane-angels-liquid-acetic-acid",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-liquid-acetic-acid" },
            outputs = { "angels-gas-methane" },
            palette = "CHH",
        }),
        energy_required = 2,
        technology = { "angels-bio-plastic-1", "angels-sodium-processing-1" },
        ingredients = {
            { "angels-liquid-acetic-acid",     50 },
            { "angels-solid-sodium-hydroxide", 1 },
        },
        results = {
            { "angels-gas-methane",            50 },
            { "angels-solid-sodium-carbonate", 1 },
        },
        category = "angels-liquifying",

        groups = { "vgal-unsure" },
    },
    {
        name = "angels-gas-methanol-angels-gas-chlor-methane",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-gas-methanol" },
            outputs = { "angels-gas-chlor-methane" },
            palette = "CClH",
        }),
        energy_required = 2,
        technology = "angels-chlorine-processing-2",
        ingredients = {
            { "angels-gas-methanol",             40 },
            { "angels-liquid-hydrochloric-acid", 60 },
        },
        results = {
            { "angels-gas-chlor-methane", 100 },
            { "angels-water-purified",    40 },
        },
        category = "chemistry",

        allow_productivity = false,
    },
    -- {
    --     name = "angels-gas-ethylene-angels-gas-ethanol",
    --     prefix = "vgal",
    --     icons = vgal.icon.create({
    --         style = "angels-liquid",
    --         inputs = {},
    --         outputs = { "angels-liquid-acetic-acid" },
    --         palette = "COH",
    --     }),
    --     energy_required = 2,
    --     technology = "angels-bio-fermentation",
    --     ingredients = {
    --         { "angels-gas-ethanol", 50 },
    --         { "angels-gas-oxygen",  25 },
    --     },
    --     results = {
    --         { "angels-liquid-acetic-acid", 50 },
    --         { "angels-water-purified",     25 },
    --     },
    --     category = "chemistry",

    --     allow_productivity = false,
    -- },
    {
        name = "angels-gas-ethanol-angels-liquid-acetic-acid",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-liquid",
            inputs = {},
            outputs = { "angels-liquid-acetic-acid" },
            palette = "COH",
        }),
        energy_required = 2,
        technology = "angels-bio-fermentation",
        ingredients = {
            { "angels-gas-ethanol", 50 },
            { "angels-gas-oxygen",  20 },
        },
        results = {
            { "angels-liquid-acetic-acid", 40 },
            { "angels-water-purified",     20 },
        },
        category = "chemistry",

        allow_productivity = false,
    },
    {
        name = "angels-liquid-acetic-acid-angels-gas-acetone",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-solid-lime" },
            outputs = { "angels-gas-acetone" },
            palette = "COH",
        }),
        energy_required = 2,
        technology = "angels-bio-plastic-1",
        ingredients = {
            { "angels-liquid-acetic-acid", 50 },
            { "angels-solid-lime",         1 },
        },
        results = {
            { "angels-gas-acetone",             100 },
            { "angels-solid-calcium-carbonate", 1,  { independent_probability = 0.5 } },
        },
        category = "chemistry",

        allow_productivity = false,
    },
    {
        name = "angels-gas-ethylene-angels-gas-butane",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-gas-ethylene", "angels-gas-hydrogen" },
            outputs = { "angels-gas-butane" },
            palette = "CHH",
        }),
        energy_required = 2,
        technology = "angels-steam-cracking-1",
        ingredients = {
            { "angels-gas-ethylene",        50 },
            { "angels-gas-hydrogen",        50 },
            { "angels-catalyst-metal-blue", 1 },
        },
        results = {
            { "angels-gas-butane",             50 },
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "chemistry",

        allow_productivity = false,
    },
    {
        name = "angels-gas-acetone-angels-gas-propene",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-gas-acetone" },
            outputs = { "angels-gas-propene" },
            palette = "CHH",
        }),
        energy_required = 2,
        technologies = { "angels-bio-nutrient-paste", "angels-advanced-chemistry-3" },
        ingredients = {
            { "angels-gas-acetone",           50 },
            { "angels-gas-hydrogen",          30 },
            { "angels-catalyst-metal-yellow", 1 },
        },
        results = {
            { "angels-gas-propene",            30 },
            { "angels-water-purified",         20 },
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "chemistry",

        allow_productivity = false,
        -- subgroup = "vgal-CH-gas-from-O",
        -- order = "b[O]-a"
    },
    {
        name = "angels-gas-acetone-angels-gas-propene-angels-gas-ethylene",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-gas-acetone" },
            outputs = { "angels-gas-propene", "angels-gas-ethylene" },
            palette = "CHH",
        }),
        energy_required = 2,
        technologies = { "angels-bio-nutrient-paste", "angels-advanced-chemistry-3" },
        ingredients = {
            { "angels-gas-acetone",           50 },
            { "angels-gas-ethanol",           50 },
            { "angels-catalyst-metal-yellow", 1 },
        },
        results = {
            { "angels-gas-propene",            50 },
            { "angels-gas-ethylene",           30 },
            { "angels-water-purified",         20 },
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "angels-advanced-chemistry",

        allow_productivity = false,
        -- subgroup = "vgal-CH-gas-from-O",
        -- order = "b[O]-b"
    },
    {
        name = "angels-liquid-naphtha-angels-gas-propene-angels-gas-ethylene",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "steam" },
            outputs = { "angels-gas-propene", "angels-gas-ethylene" },
            palette = "CHH",
        }),
        energy_required = 4,
        technology = "angels-steam-cracking-1",
        ingredients = {
            { "angels-liquid-naphtha",      100 },
            { "steam",                      100 },
            { "angels-catalyst-metal-blue", 1 },
        },
        results = {
            { "angels-gas-ethylene",           40 },
            { "angels-gas-propene",            50 },
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "angels-steam-cracking",

        allow_productivity = false,
        subgroup = "vgal-CH-gas-from-O",
        order = "a[steam-cracking]-ab"
    },
    {
        name = "angels-liquid-toluene-angels-gas-benzene",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-liquid-toluene" },
            outputs = { "angels-gas-benzene" },
            palette = "CHH",
        }),
        energy_required = 2,
        technology = "angels-advanced-chemistry-3",
        ingredients = {
            { "angels-liquid-toluene",        100 },
            { "angels-gas-hydrogen",          50 },
            { "angels-catalyst-metal-yellow", 1 },
        },
        results = {
            { "angels-gas-benzene",            100 },
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "chemistry",

        allow_productivity = false,
    },
    -- {
    --     name = "angels-liquid-toluene-angels-gas-benzene-angels-gas-methane",
    --     prefix = "vgal",
    --     icons = vgal.icon.create({
    --         style = "angels-gas",
    --         inputs = { "angels-liquid-toluene" },
    --         outputs = { "angels-gas-benzene", "angels-gas-methane" },
    --         palette = "CHH",
    --     }),
    --     energy_required = 4,
    --     technology = "angels-advanced-chemistry-3",
    --     ingredients = {
    --         { "angels-liquid-toluene", 100 },
    --         { "angels-gas-hydrogen",   50 },
    --     },
    --     results = {
    --         { "angels-gas-benzene", 50 },
    --         { "angels-gas-methane", 20 },
    --     },
    --     category = "chemistry",

    --     allow_productivity = false,
    --     show_amount_in_title = false,
    --     groups = { "vgal-unsure" }
    -- },
    -- { -- commentedbc: syngas
    --     name = "angels-liquid-vegetable-oil-angels-gas-propene-angels-gas-ethylene",
    --     prefix = "vgal",
    --     icons = vgal.icon.create({
    --         style = "angels-liquid",
    --         inputs = {},
    --         outputs = { "angels-gas-propene", "water", "angels-gas-ethylene" },
    --         palette = { { 255, 255, 056 }, { 255, 205, 040 }, { 201, 155, 030 } },
    --     }),
    --     energy_required = 4,
    --     technology = "angels-bio-pressing-1",
    --     ingredients = {
    --         { "angels-liquid-vegetable-oil", 100 },
    --     },
    --     results = {
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
    --     icons = vgal.icon.create({
    --         style = "angels-liquid",
    --         inputs = {},
    --         outputs = { "angels-liquid-propionic-acid", "angels-liquid-acetic-acid", "angels-gas-carbon-dioxide" },
    --         palette = { { 214, 146, 040 }, { 169, 130, 039 }, { 120, 083, 004 } },
    --     }),
    --     energy_required = 2,
    --     technology = "angels-bio-plastic-2",
    --     ingredients = {
    --         { "angels-liquid-nutrient-pulp", 100 },
    --     },
    --     results = {
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
}, {
    type = "recipe",
})

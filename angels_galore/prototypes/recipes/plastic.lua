-- to make costs align with vanilla (one plastic bar should be around as much "worth" as 1.5 plates) plastic bar recipes have been buffed
-- plastic recipes are genrally very "cost-efficient" (they have high multiplier) because of their inherent difficutly. Its more difficult to scale up than metals.
-- especially the ethylene derivative recipes, I'm trying to make it more attractive to do something with it instead of voiding it. (you cant really get it on demand.. yet)
vgal.extend({
    {
        name = "angels-gas-propene-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("angels-gas-propene"),
        }),
        energy_required = 4, -- 2
        technology = "plastics",
        ingredients = {
            { "angels-gas-propene", 80 }, -- 80
        },
        results = {
            { "plastic-bar", 5 }, -- 75
        },
        category = "angels-liquifying",
        order = "aa"
    },
    {
        name = "angels-gas-propene-angels-gas-hydrogen-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("angels-gas-propene"),
            vgal.icon.get_in2("angels-gas-hydrogen"),
        }),
        energy_required = 4, -- 2
        technology = "plastics",
        ingredients = {
            { "angels-gas-propene",  70 },
            { "angels-gas-hydrogen", 30 },
        },
        results = {
            { "plastic-bar", 5 },
        },
        category = "chemistry",
        order = "aab"
    },
    -- {
    --     name = "angels-gas-propene-angels-gas-ammonia-plastic-bar",
    --     prefix = "vgal",
    --     icons = vgal.icon.merge_composites({
    --         vgal.icon.get("plastic-bar"),
    --         vgal.icon.get_in("angels-gas-propene"),
    --         vgal.icon.get_in2("angels-gas-ammonia"),
    --     }),
    --     energy_required = 6,
    --     technology = { "plastics", "angels-nitrogen-processing-2" },
    --     ingredients = {
    --         { "angels-gas-propene", 80 },
    --         { "angels-gas-ammonia", 50 },
    --         { "angels-gas-oxygen",  20 },
    --     },
    --     results = {
    --         { "plastic-bar", 10 },
    --     },
    --     results = {
    --         { "angels-water-purified", 50, { allow_productivity = false } },
    --     },

    --     category = "angels-advanced-chemistry",
    --     order = "aab"
    -- },
    {
        name = "angels-liquid-polyethylene-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("angels-liquid-polyethylene"),
        }),
        energy_required = 3,
        technology = "angels-advanced-chemistry-3",
        ingredients = {
            { "angels-liquid-polyethylene", 20 }, -- 20
        },
        results = {
            { "plastic-bar", 4 }, -- 60
        },

        category = "angels-liquifying",
        order = "ab"
    },
    {
        name = "angels-liquid-naphtha-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("angels-liquid-naphtha"),
        }),
        energy_required = 4,
        technology = "angels-advanced-chemistry-3",
        ingredients = {
            { "angels-liquid-polyethylene", 20 },
            { "angels-liquid-naphtha",      20 }, -- 20
        },
        results = {
            { "plastic-bar", 6 }, -- 90
        },

        category = "chemistry",
        order = "abb"
    },
    {
        name = "angels-gas-ethylene-angels-gas-chlorine-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("angels-gas-ethylene"),
            vgal.icon.get_in2("angels-gas-chlorine"),
        }),
        energy_required = 3,
        technology = { "plastics", "angels-chlorine-processing-1" },
        ingredients = {
            { "angels-gas-ethylene", 30 }, -- 15
            { "angels-gas-chlorine", 20 }, -- 8
        },
        results = {
            { "plastic-bar",                  4 },
            { "angels-gas-hydrogen-chloride", 20, { allow_productivity = false } },
        },

        category = "chemistry",
        order = "abc"
    },
    {
        name = "angels-liquid-phenol-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("angels-liquid-phenol"),
        }),
        energy_required = 2,
        technology = "angels-advanced-chemistry-3",
        ingredients = {
            { "angels-liquid-phenol", 30 }, -- 15
            { "angels-gas-methanol",  25 }, -- 10
        },
        results = {
            { "plastic-bar", 3 }, -- 45
        },
        category = "chemistry",
        order = "ac"
    },
    {
        name = "angels-liquid-cellulose-acetate-mixture-plastic-bar", -- bio 1
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("angels-gas-acetone"),
        }),
        energy_required = 4,
        technology = "angels-bio-plastic-1",
        ingredients = {
            { "angels-liquid-cellulose-acetate-mixture", 20 },
            { "angels-gas-acetone",                      25 },
        },
        results = {
            { "plastic-bar", 5 },
        },
        category = "chemistry",
        order = "ba"
    },
    {
        name = "angels-liquid-acetic-acid-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("angels-liquid-acetic-acid"),
            vgal.icon.get_in2("angels-gas-ethylene"),
        }),
        energy_required = 2,
        technology = "angels-bio-plastic-1",
        ingredients = {
            { "angels-liquid-acetic-acid", 25 },
            { "angels-gas-ethylene",       30 },
            { "angels-gas-oxygen",         15 },
        },
        results = {
            { "plastic-bar", 5 },
        },
        category = "angels-advanced-chemistry",
        order = "bb",

        groups = { "vgal-unsure" }
    },
    {
        name = "angels-liquid-fermentation-raw-plastic-bar",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("angels-liquid-fermentation-raw"),
        }),
        energy_required = 2,
        technology = "angels-bio-plastic-1",
        ingredients = {
            { "angels-liquid-glycerol",         25 },
            { "angels-liquid-fermentation-raw", 30 },
        },
        results = {
            { "plastic-bar", 3 },
        },
        category = "chemistry",
        order = "bbb",

        -- groups = { "vgal-unsure" }
    },
    {
        name = "angels-liquid-propionic-acid-plastic-bar", -- bio 2
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("plastic-bar"),
            vgal.icon.get_in("angels-liquid-propionic-acid"),
            vgal.icon.get_in2("angels-cellulose-fiber"),
        }),
        energy_required = 4,
        technology = "angels-bio-plastic-2",
        ingredients = {
            { "angels-cellulose-fiber",       5 },
            { "angels-liquid-propionic-acid", 25 },
            { "angels-liquid-acetic-acid",    20 },
        },
        results = {
            { "plastic-bar", 6 },
        },
        category = "chemistry",
        order = "bc"
    },
    -- {
    --     name = "angels-liquid-propionic-acid-angels-solid-sodium-hydroxide-plastic-bar",
    --     prefix = "vgal",
    --     icons = vgal.icon.merge_composites({
    --         vgal.icon.get("plastic-bar"),
    --         vgal.icon.get_in("angels-liquid-propionic-acid"),
    --         vgal.icon.get_in2("angels-solid-sodium-hydroxide"),
    --     }),
    --     energy_required = 4,
    --     technology = { "angels-bio-plastic-2", "angels-explosives-3" },
    --     ingredients = {
    --         { "angels-solid-sodium-hydroxide", 1 },
    --         { "angels-cellulose-fiber",        2 },
    --     },
    --     ingredients = {
    --         { "angels-liquid-propionic-acid", 50 },
    --         -- { "angels-liquid-cellulose-acetate-mixture", 15 },
    --         { "angels-liquid-toluene",        25 },
    --     },
    --     results = {
    --         { "plastic-bar", 5 },
    --     },
    --     category = "chemistry",
    --     order = "bc"
    -- },
}, {
    type = "recipe",
})

vgal.extend({
    {
        name = "angels-solid-sodium-chlorate-angels-solid-salt",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("angels-solid-salt"),
            vgal.icon.get_in("angels-solid-sodium-chlorate"),
        }),
        energy_required = 8,
        technology = "angels-chlorine-processing-4",
        ingredients = {
            { "angels-solid-sodium-chlorate", 8 }, -- 40cl, 32ox
        },
        results = {
            { "angels-solid-salt", 1 }, -- 40cl
            { "angels-gas-oxygen", 30 },
        },
        category = "angels-liquifying",

        allow_productivity = false,
        order = "a[salt]-b[from-sodium-chlorate]-a"
    },
    {
        name = "angels-solid-sodium-chlorate-angels-liquid-hydrochloric-acid-angels-solid-salt",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("angels-solid-salt"),
            vgal.icon.get_in("angels-solid-sodium-chlorate"),
            vgal.icon.get_in2("angels-liquid-hydrochloric-acid"),
        }),
        energy_required = 2,
        technology = "angels-chlorine-processing-4",
        ingredients = {
            { "angels-solid-sodium-chlorate",    2 },  -- 10 cl
            { "angels-liquid-hydrochloric-acid", 50 }, -- 50 cl, 50water
        },
        results = {
            { "angels-solid-salt",        1 },  -- 40 cl
            { "angels-water-green-waste", 50 }, -- 10 cl, 50water
        },
        category = "chemistry",
        order = "a[salt]-b[from-sodium-chlorate]-b",
        allow_productivity = false,
    },
    {
        name = "angels-solid-calcium-carbonate-angels-liquid-hydrochloric-acid-angels-solid-calcium-chloride",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("angels-solid-calcium-chloride"),
            vgal.icon.get_in("angels-solid-calcium-carbonate"),
        }),
        energy_required = 2,
        technology = "angels-chlorine-processing-3",
        ingredients = {
            { "angels-solid-calcium-carbonate",  4 },
            { "angels-liquid-hydrochloric-acid", 20 },
        },
        results = {
            { "angels-solid-calcium-chloride", 4 },
            { "angels-gas-carbon-dioxide",     50 },
            -- { "angels-water-purified",     20 },
        },
        category = "chemistry",
    },
    {
        name = "angels-solid-ammonium-nitrate-angels-liquid-fuel-oil-explosives",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("explosives"),
            vgal.icon.get_in("angels-solid-ammonium-nitrate"),
        }),
        energy_required = 8,
        technology = "angels-explosives-2",
        ingredients = {
            { "angels-solid-ammonium-nitrate", 1 },  -- 50
            { "angels-liquid-fuel-oil",        20 }, -- 16
        },
        results = {
            { "explosives", 4 }, -- 60
        },
        category = "chemistry",
    },
    {
        name = "angels-solid-ammonium-perchlorate-rocket-fuel",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("rocket-fuel"),
            vgal.icon.get_in("angels-solid-ammonium-perchlorate"),
        }),
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
        icons = vgal.icon.merge_composites({
            vgal.icon.get("rocket-fuel"),
            vgal.icon.get_in("angels-gas-hydrogen"),
            vgal.icon.get_in2("angels-gas-oxygen"),
        }),
        energy_required = 15,
        technology = "rocket-fuel",
        ingredients = {
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
        icons = vgal.icon.merge_composites({
            vgal.icon.get("solid-fuel"),
            vgal.icon.get_in("angels-gas-propene"),
        }),
        energy_required = 4,
        technology = { "flammables", "angels-steam-cracking-1" },
        ingredients = {
            { "angels-solid-coke",  1 },
            { "angels-gas-propene", 50 },
        },
        results = {
            { "solid-fuel", 4 },
        },
        category = "chemistry",
        order = "ab",
    },
    {
        -- angels mirror, buffed, see the override (didnt wanna make the recipe weird)
        -- uses (alien bacteria) item usage has been compensated
        name = "angels-red-cellulose-fiber-angels-solid-calcium-carbonate",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("angels-solid-calcium-carbonate"),
            vgal.icon.get_in("angels-red-cellulose-fiber"),
        }),
        energy_required = 10, -- 30
        technology = "angels-bio-processing-red",
        ingredients = {
            { "angels-red-cellulose-fiber", 6 }, -- 20
        },
        results = {
            { "angels-solid-calcium-carbonate", 4 },
        },
        category = "angels-liquifying",
    },
    {
        name = "angels-solid-calcium-carbonate-angels-solid-lime",
        prefix = "vgal",
        icons = vgal.icon.merge_composites({
            vgal.icon.get("angels-solid-lime"),
            vgal.icon.get_in("angels-solid-calcium-carbonate"),
        }),
        energy_required = 2,
        technology = "angels-stone-smelting-1",
        ingredients = {
            { "angels-solid-calcium-carbonate", 4 },
        },
        results = {
            { "angels-solid-lime",         4 },
            { "angels-gas-carbon-dioxide", 50 },
        },
        category = "vgal-blast-chemistry",
        allow_productivity = false,
    },
}, {
    type = "recipe",
})

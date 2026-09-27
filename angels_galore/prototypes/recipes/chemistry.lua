vgal.extend({
    {
        name = "angels-solid-coke-angels-gas-carbon-dioxide",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-solid-coke" },
            outputs = { "angels-gas-carbon-dioxide" },
            palette = "COcOc",
        }),
        energy_required = 2,
        technology = "angels-coal-processing",
        ingredients = {
            { "angels-solid-coke", 2 },
        },
        results = {
            { "angels-gas-carbon-dioxide", 75 },
        },
        category = "angels-liquifying",
    },
    {
        name = "angels-gas-carbon-dioxide-angels-solid-carbon-angels-gas-carbon-monoxide",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-gas-carbon-dioxide", "angels-solid-carbon" },
            outputs = { "angels-gas-carbon-monoxide" },
            palette = "CCOc",
        }),
        energy_required = 2,
        technology = "angels-coal-processing-2",
        ingredients = {
            { "angels-solid-carbon",        1 },
            { "angels-gas-carbon-dioxide",  50 },
            { "angels-catalyst-metal-blue", 1 },
        },
        results = {
            { "angels-gas-carbon-monoxide",    100 },
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "angels-liquifying",

        allow_productivity = false,
    },
    {
        name = "angels-gas-carbon-monoxide-angels-solid-carbon",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-gas-carbon-monoxide" },
            outputs = { "angels-gas-carbon-dioxide", "angels-solid-carbon" },
            palette = "COcOc",
        }),
        energy_required = 2,
        technology = "angels-coal-processing-2",
        ingredients = {
            { "angels-gas-carbon-monoxide",   100 },
            { "angels-catalyst-metal-yellow", 1 },
        },
        results = {
            { "angels-gas-carbon-dioxide",     50 },
            { "angels-solid-carbon",           1 },
            { "angels-catalyst-metal-carrier", 1 },
        },
        category = "angels-liquifying",

        allow_productivity = false,
    },
    {
        name = "angels-gas-acid-angels-solid-calcium-sulfate",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-solid-calcium-carbonate" },
            outputs = { "angels-gas-carbon-dioxide", "angels-solid-calcium-sulfate", "angels-liquid-hydrofluoric-acid" },
            palette = "SHH",
        }),
        energy_required = 3,
        technology = "angels-sulfur-processing-2",
        ingredients = {
            { "angels-gas-acid",                100 },
            { "angels-solid-calcium-carbonate", 3 }, -- 37.5 co2
        },
        results = {
            { "angels-solid-calcium-sulfate", 3 },
            { "angels-gas-carbon-dioxide",    40 }, -- +20
            { "angels-gas-hydrogen-fluoride", 20 },
        },
        category = "angels-advanced-chemistry",
    },
    -- {
    --     name = "angels-gas-residual-angels-gas-hydrogen",
    --     prefix = "vgal",
    --     icons = vgal.icon.create({
    --         style = "angels-gas",
    --         outputs = { "angels-gas-hydrogen", "angels-gas-carbon-dioxide", "angels-gas-carbon-monoxide" },
    --         palette = { { 064, 000, 064 }, { 128, 000, 128 }, { 192, 000, 192 } },
    --     }),
    --     energy_required = 2,
    --     technology = "angels-steam-cracking-2",
    --     ingredients = {
    --         { "angels-gas-residual", 100 },
    --     },
    --     results = {
    --         { "angels-gas-hydrogen",        40 },
    --         { "angels-gas-carbon-dioxide",  40 },
    --         { "angels-gas-carbon-monoxide", 20 },
    --     },
    --     category = "angels-advanced-chemistry",

    --     order = "h",
    --     subgroup = "angels-petrochem-carbon-synthesis",
    -- },
    -- -Added "vgal-angels-gas-residual-angels-gas-hydrogen"
    {
        name = "angels-solid-calcium-chloride-angels-gas-hydrogen-chloride",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-solid-calcium-chloride", "steam" },
            outputs = { "angels-gas-hydrogen-chloride" },
            palette = "ClClH",
        }),
        energy_required = 3,
        technology = "angels-chlorine-processing-2",
        ingredients = {
            { "angels-solid-calcium-chloride", 4 },
            { "steam",                         40 },
        },
        results = {
            { "angels-gas-hydrogen-chloride", 20 },
        },
        category = "angels-liquifying",

        allow_productivity = false,
    },
    {
        name = "angels-solid-calcium-chloride-angels-solid-calcium-sulfate",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            inputs = { "angels-solid-calcium-chloride" },
            outputs = { "angels-solid-calcium-sulfate", "angels-gas-hydrogen-chloride" },
            palette = "SHCl",
        }),
        energy_required = 2,
        technology = "angels-chlorine-processing-2",
        ingredients = {
            { "angels-solid-calcium-chloride", 3 },
            { "sulfuric-acid",                 100 },
        },
        results = {
            { "angels-solid-calcium-sulfate", 3 },
            { "angels-gas-hydrogen-chloride", 20 },
        },
        category = "angels-liquifying",

        allow_productivity = false,
    },
}, {
    type = "recipe",
})

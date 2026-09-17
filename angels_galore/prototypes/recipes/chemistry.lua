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
            outputs = { "angels-gas-carbon-dioxide", "angels-gas-hydrogen-sulfide", "angels-liquid-hydrofluoric-acid" },
            palette = "SHH",
        }),
        energy_required = 3,
        technology = "angels-sulfur-processing-2",
        ingredients = {
            { "angels-gas-acid",                100 },
            { "angels-solid-calcium-carbonate", 3 },
        },
        results = {
            { "angels-solid-calcium-sulfate", 3 },
            { "angels-gas-carbon-dioxide",    20 },
            { "angels-gas-hydrogen-fluoride", 20 },
        },
        category = "angels-advanced-chemistry",
    },
}, {
    type = "recipe",
})

vgal.extend({
    {
        name = "sulfuric-acid-angels-solid-sodium-hydroxide-steam",
        prefix = "vgal",
        icons = vgal.icon.create({
            style   = "angels-gas",
            inputs  = { "angels-solid-sodium-hydroxide", "sulfuric-acid" },
            outputs = { "steam" },
            palette = "WsWsWs",
        }),
        energy_required = 0.5,
        technology = "calcite-processing",
        ingredients = {
            { "sulfuric-acid",                 200 },
            { "angels-solid-sodium-hydroxide", 1 },
        },
        results = {
            { "steam", 120, { temperature = 500 } },
        },
        category = "angels-liquifying",

        order = "c[acid-neutralisation]-b",
        subgroup = "vgal-water",
        allow_productivity = false,
        surface_conditions = vgal.get_surface_conditions_for("vulcanus"),
    },
    -- {
    --     name = "angels-liquid-nitric-acid-holmium-solution",
    --     prefix = "vgal",
    --     icons = vgal.icon.create({
    --         inputs = { "angels-liquid-nitric-acid" },
    --         outputs = { "holmium-solution" },
    --     }),
    --     category = "angels-liquifying",
    --     energy_required = 10,
    --     technology = "holmium-processing",
    --     ingredients = {
    --         { "angels-liquid-nitric-acid", 10 },
    --         { "holmium-ore",               2 },
    --     },
    --     results = {
    --         { "holmium-solution", 100 },
    --     },
    -- },
    {
        name = "holmium-ore-angels-crystal-slurry",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-liquid",
            inputs = { "holmium-ore" },
            palette = { { 184, 231, 043 }, { 080, 172, 033 }, { 055, 126, 017 } }
        }),
        category = "angels-liquifying",
        energy_required = 5,
        technology = "holmium-processing",
        ingredients = {
            { "sulfuric-acid", 50 },
            { "holmium-ore",   1 },
        },
        results = {
            { "angels-crystal-slurry", 100 },
        },
    },
}, {
    type = "recipe",
})

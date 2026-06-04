vgal.data.extend({
    {
        name = "calcite-angels-solid-lime",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-lime"),
            vgal.icon.get_in("calcite"),
        },
        energy_required = 3,
        technology = "calcite-processing",
        ingredients = {
            { "calcite", 4 },
        },
        results = {
            { "angels-solid-lime", 4 },
        },
        fluid_results = {
            { "angels-gas-carbon-dioxide", 50 },
        },
        category = "angels-blast-smelting",
    },
}, {
    type = "recipe",
})

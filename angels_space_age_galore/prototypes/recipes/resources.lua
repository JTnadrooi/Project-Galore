vgal.data.extend({
    {
        name = "calcite-angels-solid-calcium-carbonate",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-calcium-carbonate"),
            vgal.icon.get_in("calcite"),
        },
        energy_required = 2,
        technology = "calcite-processing",
        ingredients = {
            { "calcite", 2 },
        },
        results = {
            { "angels-solid-calcium-carbonate", 2 },
            { "angels-stone-crushed",           1 },
        },
        categories = { "angels-ore-refining-t1", "hand-crafting" }
    },
}, {
    type = "recipe",
})

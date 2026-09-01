vgal.data.extend({
    {
        name = "calcite-angels-solid-calcium-carbonate",
        prefix = "vgal",
        icons = angelsmods.functions.add_icon_layer({
            {
                icon = "__angelsrefininggraphics__/graphics/icons/ore-crusher.png",
                icon_size = 64,
                scale = 0.5,
            },
        }, angelsmods.functions.get_object_icons("calcite"), { -10, 10 }, 0.5),
        energy_required = 2,
        technology = "calcite-processing",
        ingredients = {
            { "calcite", 2 },
        },
        results = {
            { "angels-solid-calcium-carbonate", 2 },
            { "angels-stone-crushed",           1 },
        },
        categories = { "angels-ore-refining-t1", "hand-crafting" },

        order = "gb",
        subgroup = "raw-resource",
    },
}, {
    type = "recipe",
})

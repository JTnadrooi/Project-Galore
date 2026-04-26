vgal.data.extend({
    {
        name = "angels-solid-leafs-angels-cellulose-fiber",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-cellulose-fiber"),
            vgal.icon.get_in("angels-solid-leafs"),
        },
        energy_required = 1,
        technology = "angels-bio-arboretum-1",
        ingredients = {
            { "angels-solid-leafs", 10 },
        },
        results = {
            { "angels-cellulose-fiber", 2 },
        },
        show_amount_in_title = false,
        category = "crafting",
    }
}, {
    type = "recipe",
})

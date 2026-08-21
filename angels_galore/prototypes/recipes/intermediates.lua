vgal.data.extend({
    {
        name = "angels-electrode-used-angels-solid-carbon-angels-electrode",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-electrode"),
            vgal.icon.get_in("angels-solid-carbon"),
        },
        energy_required = 1,
        technology = "angels-basic-chemistry-3",
        ingredients = {
            { "angels-solid-carbon",   1 },
            { "angels-electrode-used", 1 },
        },
        results = {
            { "angels-electrode", 1 },
        },
        category = "crafting",

        order = "ab",
        allow_productivity = false,
    },
}, {
    type = "recipe",
})

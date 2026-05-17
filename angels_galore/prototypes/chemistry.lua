vgal.data.extend({
    {
        name = "angels-solid-sodium-chlorate-angels-solid-salt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-salt"),
            vgal.icon.get_in("angels-solid-sodium-chlorate"),
        },
        energy_required = 5,
        technology = "angels-chlorine-processing-4",
        ingredients = {
            { "angels-solid-sodium-chlorate", 5 },
        },
        results = {
            { "angels-solid-salt", 5 },
        },
        fluid_results = {
            { "angels-gas-oxygen", 10 },
        },
        allow_productivity = false,
        category = "angels-liquifying",
    },
}, {
    type = "recipe",
})

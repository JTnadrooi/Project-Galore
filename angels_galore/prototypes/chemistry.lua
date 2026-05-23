vgal.data.extend({
    {
        name = "angels-solid-sodium-chlorate-angels-solid-salt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-salt"),
            vgal.icon.get_in("angels-solid-sodium-chlorate"),
        },
        energy_required = 8,
        technology = "angels-chlorine-processing-4",
        ingredients = {
            { "angels-solid-sodium-chlorate", 8 }, -- 40cl, 32ox
        },
        results = {
            { "angels-solid-salt", 1 }, -- 40cl
        },
        fluid_results = {
            { "angels-gas-oxygen", 30 },
        },
        allow_productivity = false,
        category = "angels-liquifying",
    },
    {
        name = "angels-solid-sodium-chlorate-angels-liquid-hydrochloric-acid-angels-solid-salt",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-salt"),
            vgal.icon.get_in("angels-solid-sodium-chlorate"),
            vgal.icon.get_in2("hydrochloric-acid", "molecule"),
        },
        energy_required = 2,
        technology = "angels-chlorine-processing-4",
        ingredients = {
            { "angels-solid-sodium-chlorate", 2 }, -- 10 cl
        },
        fluid_ingredients = {
            { "angels-liquid-hydrochloric-acid", 50 }, -- 50 cl, 50water
        },
        results = {
            { "angels-solid-salt", 1 }, -- 40 cl
        },
        fluid_results = {
            { "angels-water-green-waste", 50 }, -- 10 cl, 50water
        },
        category = "chemistry",

        order = "ab",
        allow_productivity = false,
    },
}, {
    type = "recipe",
})

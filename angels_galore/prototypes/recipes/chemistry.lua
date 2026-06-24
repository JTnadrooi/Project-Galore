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
        category = "angels-liquifying",
        
        allow_productivity = false,
        show_amount_in_title = false,
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
        show_amount_in_title = false,
    },
    {
        -- angels mirror, buffed, see the override (didnt wanna make the recipe weird)
        -- uses (alien bacteria) item usage has been compensated
        name = "angels-red-cellulose-fiber-angels-solid-calcium-carbonate",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-calcium-carbonate"),
            vgal.icon.get_in("angels-red-cellulose-fiber"),
        },
        energy_required = 10, -- 30
        technology = "angels-bio-processing-red",
        ingredients = {
            { "angels-red-cellulose-fiber", 6 }, -- 20
        },
        results = {
            { "angels-solid-calcium-carbonate", 5 },
        },
        category = "angels-liquifying",
    }
}, {
    type = "recipe",
})

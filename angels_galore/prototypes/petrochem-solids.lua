vgal.data.extend({
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

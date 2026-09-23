vgal.extend({
    {
        name = "fluorine-angels-gas-hydrogen-fluoride",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            input = { "fluorine" },
            outputs = { "angels-gas-hydrogen-fluoride" },
            palette = "FHH",
        }),
        energy_required = 4,
        technology = "cryogenic-plant",
        ingredients = {
            { "fluorine", 50 },
            { "steam",    100 },
        },
        results = {
            { "angels-gas-hydrogen-fluoride", 100 },
        },
        category = "chemistry",

        main_recipe = true,
        allow_productivity = false,
    },
    {
        name = "angels-gas-hydrogen-fluoride-fluorine",
        prefix = "vgal",
        icons = vgal.icon.create({
            style = "angels-gas",
            input = { "angels-gas-hydrogen-fluoride" },
            outputs = { "fluorine", "angels-gas-hydrogen" },
            palette = "FHH",
        }),
        energy_required = 2,
        technology = "cryogenic-plant",
        ingredients = {
            { "angels-gas-hydrogen-fluoride", 100 },
        },
        results = {
            { "fluorine",            50 },
            { "angels-gas-hydrogen", 50 },
        },
        category = "chemistry",

        main_recipe = true,
        allow_productivity = false,
    },
}, {
    type = "recipe",
})

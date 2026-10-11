data:extend({
    {
        type = "technology",
        name = "vgal-fluorine-processing-1",
        icons = angelsmods.functions.create_gas_tech_icon("FFF"),
        prerequisites = {
            "angels-sulfur-processing-2",
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "angels-gas-hydrogen-fluoride",
            },
            {
                type = "unlock-recipe",
                recipe = "angels-liquid-hydrofluoric-acid",
            },
            {
                type = "unlock-recipe",
                recipe = "angels-hydrogen-fluoride-dissolving",
            },
        },
        unit = {
            count = 50,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
            },
            time = 15,
        },
        order = "c-a",
    },
})

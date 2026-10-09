vgal.extend({
    {
        name = "fluoroketone-coolant-cooling",
        prefix = "vgal",
        energy_required = 2,
        technology = "cryogenic-plant",
        ingredients = {
            { "angels-liquid-coolant-used", 200, { minimum_temperature = 250, maximum_temperature = 350 } },
            { "fluoroketone-cold",          10 },
        },
        results = {
            { "angels-liquid-coolant-used", 200, { temperature = 25 } },
            { "fluoroketone-hot",           10,  { temperature = 180 } },
        },
        main_ingredient = "fluoroketone-cold",
        category = "cryogenics",
        allow_productivity = false,
        order = "j",
        subgroup = "angels-coolant",
    },
}, {
    type = "recipe",
})

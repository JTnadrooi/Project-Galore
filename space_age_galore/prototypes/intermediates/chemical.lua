vgal.data.extend
{
    {
        type = "recipe",
        name = "solid-fuel-carbon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("carbon"),
            vgal.icon.get_in("solid-fuel"),
        },
        category = "chemistry-or-cryogenics",
        energy_required = 2,
        technology = "coal-liquefaction",
        fluid_ingredients = {
            { "sulfuric-acid", 10 }, -- 15
        },
        ingredients = {
            { "solid-fuel", 2 }, -- 36
        },
        fluid_results = {
            {
                "steam",
                15,
                {
                    temperature = 165,
                },
            },
        },
        results = {
            { "carbon", 1 } -- 50
        },
    },
    {
        type = "recipe",
        name = "sulfuric-acid-sulfur",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("sulfur"),
            vgal.icon.get_in("sulfuric-acid", "fluid"),
            vgal.icon.get_in2("calcite"),
        },
        show_amount_in_title = false,
        category = "chemistry-or-cryogenics",
        energy_required = 4,
        technology = "calcite-processing",
        fluid_ingredients = {
            { "sulfuric-acid", 1000 },
        },
        ingredients = {
            { "calcite", 1 }, -- 10
        },
        fluid_results = {
            {
                "steam",
                2000,
                {
                    temperature = 105,
                }, -- gl getting rid of this
            },
        },
        results = {
            { "sulfur", 4 }, -- 50
        },
        groups = { "unsure" }
    },
    {
        type = "recipe",
        name = "water-fluoroketone-cold-ice",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("ice"),
            vgal.icon.get_in("water", "fluid"),
            vgal.icon.get_in2("fluoroketone-cold", "fluid"),
        },
        category = "cryogenics",
        energy_required = 2,
        technology = "cryogenic-plant",
        fluid_ingredients = {
            { "fluoroketone-cold", 12 },
        },
        ingredients = {
            { "water", 300 },
        },
        fluid_results = {
            {
                "fluoroketone-cold",
                10,
                {
                    temperature = -150,
                },
            },
        },
        results = {
            { "ice", 5 },
        },
    },
    {
        type = "recipe",
        name = "water-ice",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("ice"),
            vgal.icon.get_in("water", "fluid"),
        },
        category = "cryogenics",
        energy_required = 10,
        technology = "cryogenic-plant",
        ingredients = {
            { "water", 320 },
        },
        results = {
            { "ice", 5 },
        },
    },
}

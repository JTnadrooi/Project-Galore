vgal.data.extend
{
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
        surface_conditions =
        {
            {
                property = "pressure",
                min = 4000,
                max = 4000,
            }
        },
        groups = { "unsure" }
    },
    {
        type = "recipe",
        name = "water-fluoroketone-cold-ice", -- 1 rocket is 5000 fluid, 1r = 500,000 ice, 1r = 10,000,000 water
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("ice"),
            vgal.icon.get_in("water", "fluid"),
            vgal.icon.get_in2("fluoroketone-cold", "fluid"),
        },
        category = "cryogenics",
        energy_required = 20,
        technology = "cryogenic-plant",
        fluid_ingredients = {
            { "fluoroketone-cold", 15 },
            { "water",             2000 },
        },
        fluid_results = {
            {
                "fluoroketone-hot",
                14,
                -- {
                --     temperature = 180,
                -- },
            },
        },
        results = {
            { "ice", 100 },
        },
        groups = { "unsure" },
        show_amount_in_title = false,
        allow_productivity = false,
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
        energy_required = 20,
        technology = "cryogenic-plant",
        fluid_ingredients = {
            { "water", 150 },
        },
        results = {
            { "ice", 5 },
        },
        show_amount_in_title = false,
        allow_productivity = false,
    },
    {
        type = "recipe",
        name = "stone-bioflux-calcite",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("calcite"),
            vgal.icon.get_in("bioflux"),
        },
        category = "organic",
        energy_required = 8,
        technology = { "bacteria-cultivation", "calcite-processing" },
        fluid_ingredients = {
            { "steam", 20, { temperature = 500 } },
        },
        ingredients = {
            { "copper-bacteria", 1 }, -- 30
            { "bioflux",         1 }, -- 80
            { "stone",           5 }, -- 50
        },
        results = {
            { "calcite", 1 }, -- 10(vu), 115 import
            -- { "spoilage", 2, { show_details_in_recipe_tooltip = false } }, -- 20
        },
        show_amount_in_title = false,
    },
    {
        type = "recipe",
        name = "pentapod-egg-bioflux-stone",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stone"),
            vgal.icon.get_in("pentapod-egg"),
            vgal.icon.get_in2("bioflux"),
        },
        category = "organic",
        energy_required = 15,
        technology = "biochamber",
        ingredients = {
            { "pentapod-egg", 1 }, -- 300
            { "bioflux",      1 }, -- 80
        },
        results = {
            { "stone", 32 }, -- 320
            -- { "spoilage", 2, { show_details_in_recipe_tooltip = false } }, -- 20
        },
        show_amount_in_title = false,
    },
    {
        type = "recipe",
        name = "wood-carbon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("carbon"),
            vgal.icon.get_in("wood"),
        },
        category = "organic",
        energy_required = 8,
        technology = "biochamber",
        ingredients = {
            { "wood", 2 },
        },
        results = {
            { "carbon", 1 }, -- 50
        },
        fluid_results = {
            { "water", 10 },
        },
        show_amount_in_title = false,
    },
    {
        type = "recipe",
        name = "solid-fuel-carbon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("carbon"),
            vgal.icon.get_in("solid-fuel"),
            vgal.icon.get_in2("steam"),
        },
        category = "chemistry-or-cryogenics",
        energy_required = 8,
        technology = "space-platform",
        fluid_ingredients = {
            { "steam", 20 },
        },
        ingredients = {
            { "solid-fuel", 5 }, -- 30
        },
        results = {
            { "carbon", 1 }, -- 50
        },
        show_amount_in_title = false,
    },
    {
        type = "recipe",
        name = "solid-fuel-sulfuric-acid-carbon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("carbon"),
            vgal.icon.get_in("solid-fuel"),
            vgal.icon.get_in2("sulfuric-acid"),
        },
        category = "chemistry-or-cryogenics",
        energy_required = 8,
        technology = "space-platform",
        fluid_ingredients = {
            { "sulfuric-acid", 10 },
        },
        ingredients = {
            { "solid-fuel", 3 }, -- 30
        },
        results = {
            { "carbon", 1 }, -- 50
        },
        show_amount_in_title = false,
    },
    {
        type = "recipe",
        name = "carbon-lubricant",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("lubricant"),
            vgal.icon.get_in("carbon"),
            vgal.icon.get_in2("heavy-oil"),
        },
        category = "chemistry",
        energy_required = 1,
        technology = "space-platform",
        fluid_ingredients = {
            { "heavy-oil", 20 }, -- 30
        },
        ingredients = {
            { "carbon", 1 }, -- 50
        },
        fluid_results = {
            { "lubricant", 40 },
        },
    },
    {
        type = "recipe",
        name = "thruster-fuel-thruster-oxidizer-solid-fuel-rocket-fuel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("rocket-fuel"),
            vgal.icon.get_in("thruster-fuel"),
            vgal.icon.get_in2("thruster-oxidizer"),
        },
        category = "chemistry-or-cryogenics",
        energy_required = 15,
        technology = "space-platform",
        fluid_ingredients = {
            { "thruster-oxidizer", 200 }, -- 200
            { "thruster-fuel",     400 }, -- 200
        },
        ingredients = {
            { "solid-fuel", 1 }, -- 15 (in a rocket goes like 1000 so its ok)
        },
        results = {
            { "rocket-fuel", 1 }, -- 200
        },
        groups = { "unsure" },
    },
    {
        type = "recipe",
        name = "plastic-bar-electrolyte",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electrolyte"),
            vgal.icon.get_in("plastic-bar"),
        },
        category = "electromagnetics",
        energy_required = 10,
        technology = "electromagnetic-plant",
        fluid_ingredients = {
            { "light-oil",        40 }, -- 80 (worth more on fl)
            { "holmium-solution", 10 }, -- 80
        },
        ingredients = {
            { "plastic-bar", 2 }, -- 30
        },
        fluid_results = {
            { "electrolyte", 20 }, -- 200
        },
    },
    {
        type = "recipe",
        name = "sulfuric-acid-electrolyte",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electrolyte"),
            vgal.icon.get_in("sulfuric-acid"),
        },
        category = "electromagnetics",
        energy_required = 10,
        technology = "electromagnetic-plant",
        fluid_ingredients = {
            { "sulfuric-acid",    40 }, -- 160 (worth way more on fl)
            { "holmium-solution", 5 },  -- 40
        },
        ingredients = {
            { "stone", 1 }, -- 10
        },
        fluid_results = {
            { "electrolyte", 20 }, -- 200
        },
    },
    -- {
    --     type = "recipe",
    --     name = "spoilage-crude-oil",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("crude-oil"),
    --         vgal.icon.get_in("spoilage"),
    --     },
    --     category = "organic",
    --     energy_required = 10,
    --     technology = "agriculture",
    --     fluid_ingredients = {
    --         { "sulfuric-acid", 10 },
    --     },
    --     ingredients = {
    --         { "spoilage", 15 },
    --     },
    --     fluid_results = {
    --         { "crude-oil", 100 },
    --     },
    -- },
    -- {
    --     type = "recipe",
    --     name = "thruster-fuel-thruster-oxidizer-light-oil-rocket-fuel",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("rocket-fuel"),
    --         vgal.icon.get_in("thruster-fuel"),
    --         vgal.icon.get_in2("carbon"),
    --     },
    --     category = "cryogenics",
    --     energy_required = 15,
    --     technology = "cryogenic-plant",
    --     fluid_ingredients = {
    --         { "thruster-oxidizer", 100 }, -- 100
    --         { "thruster-fuel",     100 }, -- 30
    --     },
    --     results = {
    --         { "rocket-fuel", 1 }, -- 200
    --     },
    -- },
    -- {
    --     name = "raw-fish-light-oil",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("light-oil", "fluid"),
    --         vgal.icon.get_in("raw-fish", "capsule")
    --     },
    --     technology = "fish-breeding",
    --     category = "organic",
    --     energy_required = 5,
    --     ingredients = {
    --         { "raw-fish", 1 }, -- 900
    --     },
    --     fluid_ingredients = {
    --         { "sulfuric-acid", 10 }, -- 15
    --     },
    --     fluid_results = {
    --         { "light-oil", 500 }, -- 800
    --     },
    -- },
}

vgal.data.extend
{
    {
        type = "recipe",
        name = "sulfuric-acid-sulfur",
        prefix = "vgal",
        icons = vgal.icon.register {
            -- vgal.icon.get("sulfur"),
            -- vgal.icon.get_in("sulfuric-acid", "fluid"),
            -- vgal.icon.get_in2("calcite"),

            vgal.icon.get_in_bg("sulfuric-acid"),
            vgal.icon.get_in_bg2("calcite"),
            vgal.icon.get_none(),
            vgal.icon.get("sulfur"),
        },
        show_amount_in_title = false,
        category = "chemistry-or-cryogenics",
        energy_required = 2,
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
                    temperature = 165,
                },
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
        category = "chemistry-or-cryogenics",
        energy_required = 20,
        technology = "space-platform",
        fluid_ingredients = {
            { "water", 150 },
        },
        results = {
            { "ice", 5 },
        },
        show_amount_in_title = false,
        allow_productivity = false,
    },
    -- {
    --     type = "recipe",
    --     name = "stone-bioflux-calcite",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("calcite"),
    --         vgal.icon.get_in("bioflux"),
    --     },
    --     category = "organic",
    --     energy_required = 8,
    --     technology = { "bacteria-cultivation", "calcite-processing" },
    --     fluid_ingredients = {
    --         { "steam", 20, { temperature = 500 } },
    --     },
    --     ingredients = {
    --         { "copper-bacteria", 1 }, -- 30
    --         { "bioflux",         1 }, -- 80
    --         { "stone",           5 }, -- 50
    --     },
    --     results = {
    --         { "calcite", 1 }, -- 10(vu), 115 import
    --     },
    --     show_amount_in_title = false,
    -- },
    {
        type = "recipe",
        name = "pentapod-egg-bioflux-stone",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("pentapod-egg"),
            vgal.icon.get_out_to("stone"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 45,
        technology = "biochamber",
        ingredients = {
            { "pentapod-egg", 1 }, -- 300
            { "bioflux",      1 }, -- 80
        },
        results = {
            { "stone", 30 }, -- 300
        },
        show_amount_in_title = false,
    },
    {
        type = "recipe",
        name = "wood-carbon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("wood"),
            vgal.icon.get_out_to("carbon"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 8,
        technology = "biochamber",
        ingredients = {
            { "wood", 5 },
        },
        results = {
            { "carbon", 1 }, -- 50
        },
        fluid_results = {
            { "water", 10 },
        },
        groups = { "wood-recipe" },
        show_amount_in_title = false,
    },
    {
        type = "recipe",
        name = "solid-fuel-carbon",
        prefix = "vgal",
        -- icons = vgal.icon.register {
        --     vgal.icon.get("carbon"),
        --     vgal.icon.get_in("solid-fuel"),
        --     vgal.icon.get_in2("steam"),
        -- },
        icons = vgal.icon.register {
            vgal.icon.get_in_to("solid-fuel"),
            vgal.icon.get_out_to("carbon"),
            vgal.icon.get_overlay("to"),
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
            vgal.icon.get_in_to("solid-fuel"),
            vgal.icon.get_out_to("carbon"),
            vgal.icon.get_overlay("to"),

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
        name = "carbon-sulfur-lubricant",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("lubricant"),
            vgal.icon.get_in_fluid("sulfur"),
            vgal.icon.get_in_fluid2("carbon"),
        },
        category = "chemistry",
        energy_required = 1,
        technology = "space-platform",
        fluid_ingredients = {
            { "water", 30 },
        },
        ingredients = {
            { "carbon", 1 }, -- 50
            { "sulfur", 1 }, -- 15
        },
        fluid_results = {
            { "lubricant", 30 }, -- 60
        },
    },
    {
        type = "recipe",
        name = "carbon-lubricant", -- for vulcanus
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("lubricant"),
            vgal.icon.get_in_fluid("carbon"),
        },
        category = "chemistry",
        energy_required = 3,
        technology = "space-platform",
        fluid_ingredients = {
            { "water", 30 },
        },
        ingredients = {
            { "carbon", 4 }, -- 200
        },
        fluid_results = {
            { "lubricant", 30 }, -- 60
        },
    },
    {
        type = "recipe",
        name = "calcite-stone-holmium-solution",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("holmium-solution"),
            vgal.icon.get_in_fluid("steam"),
            vgal.icon.get_in_fluid2("calcite"),
        },
        category = "chemistry",
        energy_required = 1,
        technology = "holmium-processing",
        fluid_ingredients = {
            { "steam", 100, { temperature = 500 } },
        },
        ingredients = {
            { "calcite",     1 },
            { "holmium-ore", 1 },
        },
        fluid_results = {
            { "holmium-solution", 100 },
        },
    },
    {
        type = "recipe",
        name = "scrap-sulfuric-acid-holmium-solution", --
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("holmium-solution"),
            vgal.icon.get_in_fluid("scrap"),
            vgal.icon.get_in_fluid2("sulfuric-acid"),
        },
        category = "chemistry",
        energy_required = 25,
        technology = "holmium-processing",
        fluid_ingredients = {
            { "sulfuric-acid", 200 }, -- 750
        },
        ingredients = {
            { "scrap",   250 }, -- 1250 (250 scrap = 2,5 ore)
            { "calcite", 1 },   -- 115
            { "carbon",  5 },   -- <250 from the solid fuel, or from space
        },
        fluid_results = {
            { "holmium-solution", 250, }, -- 2125
        },
        groups = { "unsure", "convoluted" },
        productivity_technology = "scrap-recycling-productivity",
        show_amount_in_title = false,
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
        energy_required = 6,
        technology = "space-platform-thruster",
        fluid_ingredients = {
            { "thruster-oxidizer", 100 }, -- 200
            { "thruster-fuel",     200 }, -- 200
        },
        ingredients = {
            { "solid-fuel", 1 }, -- 15 (in a rocket goes like 1000 so its ok)
        },
        results = {
            { "rocket-fuel", 1 }, -- 200
        },
        groups = { "unsure" },
        surface_conditions =
        {
            {
                property = "gravity",
                min = 0,
                max = 0
            }
        },
    },
    {
        type = "recipe",
        name = "plastic-bar-electrolyte",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electrolyte"),
            vgal.icon.get_in_fluid("plastic-bar"),
        },
        category = "electromagnetics",
        energy_required = 10,
        technology = "electromagnetic-plant",
        fluid_ingredients = {
            { "light-oil",        40 },
            { "holmium-solution", 10 },
        },
        ingredients = {
            { "plastic-bar", 2 },
        },
        fluid_results = {
            { "electrolyte", 20 },
        },
    },
    {
        type = "recipe",
        name = "sulfuric-acid-electrolyte",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electrolyte"),
            vgal.icon.get_in_fluid("sulfuric-acid"),
        },
        category = "electromagnetics",
        energy_required = 10,
        technology = "electromagnetic-plant",
        fluid_ingredients = {
            { "sulfuric-acid",    40 }, -- 80
            { "holmium-solution", 10 }, -- 80
        },
        ingredients = {
            { "stone", 1 }, -- 10
        },
        fluid_results = {
            { "electrolyte", 20 }, -- 200
        },
    },
    {
        type = "recipe",
        name = "iron-bacteria-ammonia",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("iron-bacteria"),
            vgal.icon.get_out_to("ammonia"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 6,
        technology = "bacteria-cultivation",
        ingredients = {
            { "iron-bacteria", 4 }, -- 120
            { "bioflux",       1 }, -- 90
        },
        fluid_results = {
            { "ammonia", 80 }, -- 150 * 1.5 = 225
        },
    },
    {
        type = "recipe",
        name = "copper-bacteria-ammonia",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get_in_to("copper-bacteria"),
            vgal.icon.get_out_to("ammonia"),
            vgal.icon.get_overlay("to"),
        },
        category = "organic",
        energy_required = 4,
        technology = "bacteria-cultivation",
        ingredients = {
            { "copper-bacteria", 2 }, -- 60
            { "bioflux",         1 }, -- 90
        },
        fluid_results = {
            { "ammonia", 50 }, -- 100 * 1.5 = 150
        },
    },
}

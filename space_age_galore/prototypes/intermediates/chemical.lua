vgal.data.extend({
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
        name = "jelly-crude-oil-solid-fuel",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("solid-fuel"),
            vgal.icon.get_in("jelly"),
            -- vgal.icon.get_in2("crude-oil"),
        },
        energy_required = 3,
        technology = "jellynut",
        fluid_ingredients = {
            { "crude-oil", 6 }, -- ~2
        },
        ingredients = {
            { "jelly", 4 }, -- 24
        },
        results = {
            { "solid-fuel", 1 }, -- 20 * 1.5 = 30
        },
        category = "organic",
    },
    {
        type = "recipe",
        name = "spoilage-sulfuric-acid-carbon",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("carbon"),
            vgal.icon.get_in("spoilage"),
            vgal.icon.get_in2("sulfuric-acid"),
        },
        category = "organic",
        energy_required = 12,
        technology = "biochamber",
        fluid_ingredients = {
            { "sulfuric-acid", 5 },
        },
        ingredients = {
            { "spoilage", 3 },
        },
        results = {
            { "carbon", 1 },
        },
        order = "b[chemistry]-f[carbon]-b",
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
            { "wood", 6 },
        },
        results = {
            { "carbon", 1 }, -- 50 * 1.5 = 75
        },
        fluid_results = {
            { "water", 10 },
        },
        groups = { "vgal-wood-recipes" },
        order = "b[chemistry]-f[carbon]-c",
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
        energy_required = 5,
        technology = "space-platform",
        fluid_ingredients = {
            { "sulfuric-acid", 10 },
        },
        ingredients = {
            { "solid-fuel", 20 }, -- 30
        },
        results = {
            { "carbon", 1 }, -- 50
        },
        order = "b[chemistry]-f[carbon]-c",
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
            { "carbon", 2 }, -- 100
            { "sulfur", 1 }, -- 15
        },
        fluid_results = {
            { "lubricant", 20 }, -- 60
        },
    },
    {
        type = "recipe",
        name = "jelly-sulfur-lubricant",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("lubricant"),
            vgal.icon.get_in_fluid("sulfur"),
            vgal.icon.get_in_fluid2("jelly"),
        },
        category = "organic",
        energy_required = 1,
        technology = "bioflux-processing",
        fluid_ingredients = {
            { "water", 30 },
        },
        ingredients = {
            { "jelly",  12 }, -- 72
            { "sulfur", 1 },  -- 15
        },
        fluid_results = {
            { "lubricant", 20 }, -- (1.5)=60
        },
    },
    -- {
    --     type = "recipe",
    --     name = "carbon-lubricant", -- for vulcanus
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("lubricant"),
    --         vgal.icon.get_in_fluid("carbon"),
    --     },
    --     category = "chemistry",
    --     energy_required = 3,
    --     technology = "space-platform",
    --     fluid_ingredients = {
    --         { "water", 30 },
    --     },
    --     ingredients = {
    --         { "carbon", 4 }, -- 200
    --     },
    --     fluid_results = {
    --         { "lubricant", 30 }, -- 60
    --     },
    -- },
    -- {
    --     name = "heavy-oil-ammonia-sulfur",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("sulfur"),
    --         vgal.icon.get_in("ammonia"),
    --     },
    --     category = "chemistry-or-cryogenics",
    --     energy_required = 6,
    --     fluid_ingredients = {
    --         { "heavy-oil", 120 },
    --         { "ammonia",   80 }, -- 160
    --     },
    --     results = {
    --         { "sulfur", 6 }, --
    --     },
    --     technology = "planet-discovery-fulgora",
    --     show_amount_in_title = false,
    --     groups = { "vgal-convoluted" },
    -- },
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
        energy_required = 10,
        technology = "holmium-processing",
        fluid_ingredients = {
            { "steam", 100, { minimum_temperature = 500 } },
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
        groups = { "vgal-unsure", "vgal-convoluted" },
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
        groups = { "vgal-unsure" },
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
            vgal.icon.get_in("light-oil"),
            vgal.icon.get_in2("plastic-bar"),
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
            { "electrolyte", 15 },
        },
    },
    {
        type = "recipe",
        name = "sulfuric-acid-electrolyte",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("electrolyte"),
            vgal.icon.get_in("sulfuric-acid"),
            vgal.icon.get_in2("stone"),
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
            { "electrolyte", 15 }, --
        },
    },
    -- {
    --     type = "recipe",
    --     name = "calcite-fluorine",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("fluorine"),
    --         -- vgal.icon.get_in_fluid("calcite"),
    --         -- vgal.icon.get_in_to("calcite"),
    --         -- vgal.icon.get_out_to("fluorine"),
    --         -- vgal.icon.get_overlay("to"),
    --     },
    --     category = "chemistry-or-cryogenics",
    --     energy_required = 2,
    --     technology = "calcite-processing",
    --     ingredients = {
    --         { "calcite", 2 },
    --     },
    --     fluid_results = {
    --         { "fluorine", 20 },
    --     },
    --     show_amount_in_title = false,
    --     groups = { "vgal-unsure" },
    -- },
    -- {
    --     type = "recipe",
    --     name = "fluorine-tungsten-carbide",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("tungsten-carbide"),
    --         vgal.icon.get_in("fluorine"),
    --     },
    --     category = "crafting-with-fluid",
    --     energy_required = 5,
    --     technology = "calcite-processing",
    --     ingredients = {
    --         { "tungsten-ore", 5 },
    --         { "carbon",       5 },
    --     },
    --     fluid_ingredients = {
    --         { "fluorine", 10 },
    --     },
    --     results = {
    --         { "tungsten-carbide", 5 },
    --     },
    --     show_amount_in_title = false,
    --     allow_productivity = true,
    --     groups = { "vgal-unsure" },
    -- },
    -- {
    --     type = "recipe",
    --     name = "fluorine-lithium-rocket-fuel", -- Lithium-Fluorine propellant!
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("rocket-fuel"),
    --         vgal.icon.get_in("fluorine"),
    --     },
    --     category = "cryogenics",
    --     energy_required = 10,
    --     technology = "lithium-processing",
    --     ingredients = {
    --         { "lithium",      1 }, -- 150
    --         { "copper-plate", 1 }, --
    --     },
    --     fluid_ingredients = {
    --         { "fluorine", 30 }, -- 200
    --     },
    --     results = {
    --         { "rocket-fuel", 1 }, -- high ef-coefficient bc of the holmium.
    --     },
    --     groups = { "vgal-unsure" },
    -- },
    -- {
    --     type = "recipe",
    --     name = "lithium-brine-solid-fuel",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("solid-fuel"),
    --         vgal.icon.get_in("lithium-brine"),
    --     },
    --     category = "cryogenics",
    --     energy_required = 8,
    --     technology = "lithium-processing",
    --     ingredients = {
    --         { "copper-plate", 1 },
    --         { "carbon",       2 },
    --     },
    --     fluid_ingredients = {
    --         { "lithium-brine", 20 },
    --     },
    --     results = {
    --         { "solid-fuel", 10 },
    --     },
    --     groups = { "vgal-unsure" },
    -- },
    {
        type = "recipe",
        name = "lithium-battery", -- will be used for alternate cryogenic science recipe but currently NO ONE (no one) will be using it.
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("battery"),
            vgal.icon.get_in("lithium"),
        },
        category = "chemistry-or-cryogenics",
        energy_required = 10, -- fast
        technology = "lithium-processing",
        fluid_ingredients = {
            { "ammonia", 10 }, -- 20
        },
        ingredients = {
            { "lithium",      1 }, -- 150
            { "copper-plate", 5 }, -- 50
        },
        results = {
            { "battery", 5 }, -- 250
        },
    },
    -- {
    --     type = "recipe",
    --     name = "crude-oil-carbon",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("carbon"),
    --         vgal.icon.get_in("crude-oil"),
    --     },
    --     category = "cryogenics",
    --     energy_required = 0.5,
    --     technology = "lithium-processing",
    --     fluid_ingredients = {
    --         { "crude-oil", 80 },
    --     },
    --     results = {
    --         { "carbon", 1, { probability = 0.25 } },
    --     },
    -- },
    -- {
    --     type = "recipe",
    --     name = "fluorine-superconductor",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("superconductor"),
    --         vgal.icon.get_in("fluorine"),
    --     },
    --     category = "cryogenics",
    --     energy_required = 10,
    --     technology = "lithium-processing",
    --     ingredients = {
    --         { "copper-plate", 2 }, --
    --     },
    --     fluid_ingredients = {
    --         { "fluorine",  10 }, --
    --         { "light-oil", 5 },  --
    --     },
    --     results = {
    --         { "superconductor", 2 },
    --     },
    --     show_amount_in_title = false,
    -- },
}, {
    type = "recipe",
})

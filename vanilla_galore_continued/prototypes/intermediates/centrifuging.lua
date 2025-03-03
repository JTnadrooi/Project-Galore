vgal.data.extend
{
    {
        type = "recipe",
        name = "crude-oil-coal", -- not in sa-gal
        prefix = "vgal",
        icons = vgal.icon.register {
            -- vgal.icon.get("crude-oil"),
            -- vgal.icon.get_overlay("circle"),
            vgal.icon.get("coal"),
            vgal.icon.get_in_fluid("crude-oil"),
        },
        category = "centrifuging",
        energy_required = 6,
        technology = "uranium-processing",
        fluid_ingredients = {
            { "crude-oil", 100 }, -- 50
        },
        results = {
            { "coal", nil, { amount_min = 2, amount_max = 4 } } -- 20
        },
        show_amount_in_title = false,
        crafting_machine_tint = vgal.recipe.TINT_CATALOG["crude-oil"],
    },
}

local centrifuge_results = {
    "copper-ore", "iron-ore"
}
local alt_electric_engines = true
for _, result in ipairs(centrifuge_results) do
    vgal.data.extend
    {
        {
            type = "recipe",
            name = "water-" .. result, -- not in sa-gal
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get(result),
                vgal.icon.get_in_fluid("water"),
            },
            category = "centrifuging",
            energy_required = 4,
            technology = "uranium-processing",
            fluid_ingredients = {
                { "water", 80 },
            },
            results = {
                { result,  nil, { amount_min = 1, amount_max = 2 } }, -- 15
                { "stone", nil, { probability = 0.2 } }               -- 2
            },
            show_amount_in_title = false,
            crafting_machine_tint = vgal.recipe.TINT_CATALOG["black"],
            deep_hide = mods["space-age"]
        },
    }
    vgal.data.extend
    {
        {
            type = "recipe",
            name = "water-electric-engine-unit-" .. result, -- not in sa-gal
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get(result),
                vgal.icon.get_in_fluid("water"),
                vgal.icon.get_in_fluid2("electric-engine-unit"),
            },
            category = "centrifuging",
            energy_required = 4,
            technology = {"uranium-processing", "electric-engine"},
            fluid_ingredients = {
                { "water", 120 },
            },
            ingredients = {
                { "electric-engine-unit", 1 }, -- 2
            },
            results = {
                { result,                 nil, { amount_min = 3, amount_max = 5 } }, -- 40
                { "stone",                nil, { probability = 0.25 } },             -- 2.5
                { "electric-engine-unit", nil, { probability = 0.98 } },             -- 0.02*180~=4
            },
            show_amount_in_title = false,
            crafting_machine_tint = vgal.recipe.TINT_CATALOG["black"],
            deep_hide = mods["space-age"]
        },
    }
end

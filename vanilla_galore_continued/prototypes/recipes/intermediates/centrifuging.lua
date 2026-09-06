vgal.extend({
    {
        type = "recipe",
        name = "crude-oil-coal", -- not in sa-gal
        prefix = "vgal",
        icons = vgal.icon.create({
            inputs = { "crude-oil" },
            outputs = { "coal" },
            style = "fluid",
        }),
        category = "centrifuging",
        energy_required = 6,
        technology = "uranium-processing",
        fluid_ingredients = {
            { "crude-oil", 100 }, -- 50
        },
        results = {
            { "coal", nil, { amount_min = 2, amount_max = 4 } } -- 20
        },
        crafting_machine_tint = vgal.defines.tints["crude-oil"],
        groups = { "vgal-renewable-ores" },
    },
}, {
    type = "recipe",
})

for _, result in ipairs({
    "copper-ore", "iron-ore"
}) do
    local order = result == "iron-ore" and "ra" or "rb"
    vgal.extend({
        {
            name = "water-" .. result, -- not in sa-gal
            prefix = "vgal",
            icons = vgal.icon.create({
                inputs = { "water" },
                outputs = { result },
                style = "fluid",
            }),
            category = "centrifuging",
            energy_required = 4,
            technology = "uranium-processing",
            fluid_ingredients = {
                { "water", 40 },
            },
            results = {
                { result,  nil, { amount_min = 1, amount_max = 2 } }, -- 15
                { "stone", 1,   { independent_probability = 0.2 } }   -- 2
            },
            show_amount_in_title = false,
            crafting_machine_tint = vgal.defines.tints["black"],
            order = order,
            groups = { "vgal-renewable-ores" },
        },
        {
            name = "water-electric-engine-unit-" .. result, -- not in sagal
            prefix = "vgal",
            icons = vgal.icon.create({
                inputs = { "water", "electric-engine-unit" },
                outputs = { result },
                style = "fluid",
            }),
            category = "centrifuging",
            energy_required = 4,
            technology = { "uranium-processing", "electric-engine" },
            fluid_ingredients = {
                { "water", 60 },
            },
            ingredients = {
                { "electric-engine-unit", 1 }, -- 2
            },
            results = {
                { result,                 nil, { amount_min = 3, amount_max = 5 } }, -- 40
                { "stone",                1,   { independent_probability = 0.25 } }, -- 2.5
                { "electric-engine-unit", 1,   { independent_probability = 0.98 } }, -- 0.02*180~=4
            },
            show_amount_in_title = false,
            crafting_machine_tint = vgal.defines.tints["black"],
            order = order .. "b",
            groups = { "vgal-renewable-ores" },
        },
    }, {
        type = "recipe",
    })
end

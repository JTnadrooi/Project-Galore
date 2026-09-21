for _, metal in pairs(vgal.defines.metals) do
    vgal.extend({
        {
            name = "lava-" .. metal.pebbles,
            prefix = "vgal",
            icons = vgal.icon.create({
                style   = "angels-liquid",
                outputs = { metal.pebbles },
                palette = { { 202, 099, 017 }, { 099, 031, 032 }, { 099, 031, 032 } },
            }),
            -- icons = vgal.icon.merge_composites({
            --     vgal.icon.get("lava"),
            --     vgal.icon.shift(vgal.icon.get(metal.pebbles), (10.24 / 32), { -12, 12 })
            -- }),
            energy_required = 2,
            technology = "planet-discovery-vulcanus",
            ingredients = {
                { "lava", 50 }
            },
            results = {
                { metal.pebbles, nil, { amount_min = 1, amount_max = 4 } },
                { "angels-slag", 2 },
            },
            category = "angels-crystallizing",

            order = "b-b[crystallizing]-c",
        },
    }, {
        type = "recipe",
    })
end

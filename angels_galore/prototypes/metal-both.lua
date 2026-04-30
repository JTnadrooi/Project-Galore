for _, metal in pairs(vgal.defines.metals) do
    -- local pebbles_tech = (metal == "copper") and "angels-ore-floatation" or "angels-ore-crushing"  -- not used as you still need to crush ore into pebbles, you can't smelt ore

    vgal.data.extend({
        --- nugget/slag and pebbles recipes ---
        {
            name = metal.nugget .. "-" .. metal.ore,
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get("angels_sorting", "raw"),
                vgal.icon.get_in(metal.nugget),
                vgal.icon.get_out2(metal.ore),
            },
            energy_required = 1,
            technology = "angels-advanced-ore-refining-1",
            ingredients = {
                { metal.pebbles, 4 },
                { metal.nugget,  1 },
            },
            results = {
                { metal.ore, 4 },
            },
            category = "angels-ore-sorting",
        },
        {
            name = metal.slag .. "-" .. metal.ore,
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get("angels_sorting", "raw"),
                vgal.icon.get_in(metal.slag),
                vgal.icon.get_out2(metal.ore),
            },
            energy_required = 1,
            technology = "angels-ore-leaching",
            ingredients = {
                { metal.pebbles, 3 },
                { metal.slag,    1 },
            },
            results = {
                { metal.ore, 3 },
            },
            category = "angels-ore-sorting",
        },

        --- plate recipes
        -- { -- its better to change the default ...-plate recipes instead, for factoriopedia purposes.
        --     name = base_ore .. "-" .. plate,
        --     prefix = "vgal",
        --     icons = vgal.icon.register {
        --         vgal.icon.get(plate),
        --         vgal.icon.get_in(base_ore),
        --     },
        --     energy_required = 9.6,
        --     technology = "angels-ore-crushing",
        --     ingredients = {
        --         { base_ore, 3 },
        --     },
        --     results = {
        --         { plate, 2 },
        --     },
        --     category = "smelting",
        -- },
        {
            name = metal.pebbles .. "-" .. metal.plate,
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get(metal.plate),
                vgal.icon.get_in(metal.pebbles),
            },
            energy_required = 6.4,
            technology = "angels-ore-crushing",
            ingredients = {
                { metal.pebbles, 4 },
            },
            results = {
                { metal.plate, 2 },
            },
            category = "smelting",
        },
        {
            name = metal.nugget .. "-" .. metal.plate,
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get(metal.plate),
                vgal.icon.get_in(metal.nugget),
            },
            energy_required = 6.4,
            technology = "angels-ore-crushing",
            ingredients = {
                { metal.nugget, 2 },
            },
            results = {
                { metal.plate, 3 },
            },
            category = "smelting",
        },
    }, {
        type = "recipe",
    })
end

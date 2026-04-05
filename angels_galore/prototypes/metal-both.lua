for _, metal in ipairs(vgal.constants.METALS) do
    local ore_index = (metal == "copper") and 2 or 3
    local nugget = "angels-" .. metal .. "-nugget"
    local slag = "angels-" .. metal .. "-slag"
    local pebbles = "angels-" .. metal .. "-pebbles"
    local ore = metal .. "-ore"
    local base_ore = "angels-ore" .. ore_index
    local plate = metal .. "-plate"

    -- local pebbles_tech = (metal == "copper") and "angels-ore-floatation" or "angels-ore-crushing"  -- not used as you still need to crush ore into pebbles, you can't smelt ore

    vgal.data.extend({
        --- nugget/slag and pebbles recipes ---
        {
            name = nugget .. "-" .. ore,
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get("angels_sorting", "raw"),
                vgal.icon.get_in(nugget),
                vgal.icon.get_out2(ore),
            },
            energy_required = 1,
            technology = "angels-advanced-ore-refining-1",
            ingredients = {
                { pebbles, 4 },
                { nugget,  1 },
            },
            results = {
                { ore, 4 },
            },
            category = "angels-ore-sorting",
        },
        {
            name = slag .. "-" .. ore,
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get("angels_sorting", "raw"),
                vgal.icon.get_in(slag),
                vgal.icon.get_out2(ore),
            },
            energy_required = 1,
            technology = "angels-ore-leaching",
            ingredients = {
                { pebbles, 3 },
                { slag,    1 },
            },
            results = {
                { metal .. "-ore", 3 },
            },
            category = "angels-ore-sorting",
        },
        {
            name = ore .. "-" .. pebbles,
            prefix = "vgal",
            icons = vgal.icon.register {
                -- vgal.icon.get("angels_crushing", "raw"),
                -- vgal.icon.get_out(metal .. "-ore"),

                vgal.icon.get("angels_crushing", "raw"),
                vgal.icon.get_out2(pebbles),
            },
            energy_required = 1,
            technology = "angels-ore-crushing",
            ingredients = {
                { metal .. "-ore", 2 },
            },
            results = {
                { pebbles, 4 },
            },
            category = "angels-ore-refining-t1",
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
            name = pebbles .. "-" .. plate,
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get(plate),
                vgal.icon.get_in(pebbles),
            },
            energy_required = 6.4,
            technology = "angels-ore-crushing",
            ingredients = {
                { pebbles, 4 },
            },
            results = {
                { plate, 2 },
            },
            category = "smelting",
        },
        {
            name = nugget .. "-" .. plate,
            prefix = "vgal",
            icons = vgal.icon.register {
                vgal.icon.get(plate),
                vgal.icon.get_in(nugget),
            },
            energy_required = 6.4,
            technology = "angels-ore-crushing",
            ingredients = {
                { nugget, 2 },
            },
            results = {
                { plate, 3 },
            },
            category = "smelting",
        },
    }, {
        type = "recipe",
    })
end

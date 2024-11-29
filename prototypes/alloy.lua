-- casting efficiency is 1.5 (2 ore = 3 plate)
-- alloy efficiency is 1.25
-- alloy casting efficiency is 1.8, unused

vgal.data.extend {
    -- region *alloy-copper-iron
    {
        type = "recipe",
        name = "vgal-alloy-copper-iron",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("iron-plate"),
            vgal.icon.get_in("copper-ore")
        },
        energy_required = 48,
        ingredients = {
            { type = "item", name = "iron-ore",   amount = 10 },
            { type = "item", name = "copper-ore", amount = 2 },
        },
        results = {
            { type = "item", name = "iron-plate", amount = 15 } -- 1.25ec
        },
        category = "smelting",
        subgroup = data.raw.item["iron-plate"].subgroup,
        order = data.raw.item["iron-plate"].order
    },
    -- endregion
    -- region *alloy-iron-copper
    {
        type = "recipe",
        name = "vgal-alloy-iron-copper",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("copper-plate"),
            vgal.icon.get_in("iron-ore")
        },
        energy_required = 48,
        ingredients = {
            { type = "item", name = "copper-ore", amount = 10 },
            { type = "item", name = "iron-ore",   amount = 2 },
        },
        results = {
            { type = "item", name = "copper-plate", amount = 15 } -- 1.25ec
        },
        category = "smelting",
        subgroup = data.raw.item["copper-plate"].subgroup,
        order = data.raw.item["copper-plate"].order
    },
    -- endregion
    -- region *alloy-steel
    {
        type = "recipe",
        name = "vgal-alloy-steel",
        enabled = false,
        icons = vgal.icon.register {
            vgal.icon.get("steel-plate"),
            vgal.icon.get_in("coal")
        },
        energy_required = 16,
        ingredients = {
            { type = "item", name = "coal",       amount = 4 },
            { type = "item", name = "iron-plate", amount = 12 },
        },
        results = {
            { type = "item", name = "steel-plate", amount = 4 }, -- 1.75ec t
            { type = "item", name = "coal",        amount = 1 },
        },
        category = "smelting",
        subgroup = data.raw.item["steel-plate"].subgroup,
        order = data.raw.item["steel-plate"].order
    },
    -- endregion
}
vgal.tech.add_recipe("vgal-alloy-smelting", "vgal-alloy-copper-iron")
vgal.tech.add_recipe("vgal-alloy-smelting", "vgal-alloy-iron-copper")
vgal.tech.add_recipe("vgal-steel-processing-2", "vgal-alloy-steel") -- not rly an alloy I guess

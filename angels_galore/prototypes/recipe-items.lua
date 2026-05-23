-- I refer to items only used as some sorts of catalyst in recipes as "recipe items"
vgal.data.extend({
    -- crafting
    {
        name = "angels-liquid-molten-iron-angels-catalyst-metal-carrier",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-catalyst-metal-carrier"),
            vgal.icon.get_in("angels-liquid-molten-iron"),
        },
        energy_required = 0.5,
        technology = { "angels-metallurgy-2", "angels-basic-chemistry-3" },
        ingredients = {
            { "angels-solid-sand", 5 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-iron", 50 },
        },
        results = {
            { "angels-catalyst-metal-carrier", 10 },
        },
        category = "angels-casting",
    },
    {
        name = "angels-liquid-molten-iron-angels-filter-frame",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-filter-frame"),
            vgal.icon.get_in("angels-liquid-molten-steel"),
        },
        energy_required = 1,
        technology = { "angels-metallurgy-2", "angels-slag-processing-1" },
        ingredients = {
            { "angels-solid-sand", 1 },
            { "iron-plate",        2 },
        },
        fluid_ingredients = {
            { "angels-liquid-molten-steel", 15 },
        },
        results = {
            { "angels-filter-frame", 2 },
        },
        category = "angels-casting",
    },
    {
        name = "steel-plate-angels-solid-saw",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-saw"),
            vgal.icon.get_in("steel-plate"),
        },
        energy_required = 6,
        technology = "angels-bio-arboretum-1",
        ingredients = {
            { "steel-plate", 1 },
        },
        results = {
            { "angels-solid-saw", 5 },
        },
        category = "crafting",
        order = "aba",
    },

    -- refurbishing
}, {
    type = "recipe",
})

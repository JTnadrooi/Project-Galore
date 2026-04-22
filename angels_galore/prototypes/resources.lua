vgal.data.extend({
    {
        name = "angels-slag-angels-stone-crushed", -- the default "angels-stone-crushed" recipe now requires stone
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-stone-crushed"),
            vgal.icon.get_in("angels-slag"),
        },
        energy_required = 1,
        technology = "angels-ore-crushing",
        ingredients = {
            { "angels-slag", 1 },
        },
        results = {
            { "angels-stone-crushed", 2 },
        },
        category = "angels-ore-refining-t1",
    },
    {
        name = "angels-stone-crushed-angels-solid-sand",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-sand"),
            vgal.icon.get_in("angels-stone-crushed"),
        },
        energy_required = 1,
        technology = "angels-stone-smelting-1",
        ingredients = {
            { "angels-stone-crushed", 2 },
        },
        results = {
            { "angels-solid-sand", 3 },
        },
        category = "angels-ore-refining-t1",
    },
    {
        name = "angels-stone-crushed-stone",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("stone"),
            -- vgal.icon.get_in("angels-stone-crushed"),
        },
        energy_required = 3.2,
        enabled = true,
        ingredients = {
            { "angels-stone-crushed", 4 },
        },
        results = {
            { "stone", 2 },
        },
        allow_productivity = false,
        category = "smelting",
    },
    {
        name = "angels-solid-sand-angels-solid-mud",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("angels-solid-mud"),
            -- vgal.icon.get_in("angels-solid-sand"),
        },
        energy_required = 2,
        technology = "angels-stone-smelting-1",
        ingredients = {
            { "angels-solid-sand", 5 },
            { "angels-solid-clay", 1 },
        },
        fluid_ingredients = {
            { "angels-water-mineralized", 20 },
        },
        results = {
            { "angels-solid-mud", 5 },
        },
        category = "angels-liquifying",
    },
}, {
    type = "recipe",
})

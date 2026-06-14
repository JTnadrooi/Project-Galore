vgal.data.extend({
    {
        name = "engine-unit-rocket-part",
        prefix = "vgal",
        technology = "rocket-silo",
        icons = vgal.icon.register {
            vgal.icon.get("rocket-part"),
            vgal.icon.get_in("engine-unit")
        },
        energy_required = 2,
        ingredients = {
            { "engine-unit",           40 }, -- 3630
            { "rocket-fuel",           20 }, -- 4000
            { "low-density-structure", 10 }, -- 3750
            { "processing-unit",       2 },  -- 1420
        },
        results = {
            { "rocket-part", 1 }, -- 12800
        },
        category = "rocket-building",
    },
    {
        name = "uranium-fuel-cell-rocket-part",
        prefix = "vgal",
        technology = { "rocket-silo", "nuclear-power" },
        icons = vgal.icon.register {
            vgal.icon.get("rocket-part"),
            vgal.icon.get_in("uranium-fuel-cell")
        },
        energy_required = 2,
        ingredients = {
            { "low-density-structure", 10 },  -- 2250
            { "uranium-fuel-cell",     10 }, -- 4600
            { "processing-unit",       10 }, -- 7100
        },
        results = {
            { "rocket-part", 1 }, -- 12800
        },
        category = "rocket-building",
    },
    {
        name = "flying-robot-frame-rocket-part",
        prefix = "vgal",
        technology = "rocket-silo",
        icons = vgal.icon.register {
            vgal.icon.get("rocket-part"),
            vgal.icon.get_in("flying-robot-frame")
        },
        energy_required = 2,
        ingredients = {
            { "flying-robot-frame",    15 },
            { "processing-unit",       4 },  -- 2840
            { "low-density-structure", 10 }, -- 3750
        },
        results = {
            { "rocket-part", 1 }, -- 12800
        },
        groups = { "vgal-convoluted" },
        category = "rocket-building",
    },
}, {
    type = "recipe",
    groups = { "vgal-rocket-parts" }
})

if settings.startup["vgal-rocket-parts"].value == true then
    data.raw.item["rocket-part"].hidden = false
    data.raw.recipe["rocket-part"].hidden = false
    data.raw.recipe["rocket-part"].hide_from_player_crafting = false
    data.raw.recipe["rocket-part"].hidden_in_factoriopedia = false
    -- data.raw.recipe["rocket-part"].hide_from_signal_gui = false
    data.raw.recipe["rocket-part"].hide_from_stats = false
    data.raw["rocket-silo"]["rocket-silo"].fixed_recipe = nil
    data.raw["rocket-silo"]["rocket-silo"].show_recipe_icon = true
end

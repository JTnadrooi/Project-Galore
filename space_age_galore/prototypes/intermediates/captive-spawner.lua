vgal.data.extend({
    {
        name = "petroleum-gas-barrel-biter-egg",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("biter-egg"),
            vgal.icon.get_in("petroleum-gas"),
        },
        energy_required = 5,
        technology = "captivity",
        ingredients = {
            { "petroleum-gas-barrel", 1 },
        },
        results = {
            { "biter-egg", 4 },
            { "barrel",    1 },
        },
        category = "captive-spawner-process",
        preserve_products_in_machine_output = true,
        result_is_always_fresh = true,
    },
    {
        name = "nutrients-biter-egg",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("biter-egg"),
            vgal.icon.get_in("nutrients"),
        },
        energy_required = 3.2,
        technology = "captivity",
        ingredients = {
            { "nutrients", 10 },
        },
        results = {
            { "biter-egg", 2 },
        },
        category = "captive-spawner-process",
        preserve_products_in_machine_output = true,
        result_is_always_fresh = true,
    },
}, {
    groups = { "vgal-captive-spawner-recipes" }
})

if settings.startup["vgal-captive-spawner-recipes"].value == true then
    data.raw.item["biter-egg"].hidden = false
    data.raw.recipe["biter-egg"].hidden = false
    data.raw.recipe["biter-egg"].hide_from_player_crafting = false
    data.raw.recipe["biter-egg"].hidden_in_factoriopedia = false
    data.raw.recipe["biter-egg"].hide_from_stats = false
    data.raw["assembling-machine"]["captive-biter-spawner"].fixed_recipe = nil
    data.raw["assembling-machine"]["captive-biter-spawner"].show_recipe_icon = true
end

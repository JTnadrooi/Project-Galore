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
            { "barrel",    1, { probability = 0.90 } },
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
    {
        name = "pentapod-egg-biter-egg-duel-biter-preferred",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("biter-egg"),
            vgal.icon.get_in("biter-egg"),
            vgal.icon.get_in2("pentapod-egg"),
        },
        energy_required = 5,
        technology = "captivity",
        ingredients = {
            { "petroleum-gas-barrel", 1 },
            { "pentapod-egg",         1 },
            { "biter-egg",            1 },
        },
        results = {
            { "military-science-pack", 25 },
            { "biter-egg",             1, { probability = 0.80 } },
            { "pentapod-egg",          1, { probability = 0.20 } },
            { "barrel",                1, { probability = 0.85 } },
        },
        category = "captive-spawner-process",
        allow_productivity = false,
        surface_conditions =
        {
            {
                property = "pressure",
                min = 1000,
                max = 1000
            }
        },
        order = "ga",
        groups = { "vgal-silly-recipes" },
    },
    {
        name = "pentapod-egg-biter-egg-duel-pentapod-preferred",
        prefix = "vgal",
        icons = vgal.icon.register {
            vgal.icon.get("pentapod-egg"),
            vgal.icon.get_in("biter-egg"),
            vgal.icon.get_in2("pentapod-egg"),
        },
        energy_required = 5,
        technology = "captivity",
        ingredients = {
            { "ammonia-barrel", 1 },
            { "pentapod-egg",   1 },
            { "biter-egg",      1 },
        },
        results = {
            { "military-science-pack", 15 },
            { "biter-egg",             1, { probability = 0.20 } },
            { "pentapod-egg",          1, { probability = 0.80 } },
            { "barrel",                1, { probability = 0.85 } },
        },
        category = "captive-spawner-process",
        allow_productivity = false,
        surface_conditions =
        {
            {
                property = "pressure",
                min = 1000,
                max = 1000
            }
        },
        order = "gb",
        groups = { "vgal-silly-recipes" },
    },
    -- {
    --     name = "pentapod-egg-biter-egg-duel-military-science-pack",
    --     prefix = "vgal",
    --     icons = vgal.icon.register {
    --         vgal.icon.get("military-science-pack"),
    --         vgal.icon.get_in("biter-egg"),
    --         vgal.icon.get_in("pentapod-egg"),
    --     },
    --     energy_required = 3.2,
    --     technology = "captivity",
    --     ingredients = {
    --         { "pentapod-egg", 1 },
    --         { "biter-egg",    1 },
    --     },
    --     results = {
    --         { "biter-egg",    1, { probability = 0.20 } },
    --         { "pentapod-egg", 1, { probability = 0.80 } },
    --     },
    --     category = "captive-spawner-process",
    --     allow_productivity = false,
    --     -- preserve_products_in_machine_output = true,
    --     groups = { "vgal-funny" },
    -- },
}, {
    type = "recipe",
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
